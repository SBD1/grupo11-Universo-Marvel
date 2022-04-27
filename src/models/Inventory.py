from collections import namedtuple
from db import cursor, conn

#Posse
#Inventory = namedtuple('Inventory', 'id item hero quantity')

class _Inventory:
    def __init__(self, id, item, hero, quantity):
        self.id = id
        self.item = item
        self.hero = hero
        self.quantity = quantity

pool = {}

def Inventory(id, item, hero, quantity):
    if id in pool:
        return pool[id]

    new_obj = _Inventory(id, item, hero, quantity)
    pool[id] = new_obj
    return new_obj