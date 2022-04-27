class _VillainInstance:
    def __init__(self, id, villain, health, lat, lon, map):
        self.id = id
        self.villain = villain
        self.health = health
        self.lat = lat
        self.lon = lon
        self.map = map

pool = {}

def VillainInstance(id, villain, health, lat, lon, map):
    if id in pool:
        return pool[id]

    new_obj = _VillainInstance(id, villain, health, lat, lon, map)
    pool[id] = new_obj
    return new_obj