from collections import namedtuple
from db import cursor, conn

#Costume = namedtuple('Costume', 'id name description max_quantity value min_lv defense agility')

class _Costume:
    def __init__(self, id, name, description, max_quantity, value, min_lv, defense, agility):
        self.id = id
        self.name = name
        self.description = description
        self.max_quantity = max_quantity
        self.value = value
        self.min_lv = min_lv
        self.defense = defense
        self.agility = agility

pool = {}

def Costume(id, name, description, max_quantity, value, min_lv, defense, agility):
    if id in pool:
        return pool[id]

    new_obj = _Costume(id, name, description, max_quantity, value, min_lv, defense, agility)
    pool[id] = new_obj
    return new_obj