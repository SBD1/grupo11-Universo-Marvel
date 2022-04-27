from db import cursor, conn

class _HeroInstance:
    def __init__(self, id, name, hero, health, xp, suit, weapon, lat, lon, map):
        self.id = id
        self.name = name
        self.hero = hero
        self.health = health
        self.xp = xp
        self.suit = suit
        self.weapon = weapon
        self.lat = lat
        self.lon = lon
        self.map = map

    def move(self, direction):
        try:
            cursor.execute(f"CALL mover_heroi('{self.name}', '{direction}');")
            cursor.execute(f"SELECT latitude, longitude FROM instancia_heroi WHERE id = {self.id};")
            self.lat, self.lon = cursor.fetchone()
            return True
        except Exception as e:
            print(e)
            return False

pool = {}

def HeroInstance(id, name, hero, health, xp, suit, weapon, lat, lon, map):
    if id in pool:
        return pool[id]

    new_obj = _HeroInstance(id, name, hero, health, xp, suit, weapon, lat, lon, map)
    pool[id] = new_obj
    return new_obj