
import random

class WordConstructor:
    @staticmethod
    def scatterEasy(word):
        result =''
        i=0
        while i < len(word):
            state = random.randint(0, 1)
            if state == 1:
                if i + 1 <= len(word) - 1:
                    result += word[i + 1] + '.'
                    result += word[i] + '.'
                    i = i + 2
                    continue
                result += word[i] + '.'
            else:
                result += word[i] + '.'
            i += 1
        return result
    @staticmethod
    def scatter(a):
        result = ""
        len_counter = 0
        while (len(a) != 0):
            index = random.randint(0, len(a) - 1)
            result += a[index] + "."
            a = a.replace(a[index], '', 1)
        return result