from dataclasses import dataclass
from random import randint
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
            cursor.execute(
                f"SELECT * FROM mover_heroi('{self.name}', '{direction}');")
            self.lat, self.lon = cursor.fetchone()
            return True
        except Exception as e:
            return False

    def attack(self, villain):
        cursor.execute(f"SELECT * FROM atacar_vilao({self.id}, {villain.id});")
        dmg_dealt, villain.health = cursor.fetchone()

        if villain.health == 0:
            cursor.execute(
                f"SELECT experiencia FROM instancia_heroi WHERE id = {self.id};")
            self.xp = cursor.fetchone()[0]

        return dmg_dealt

    def consume(self, item_string):
        item = item_string.split(' (')[0]
        cursor.execute(f"SELECT consumir_item('{self.name}', '{item}');")
        self.health = cursor.fetchone()[0]

    def get_level(self):
        cursor.execute(
            f"SELECT numero FROM nivel WHERE experiencia_necessaria <= {self.xp} ORDER BY numero DESC LIMIT 1;")

        return cursor.fetchone()[0]

    def flee(self):
        chance = randint(0, 100)

        return chance <= self.agility

    def get_money(self):
        cursor.execute(
            f"SELECT quantidade FROM posse WHERE heroi = '{self.name}' AND item='Moeda';")

        money = cursor.fetchone() or [0]

        return money[0]

    def pick_up_items(self):
        cursor.execute(f"CALL pegar_itens('{self.name}');")

    def travel(self, map_string):
        name, year = map_string.split(', ')
        cursor.execute(
            f"SELECT * FROM ir_para_mapa('{self.name}', '{name}', {year});")

        self.lat, self.lon, self.map = cursor.fetchone()

    def sell(self, item_string, qty):
        item = item_string.split(' (')[0]
        cursor.execute(f"CALL vender_item('{self.name}', '{item}', {qty});")

    def buy(self, item_string, qty):
        item = item_string.split(' (')[0]
        cursor.execute(f"CALL comprar_item('{self.name}', '{item}', {qty});")

    def equip(self, equipment):
        cursor.execute(
            f"SELECT * FROM equipar_item('{self.name}', '{equipment}');")
        item, type = cursor.fetchone()

        if type == None:
            return
        elif type == 'A':
            self.weapon = item
        else:
            self.suit = item

    def drop(self, item, qty):
        cursor.execute(f"CALL soltar_item('{self.name}', '{item}', {qty});")


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
    qty: int
    lat: int
    lon: int
    map: int


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
        dmg_dealt, hero.health = cursor.fetchone()

        return dmg_dealt


@multiton
@dataclass
class Map:
    id: int
    name: str
    year: int
    requirement: str
    reward: str
