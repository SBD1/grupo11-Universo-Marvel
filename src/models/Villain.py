from collections import namedtuple
from db import cursor, conn

#Villain = namedtuple('Villain', 'id name agility hp xp max_damage crit_damage rolls defense')

class _Villain:
    def __init__(self, id, name, agility, hp, xp, max_damage, crit_damage, rolls, defense):
        self.id = id
        self.name = name
        self.agility = agility
        self.hp = hp
        self.xp = xp
        self.max_damage = max_damage
        self.crit_damage = crit_damage
        self.rolls = rolls
        self.defense = defense

pool = {}

def Villain(id, name, agility, hp, xp, max_damage, crit_damage, rolls, defense):
    if id in pool:
        return pool[id]

    new_obj = _Villain(id, name, agility, hp, xp, max_damage, crit_damage, rolls, defense)
    pool[id] = new_obj
    return new_obj