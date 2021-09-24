
import mysql.connector

class Database:

    host        =   "localhost"
    login       =   "root"
    password    =   ""
    database    =   "botanagram"

    def __init__(self):
        self.database = mysql.connector.connect(host=self.host, database=self.database, user=self.login, password=self.password)

    # def
    def execute(self, command, params = None):
        try:
            cur = self.database.cursor()
            if(params != None):
                cur.execute(command, params)
            else:
                cur.execute(command)
            self.database.commit()
            cur.close()
        except Exception as e:
            print("Troubles with SQL query. Command = %s, Params = %s" % (command, params))
            print("Stack trace: ")
            print(e)
            print(e.__traceback__)

    def get_cursor(self, command, params = None):
        try:
            cur = self.database.cursor()
            if(params != None):
                cur.execute(command, params)
            else:
                cur.execute(command)

            return cur

        except Exception as e:
            print("Troubles with SQL query. Command = %s, Params = %s" % (command, params))
            print("Stack trace: ")
            print(e)
            print(e.__traceback__)

    def callproc(self, cmd, args):
        cur = self.database.cursor()
        cur.callproc(cmd, args)
        self.database.commit()

    def register_chat(self, event):
        #self.callproc("register_chat", (event.chat_id,))
        self.execute("INSERT INTO chat_info (chat_id) values (%s)", (event.chat_id,))


    def add_event(self, chat_id, text):
        #call add_event(%s, %s)
        self.execute("INSERT INTO events (chat_id, text) values (%s, %s)", (chat_id, text))

    def get_random_word(self):
        cur = self.get_cursor("select word from words order by rand() limit 1")
        result = cur.fetchall()
        cur.close()
        return result[0][0]

    def add_winner(self, chat_id, user_id, reaction):
        # self.callproc("add_winner", (chat_id,user_id, reaction))
        self.execute("INSERT INTO winner (chat_id, user_id, reaction) values (%s,%s,%s)", (chat_id,user_id,reaction))

    def get_level(self, chat_id):
        cur = self.get_cursor("select game_level from chat_info where chat_id=%s limit 1", (chat_id,))
        result = cur.fetchall()
        if(len(result) == 1):
            result = result[0][0]
        else:
            result = 0
        cur.close()

        return result

    def set_level(self, chat_id, game_level):
        cur = self.get_cursor("update chat_info set game_level=%s where chat_id=%s", (game_level, chat_id))
        self.database.commit()
        cur.close()
    def get_stat(self, user_id):
        cur = self.get_cursor("select count(*), avg(reaction) from winner where user_id=%s GROUP by user_id limit 1",
                              (user_id, ))

        result =  cur.fetchall();
        cur.close()

        return result