from collections import namedtuple
from db import cursor, conn

#Level = namedtuple('Level', 'number xp hp agility damage')

class _Level:
    def __init__(self, number, xp, hp, agility, damage):
        self.number = number
        self.xp = xp
        self.hp = hp
        self.agility = agility
        self.damage = damage

pool = {}

def Level(number, xp, hp, agility, damage):
    if number in pool:
        return pool[number]

    new_obj = _Level(number, xp, hp, agility, damage)
    pool[id] = new_obj
    return new_obj