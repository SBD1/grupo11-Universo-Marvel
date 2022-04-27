class _ItemInstance:
    def __init__(self, id, name, type):
        self.id = id
        self.name = name
        self.type = type

pool = {}

def ItemInstance(id, name, type):
    if id in pool:
        return pool[id]

    new_obj = _ItemInstance(id, name, type)
    pool[id] = new_obj
    return new_obj