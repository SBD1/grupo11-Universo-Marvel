from collections import namedtuple
from db import cursor, conn

#Trade = namedtuple('Trade', 'id item hero base quantity_item sell_or_buy')

class _Trade:
    def __init__(self, id, item, hero, base, quantity_item, sell_or_buy):
        self.id = id
        self.item = item
        self.hero = hero
        self.base = base
        self.quantity_item = quantity_item
        self.sell_or_buy = sell_or_buy

pool = {}

def Trade(id, item, hero, base, quantity_item, sell_or_buy):
    if id in pool:
        return pool[id]

    new_obj = _Trade(id, item, hero, base, quantity_item, sell_or_buy)
    pool[id] = new_obj
    return new_obj