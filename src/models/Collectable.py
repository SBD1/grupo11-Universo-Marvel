from collections import namedtuple
from db import cursor, conn

#Collectable = namedtuple('Collectable', 'id name type')

class _Collectable:
    def __init__(self, id, name, type):
        self.id = id
        self.name = name
        self.type = type

pool = {}

def Collectable(id, name, type):
    if id in pool:
        return pool[id]

    new_obj = _Collectable(id, name, type)
    pool[id] = new_obj
    return new_obj