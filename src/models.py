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
            cursor.execute(f"SELECT * FROM mover_heroi('{self.name}', '{direction}');")
            self.lat, self.lon = cursor.fetchone()
            return True
        except Exception as e:
            return False

    def attack(self, villain):
        cursor.execute(f"SELECT * FROM atacar_vilao({self.id}, {villain.id});")
        dmg_dealt = cursor.fetchone()

        print('Dealt ', dmg_dealt)

        villain.health = max(villain.health - dmg_dealt, 0)

        return dmg_dealt

    def consume(self, item):
        cursor.execute(f"SELECT consumir_item('{self.name}', '{item}');")
        self.health = cursor.fetchone()


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

    def attack(self, hero):
        cursor.execute(f"SELECT * FROM atacar_heroi({self.id}, {hero.id});")
        dmg_dealt = cursor.fetchone()[0]

        hero.health = max(hero.health - dmg_dealt, 0)

        return dmg_dealt
