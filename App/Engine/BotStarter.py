
# Requires

import vk_api
from vk_api.bot_longpoll import VkBotLongPoll, VkBotEventType
import re
import threading
from App.Util.VkApi import write_msg

# Commands
from App.Commands.Commands import *

# Класс-родитель
class BotStarter:
    def __init__(self, longpoll, vk_session):
        self.longpoll=longpoll
        self.vk_session=vk_session

    def startListening(self):
        reactor = MessageChatReactor(self.vk_session)
        for event in self.longpoll.listen():
            thread = threading.Thread(target=reactor.react, args=(event,))
            thread.start()
            #reactor.react(event)

# Обработка общих событий.
class MessageChatReactor:

    def __init__(self, vk_session):
        self.vk_session=vk_session

    def react(self, event):
        if event.from_user:
            self.vk_session.method('messages.send', {'user_id': user_id, 'message': "Привет! Тебе отвечает бот Ава от паблика изолофобия.\nЯ предназначена для игры в слова с друзьями!\nДля того чтобы поиграть ты можешь присоединиться к нашей беседе - https://vk.me/join/AJQ1d6GcXRZuhzFZNZo0Usv8 или создать свою", 'random_id': random.randint(0, 1000000000)})
        if event.from_chat:
            if event.type==VkBotEventType.MESSAGE_NEW:
                if(event.obj.action != None):

                    if("type" in event.obj.action.keys() and "member_id" in event.obj.action.keys()):
                        type=event.obj.action["type"]
                        member_id = event.obj.action["member_id"]
                        # -188223689 - Your group id
                        if(member_id == -188223689 and type == "chat_invite_user"):
                            print("Invite to chat - %d" % (event.chat_id))
                            OnChatBotInvite(event, self.vk_session)
                        elif type == "chat_invite_user":
                            # Знакомство игроков с ботом.
                            write_msg(self.vk_session, event.chat_id, "@id%s приветствуют тебя! Я бот для игры в слова Ава!\nИнформация обо мне - напиши в чат: ава инфо" % (member_id));
                else:
                    messageClassifier = MessageClassifyEvent(self.vk_session)
                    messageClassifier.classify(event)


class MessageClassifyEvent:

    MAIN_COMMAND_REGEX = 'ава,{0,} {0,}(.*)'
    COMMANDS_REGEX = [
        [r"начать.*", OnChatBotGameStart],
        [r"начать игру.*", OnChatBotGameStart],
        [r"информация.*", OnChatBotInfo],
        [r"помощь.*", OnChatBotInfo],
        [r"инфо.*", OnChatBotInfo],
        [r"моя статистика.*", OnChatMyStats],
        [r"остановись.*", OnChatBotStop],
        [r"остановить.*", OnChatBotStop],
        [r"стоп.*", OnChatBotStop],
        [r"([a-zA-Zа-яА-Я]*) {0,} уровень.*", OnChatBotSetLevel]
    ]

    def __init__(self, session):
        self.vksession=session

    def classify(self, event):

        try:
            #print("Incoming request from chat - [%d, uid%s] %s" % (event.chat_id, event.obj.from_id, event.obj.text))
            #print("Incoming request from chat %d" % (chat_id))
            if event.chat_id in cache_chat_state.keys():
                if cache_chat_state[event.chat_id]["game_state"]== GAME_STATE.GAME_WAIT_ANSWER:
                    OnChatRecieveAnswer(event, self.vksession)

            request = re.match(r'ава,{0,} {0,}(.*)', event.obj.text, re.MULTILINE | re.IGNORECASE)
            if request == None:
                print("Request is none")
                return None

            if len(request.groups()) < 1:
                print("Count params less than one")
                return None

            request = request.group(1)
            request = request.strip()

            if len(request) == 0:
                print("Empty command")
                return None

            for command in self.COMMANDS_REGEX:
                matches = re.match(command[0], request, re.MULTILINE | re.IGNORECASE)
                if matches != None:
                    count_params = len(matches.groups())
                    params_array = []

                    for i in range(1, count_params + 1):
                        params_array += [matches.group(i).strip()]

                    if(count_params > 0):
                        print("команда с параметрами")
                        return command[1](event, self.vksession, params_array)
                    else:
                        print("команда без параметров")
                        return command[1](event, self.vksession)

                    break;

        except Exception as e:
            print("Classify exception")
            print(e)
