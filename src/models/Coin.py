from collections import namedtuple
from db import cursor, conn

#Coin = namedtuple('Coin', 'name description')

class _Coin:
    def __init__(self, name, description):
        self.name = name
        self.description = description

def Coin(name, description):
    new_obj = _Coin(name, description)
    return new_obj