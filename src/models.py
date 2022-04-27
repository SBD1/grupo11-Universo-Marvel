from dataclasses import dataclass
from db import cursor


def multiton(cls):
    instances = {}

    def getinstance(*args):
        if args not in instances:
            instances[args] = cls(*args)
        return instances[args]

    return getinstance


@multiton
@dataclass
class Base:
    id: int
    lat: int
    lon: int
    map: int


@multiton
@dataclass
class Consumable:
    name: str
    desc: str
    max_amt: int
    cost: int
    effect: str
    degree: int
    duration: int
    cooldown: int


@multiton
@dataclass
class Hero:
    name: str
    agility: int
    health: int


@multiton
@dataclass
class HeroInstance:
    id: int
    name: str
    hero: str
    health: int
    xp: int
    suit: str
    weapon: str
    lat: int
    lon: int
    map: int
    agility: int
    max_health: int

    def move(self, direction):
        try:
            queries = [
                f"CALL mover_heroi('{self.name}', '{direction}');",
                f"SELECT latitude, longitude FROM instancia_heroi WHERE id = {self.id};"
            ]
            for query in queries:
                cursor.execute(query)
            self.lat, self.lon = cursor.fetchone()
            return True
        except Exception as e:
            print(e)
            return False


@multiton
@dataclass
class Item:
    name: str
    qty: int


@multiton
@dataclass
class ItemInstance:
    id: int
    name: str
    type: str


@multiton
@dataclass
class VillainInstance:
    id: int
    villain: str
    health: int
    lat: int
    lon: int
    map: int
    agility: int
    max_health: int
    xp: int
    max_dmg: int
    crit_dmg: int
    rolls: int
    defense: int
