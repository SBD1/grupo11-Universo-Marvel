from collections import namedtuple
from db import cursor, conn

#Villain = namedtuple('Villain', 'name agility hp xp max_damage crit_damage rolls defense')

class _Villain:
    def __init__(self, name, agility, hp, xp, max_damage, crit_damage, rolls, defense):
        self.name = name
        self.agility = agility
        self.hp = hp
        self.xp = xp
        self.max_damage = max_damage
        self.crit_damage = crit_damage
        self.rolls = rolls
        self.defense = defense

pool = {}

def Villain(name, agility, hp, xp, max_damage, crit_damage, rolls, defense):
    if name in pool:
        return pool[name]

    new_obj = _Villain(name, agility, hp, xp, max_damage, crit_damage, rolls, defense)
    pool[name] = new_obj
    return new_obj