class _Base:
    def __init__(self, id, lat, lon, map):
        self.id = id
        self.lat = lat
        self.lon = lon
        self.map = map

pool = {}

def Base(id, lat, lon, map):
    if id in pool:
        return pool[id]

    new_obj = _Base(id, lat, lon, map)
    pool[id] = new_obj
    return new_obj