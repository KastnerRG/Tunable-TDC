import numpy as np
class Edge:
    def __init__(self, s, e):
        self.__s = s.strip('\n')
        self.__e = int(e)
        self.__ne = int(not (e))

    @property
    def rising(self):
        return self.__e == 0
    @property
    def falling(self):
        return self.__e == 1
    
    @property
    def first(self):
        return np.int32(self.__s.find(str(self.__e)))

    @property
    def middle(self):
        return np.int32((self.first + self.last) / 2)

    @property
    def last(self):
        return np.int32(self.__s.rfind(str(self.__ne)))

    @property
    def pop(self):
        return np.int32(self.__s.count('1'))

    @staticmethod
    def isEdge(s):
        s = s.strip('\n')
        return (s[0] != s[-1])

    @staticmethod
    def create(s):
        if(not Edge.isEdge(s)):
            raise ValueError("No edge in string")
        elif s[0] == "1":
            return Rising(s)
        elif s[0] == "0":
            return Falling(s)

    def __str__(self):
        return self.__s

class Rising(Edge):
    def __init__(self, s):
        super().__init__(s, 0)

class Falling(Edge):
    def __init__(self, s):
        super().__init__(s, 1)
