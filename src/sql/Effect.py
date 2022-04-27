from collections import namedtuple
from db import cursor, conn

#Effect = namedtuple('Effect', 'id name')

class _Effect:
    def __init__(self, name):
        self.id = id
        self.name = name
        
pool = {}

def Effect(id, name):
    if id in pool:
        return pool[id]

    new_obj = _Effect(id, name)
    pool[id] = new_obj
    return new_obj