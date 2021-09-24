# 96b7bf44e0015641a41c5f4c7e19873200a29f09a42839fc005f8cdd623aa727078232099cdd60428af31

import vk_api
from vk_api.bot_longpoll import VkBotLongPoll, VkBotEventType
import random

from App.Engine.BotStarter import BotStarter


def write_msg(user_id, message):
    vk_session.method('messages.send', {'chat_id': user_id, 'message': message, 'random_id': random.randint(0, 1000000000)})

token = "72ed1d031cad818d5eb0cb3fe0c4a77fa38a8a63509bb7d0e8bf8d22272933f03b7a3341ead555cf0310d"

import time

class VkBotLongPollModify(VkBotLongPoll):
    def listen(self):

        while(True):
            time.sleep(5)
            print("Start listening")
            try:
                for event in self.check():
                    yield event
            except Exception as e:
                print("_____ ERROR CHECKING _______")
                print(e)

vk_session = vk_api.VkApi(token=token)
longpoll = VkBotLongPollModify(vk_session, 188223689)



bot = BotStarter(longpoll, vk_session)
bot.startListening()
