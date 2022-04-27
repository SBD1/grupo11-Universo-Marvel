from collections import namedtuple
from db import cursor, conn

#Collectable = namedtuple('Consumable', 'id name description max_quantity value effect grade duration cooldown')

class _Consumable:
    def __init__(self, id, name, description, max_quantity, value, effect, grade, duration, cooldown):
        self.id = id
        self.name = name
        self.description = description
        self.max_quantity = max_quantity
        self.value = value
        self.effect = effect
        self.grade = grade
        self.duration = duration
        self.cooldown = cooldown

pool = {}

def Consumable(id, name, description, max_quantity, value, effect, grade, duration, cooldown):
    if id in pool:
        return pool[id]

    new_obj = _Consumable(id, name, description, max_quantity, value, effect, grade, duration, cooldown)
    pool[id] = new_obj
    return new_obj