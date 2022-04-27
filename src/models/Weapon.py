from collections import namedtuple
from db import cursor, conn

#Weapon = namedtuple('Weapon', 'name description maximum_quantity value min_lv max_damage crit_damage rolls')

class _Weapon:
    def __init__(self, name, description, maximum_quantity, value, min_lv, max_damage, crit_damage, rolls):
        self.name = name
        self.description = description
        self.maximum_quantity = maximum_quantity
        self.value = value
        self.min_lv = min_lv
        self.max_damage = max_damage
        self.crit_damage = crit_damage
        self.rolls = rolls

def Weapon(id, name, description, maximum_quantity, value, min_lv, max_damage, crit_damage, rolls):
    new_obj = _Weapon(id, name, description, maximum_quantity, value, min_lv, max_damage, crit_damage, rolls)
    return new_obj