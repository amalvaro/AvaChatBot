
from App.Util.VkApi import *
from App.Database.Database import Database
from App.Util.Logger import *
from threading import Timer
import time
from App.Util.WordConstructor import WordConstructor
import collections
import operator

# Кэш игровых данных
cache_chat_state=dict()

# chat temp data = (level of game - easy or hard, other limits)
chat_temp = dict() # {game_level: GAME_EASY}
#requests.exceptions.ReadTimeout: HTTPSConnectionPool(host='lp.vk.com', port=443): Read timed out. (read timeout=35)

# База данных
#database = Database()


class GAME_STATE:
    GAME_NOT_STARTED    = 0
    GAME_WAIT           = 1
    GAME_WAIT_NEXT_WORD = 2
    GAME_WAIT_ANSWER    = 3
class GAME_LEVEL:
    EASY_GAME = 0
    HARD_GAME = 1
    EASY_GAME_S = "легкий"
    HARD_GAME_S = "сложный"

WAIT_PRE_GAME           = 10 # SEC
WAIT_AFTER_WORD         = 5
DEFAULT_ROUND_COUNT     = 15
MAX_WORD_WAITING        = 25

def OnChatBotInvite(event, session):
    # add_event(chatId INT, textVar varchar(250) )
    database = Database()
    database.add_event(event.chat_id, "Бот добавлен в чат")
    database.register_chat(event);

    OnChatBotInfo(event, session);
    #"3. Ава, статистика по беседе\n"
    #"4. Ава, моя статистика\n"
    #"5. Ава, общая статистика"

def OnChatBotInfo(event, session):
    write_msg(session, event.chat_id,
              "Всем привет, я игровой анаграмм-бот Ава от паблика изолофобия! ❤ \n"
              "🔥 Со мной можно поиграть в слова!\n\n"
              "🔥 Для правильной работы мне необходимо дать доступ к данной переписке (найди меня в списке участников и нажми кнопку 'Дать доступ ко всей переписке'\n\n"
              "🔥 Что такое анаграммы и как в них играть? Всё очень просто - я загадываю слово и пишу буквы, из которых оно состоит, в разброс. Кто первый соберет(отгадает) слово, тот и победил!\n\n"

              #"&#128293; Как начать игру в анаграммы? Всё также очень просто. \n"
              #"&#9989; Напишите в чат - ава начать игру \n"
              #"&#9989; Дождитесь последующий указаний от меня.\n"
              #"&#9989; Итоги игры подводятся по окончанию 15 раундов.\n\n"
              #"&#9989; Итоги игры подводятся по окончанию 15 раундов.\n\n"

              "&#128293; Мои команды: \n"
              "&#9989; Ава, начать игру\n"
              "&#9989; Ава, информация/помощь/инфо\n"
              "&#9989; Ава, остановись/стоп/остановить (остановить игру)\n"
              "&#9989; Ава, легкий уровень\n"
              "&#9989; Ава, сложный уровень\n"
              "&#9989; Ава, моя статистика");



def chatSetTempData(chat_id, field, value):
    if (chat_id in chat_temp):
        #print(type(chat_temp[chat_id]))
        if type(chat_temp[chat_id]) != dict:
            chat_temp[chat_id] = dict()
    else:
        chat_temp[chat_id] = dict()

    chat_temp[chat_id][field]=value;
def chatGetTempData(chat_id, field):
    if (chat_id not in chat_temp):
        return None

    if field not in chat_temp[chat_id]:
        return None

    return chat_temp[chat_id][field]

def OnChatBotGameStart(event, session):

    if event.chat_id not in cache_chat_state.keys():
        cache_chat_state[event.chat_id] = {
            "game_state" :        GAME_STATE.GAME_WAIT,
            "current_round":      0,
            "current_word":       None,
            "owner":              event.obj.from_id,
            "timestamp_start":    round(time.time() * 1000),
            #"timestamp_activity": time.time(),
            "timer":              Timer(WAIT_PRE_GAME, OnChatGenerateWord, (event, session)),
            "users": {}
        }

        cache_chat_state[event.chat_id]["timer"].start()

        write_msg(session, event.chat_id,
                  "Игра запущена! Все готовы? Начинаем через 10 секунд!\n"
                  "Правила просты - собрать слово из разбросанных букв и написать его в чат.")
        database = Database()
        database.add_event(event.chat_id, "Начата игра")

        if chatGetTempData(event.chat_id, "game_level") == None:
            chatSetTempData(event.chat_id, "game_level", database.get_level(event.chat_id))


    else:
        write_msg(session, event.chat_id, "Игра уже начата")
# Подведение итогов
def Summarizing(event, session):
    try:

        print(cache_chat_state[event.chat_id]["users"])
        player_scores = sorted(cache_chat_state[event.chat_id]["users"].items(), key=operator.itemgetter(1), reverse=True)
        output_string = "Итак, игра окончена - подводим итоги.\n"

        if(len(player_scores) == 0):
            output_string = "Итак, игра окончена - деятельность участников не зафиксирована.\n"
            write_msg(session, event.chat_id, output_string)
            del cache_chat_state[event.chat_id]
            return

        for i in range(0, len(player_scores)):
            output_string += "%d. @id%s - %d баллов(а,л)\n" % (i + 1, player_scores[i][0], player_scores[i][1]);
        del cache_chat_state[event.chat_id]

        write_msg(session, event.chat_id, output_string)

    except Exception as e:
        print("Подведение итогов: ")
        print(e)

    pass
def OnChatGenerateWord(event, session):

    if cache_chat_state[event.chat_id]["current_round"] >= DEFAULT_ROUND_COUNT:
        Summarizing(event, session)
        return

    database = Database()
    word = database.get_random_word()

    suffled_word = ""
    ifgenerater = False

    game_level = chatGetTempData(event.chat_id, "game_level")

    if chatGetTempData(event.chat_id, "game_level") == None:
        suffled_word = WordConstructor.scatterEasy(word).upper()
    else:
        if game_level == GAME_LEVEL.EASY_GAME:
            suffled_word = WordConstructor.scatterEasy(word).upper()
        else:
            suffled_word = WordConstructor.scatter(word).upper()

    cache_chat_state[event.chat_id]["timestamp_start"]  = round(time.time() * 1000)
    cache_chat_state[event.chat_id]["game_state"]       = GAME_STATE.GAME_WAIT_ANSWER
    cache_chat_state[event.chat_id]["current_word"]     = word
    cache_chat_state[event.chat_id]["current_round"]    += 1
    cache_chat_state[event.chat_id]["timer"]            = Timer(MAX_WORD_WAITING, OnChatAnswerTimeout, (event, session))
    cache_chat_state[event.chat_id]["timer"].start()
    #print("Текущее слово для чата %d - %s" % (event.chat_id, cache_chat_state[event.chat_id]["current_word"]))
    write_msg(session, event.chat_id, "Текущее слово: %s\n\nПобедит тот, кто первый правильно отгадает данное слово!\nУ вас 25 секунд! Не более!" % (suffled_word))
def OnChatAnswerTimeout(event, session):

    write_msg(session, event.chat_id, "Слово, которое вы не отгадали было - %s\nСледующее слово через 5 секунд." % (cache_chat_state[event.chat_id]["current_word"]))
    cache_chat_state[event.chat_id]["timer"] = Timer(WAIT_AFTER_WORD, OnChatGenerateWord, (event, session))
    cache_chat_state[event.chat_id]["timer"].start()

    pass
def OnChatRecieveAnswer(event, session):

    if event.obj.text.lower().strip() == cache_chat_state[event.chat_id]["current_word"].lower().strip() and cache_chat_state[event.chat_id]["game_state"]==GAME_STATE.GAME_WAIT_ANSWER:
        cache_chat_state[event.chat_id]["game_state"] = GAME_STATE.GAME_WAIT_NEXT_WORD
        if event.obj.from_id not in cache_chat_state[event.chat_id]["users"]:
            cache_chat_state[event.chat_id]["users"][event.obj.from_id] = 1
        else:
            cache_chat_state[event.chat_id]["users"][event.obj.from_id] += 1
        database = Database()

        reaction = (round(time.time() * 1000) - cache_chat_state[event.chat_id]["timestamp_start"]) / 1000

        database.add_winner(event.chat_id, event.obj.from_id, reaction)
        output_string = "У нас есть победитель! И это — @id%s &#128293; \n(количество баллов - %d)\n⏰ Время реакции — %f секунд(а,ы)\n&#9989; Слово - %s\n\n" % \
                        (event.obj.from_id, cache_chat_state[event.chat_id]["users"][event.obj.from_id],
                         reaction,
                         cache_chat_state[event.chat_id]["current_word"])

        # Если это не последний - добавляем строку. Следующее слово через 5 секунд!
        if cache_chat_state[event.chat_id]["current_round"] < DEFAULT_ROUND_COUNT:
            output_string += "Следующее слово через 5 секунд!"

        write_msg(session, event.chat_id,
                output_string)

        if (cache_chat_state[event.chat_id]["timer"] != None):
            if (cache_chat_state[event.chat_id]["timer"].isAlive()):
                cache_chat_state[event.chat_id]["timer"].cancel()
                cache_chat_state[event.chat_id]["timer"] = None

        cache_chat_state[event.chat_id]["timer"] = Timer(WAIT_AFTER_WORD, OnChatGenerateWord, (event, session))
        cache_chat_state[event.chat_id]["timer"].start()
def OnChatBotSearchWord(event, session):

    # Поиск верного слова.


    pass
def OnChatBotStop(event, session):
    if event.chat_id in cache_chat_state:
        if(event.obj.from_id == cache_chat_state[event.chat_id]["owner"]):
            write_msg(session, event.chat_id, "Вы остановили игру")
            if(cache_chat_state[event.chat_id]["timer"] != None):
                if(cache_chat_state[event.chat_id]["timer"].isAlive()):
                    cache_chat_state[event.chat_id]["timer"].cancel()
                    cache_chat_state[event.chat_id]["timer"] = None
            del cache_chat_state[event.chat_id]
        else:
            write_msg(session, event.chat_id, "@id%s вы не можете остановить текущую игру - она была создана @id%s"
                      % (event.obj.from_id, cache_chat_state[event.chat_id]["owner"]))
def OnChatBotSetLevel(event, session, level):
    if level != None:
        if len(level) == 1:
            database = Database()
            param = level[0].strip()
            if(param == GAME_LEVEL.EASY_GAME_S):
                database.set_level(event.chat_id, GAME_LEVEL.EASY_GAME)
                #chat_temp[event.chat_id]["game_level"]=GAME_LEVEL.EASY_GAME
                chatSetTempData(event.chat_id, "game_level", GAME_LEVEL.EASY_GAME)
                write_msg(session, event.chat_id, "Вы изменили уровень игры на легкий");
            elif param == GAME_LEVEL.HARD_GAME_S:
                database.set_level(event.chat_id, GAME_LEVEL.HARD_GAME)
                chatSetTempData(event.chat_id, "game_level", GAME_LEVEL.HARD_GAME)
                write_msg(session, event.chat_id, "Вы изменили уровень игры на сложный");
            else:
                write_msg(session, event.chat_id, "Неверный параметр команды");
def OnChatMyStats(event, session):

    print("статистика")
    database = Database()
    result = database.get_stat(event.obj.from_id)

    if(len(result) == 1):
        write_msg(session, event.chat_id, "💥 Ваша персональная статистика %d - баллов (а,ов), средняя скорость реакции - %f секунд(а,ы)"
                  % (result[0][0], round(result[0][1], 2)));
    else :
        write_msg(session, event.chat_id, "Статистика отсутствует, начинайте играть 😏");
    pass