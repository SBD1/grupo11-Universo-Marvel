from collections import namedtuple
from db import cursor, conn

#Consumption = namedtuple('Consumption', 'id hero consumable times')

class _Consumption:
    def __init__(self, id, hero, consumable, times):
        self.id = id
        self.hero = hero
        self.consumable = consumable
        self.times = times

pool = {}

def Consumption(id, hero, consumable, times):
    if id in pool:
        return pool[id]

    new_obj = _Consumption(id, hero, consumable, times)
    pool[id] = new_obj
    return new_obj