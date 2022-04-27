from collections import namedtuple
from db import cursor, conn

#Exchangeable = namedtuple('Exchangeable', 'name type')

class _Exchangeable:
    def __init__(self, name, type):
        self.name = name
        self.type = type

def Exchangeable(name, type):
    new_obj = _Exchangeable(name, type)
    return new_obj