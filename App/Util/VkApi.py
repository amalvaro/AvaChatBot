
import random
from App.Util.Logger import *
from App.Database.Database import Database



def write_msg(vk_session, chat_id, message):
    print('Outcoming request %d:%s' % (chat_id,message) )
    database = Database()
    try:
        vk_session.method('messages.send', {'chat_id': chat_id, 'message': message, 'random_id': random.randint(0, 1000000000)})
    except Exception as e:
        database.add_event(chat_id, e)