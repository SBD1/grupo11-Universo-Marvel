from collections import namedtuple
from db import cursor, conn

#Reward = namedtuple('Reward', 'item villain quantity')

class _Reward:
    def __init__(self, item, villain, quantity):
        self.item = item
        self.villain = villain
        self.quantity = quantity

def Reward(item, villain, quantity):
    new_obj = _Reward(item, villain, quantity)
    return new_obj