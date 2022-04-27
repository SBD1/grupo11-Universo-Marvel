from db import cursor
from models.Hero import Hero
from models.HeroInstance import HeroInstance
from models.VillainInstance import VillainInstance
from models.ItemInstance import ItemInstance
from models.Base import Base


def get_heroes():
    cursor.execute(f"SELECT * FROM heroi;")
    heroes = cursor.fetchall()

    return [Hero(*hero) for hero in heroes]


def get_hero_instances():
    query = 'SELECT * FROM instancia_heroi;'
    cursor.execute(query)
    hero_instances = cursor.fetchall()
    
    return [HeroInstance(*hi) for hi in hero_instances]


def get_save_by_name(name):
    cursor.execute(f"SELECT * FROM instancia_heroi WHERE nome = '{name}';")
    save = HeroInstance(*cursor.fetchone())

    return save

def get_items(hero):
    cursor.execute(f"SELECT item, quantidade FROM posse WHERE heroi = '{hero}';")
    items = cursor.fetchall()

    return items

def get_map_matrix(hero):
    matrix = [[[] for i in range(20)] for i in range(20)]

    matrix[hero.lat][hero.lon].append('H')

    villains = get_villain_instances(hero.map)
    for villain in villains:
        if villain.health > 0:
            matrix[villain.lat][villain.lon].append('V')

    bases = get_bases(hero.map)
    for base in bases:
        matrix[base.lat][base.lon].append('B')

    items = get_item_instances(hero.map)
    for item in items:
        matrix[item.lat][item.lon].append('I')

    return matrix


def get_bases(map):
    cursor.execute(f"SELECT * FROM base WHERE mapa = {map};")
    bases = cursor.fetchall()

    return [Base(*base) for base in bases]


def get_villain_instances(map):
    cursor.execute(f"SELECT * FROM instancia_vilao WHERE mapa = {map};")
    villain_instances = cursor.fetchall()

    return [VillainInstance(*vi) for vi in villain_instances]


def get_item_instances(map):
    cursor.execute(f"SELECT * FROM instancia_item WHERE mapa = {map};")
    item_instances = cursor.fetchall()

    return [ItemInstance(*ii) for ii in item_instances]


def get_map_from_hero(hero):
    cursor.execute(f"SELECT * FROM mapa WHERE id = '{hero.map}';")
    map = cursor.fetchone()[0]

    return map


def create_save(name, hero):
    query = f"CALL criar_instancia_heroi('{name}', '{hero}');"
    cursor.execute(query)
