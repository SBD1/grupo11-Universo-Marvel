from collections import namedtuple
from db import cursor, conn

#Weapon = namedtuple('Weapon', 'id name description maximum_quantity value min_lv max_damage crit_damage rolls')

class _Weapon:
    def __init__(self, id, name, description, maximum_quantity, value, min_lv, max_damage, crit_damage, rolls):
        self.id = id
        self.name = name
        self.description = description
        self.maximum_quantity = maximum_quantity
        self.value = value
        self.min_lv = min_lv
        self.max_damage = max_damage
        self.crit_damage = crit_damage
        self.rolls = rolls

pool = {}

def Weapon(id, name, description, maximum_quantity, value, min_lv, max_damage, crit_damage, rolls):
    if id in pool:
        return pool[id]

    new_obj = _Weapon(id, name, description, maximum_quantity, value, min_lv, max_damage, crit_damage, rolls)
    pool[id] = new_obj
    return new_obj