
import os.path
import datetime



OUTPUT_PATH = "C:\\"
LOG_FILE = "ANAGRAMBOTLOG.TXT"

def write_log(text):
    now = datetime.datetime.now()
    if(os.path.exists(OUTPUT_PATH + LOG_FILE) == False):
        f = open(OUTPUT_PATH + LOG_FILE, 'w')
        f.write("[ " + now.strftime("%d-%m-%Y %H:%M") + " ] " + text + "\n")
        f.close()
    else:
        f = open(OUTPUT_PATH + LOG_FILE, 'a')
        f.write("[ " + now.strftime("%d-%m-%Y %H:%M") + " ] " + text + "\n")
        f.close()
