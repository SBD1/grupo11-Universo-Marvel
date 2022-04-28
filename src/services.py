from db import cursor
from models import *


def get_heroes():
    cursor.execute(f"SELECT * FROM heroi;")
    heroes = cursor.fetchall()

    return [Hero(*hero) for hero in heroes]

# def get_villains():
#     cursor.execute(f"SELECT * FROM vilao;")
#     villains = cursor.fetchall()

#     return [Villain(*villain) for villain in villains]

def get_hero_instance_names():
    cursor.execute('SELECT nome FROM instancia_heroi;')
    name_tuples = cursor.fetchall()
    
    return [tuple[0] for tuple in name_tuples]


def get_save_by_name(name):
    cursor.execute(f"SELECT * FROM get_instancias_heroi() WHERE nome = '{name}';")
    save = HeroInstance(*cursor.fetchone())

    return save

def get_items(hero):
    cursor.execute(f"SELECT item, quantidade FROM posse WHERE heroi = '{hero.name}';")
    items = cursor.fetchall()

    return [Item(*item) for item in items]

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
    
# def get_levels(level):
#     cursor.execute(f"SELECT * FROM nivel WHERE number = {level};")
#     number = cursor.fetchall()

#     return [Level(*number) for number in levels]

# def get_weapons():
#     cursor.execute(f"SELECT * FROM arma;")
#     weapons = cursor.fetchall()

#     return [Weapon(*weapon) for weapon in bases]

def get_villain_instances(map):
    cursor.execute(f"SELECT * FROM get_instancias_vilao() WHERE mapa = {map};")
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
    cursor.execute(f"CALL criar_instancia_heroi('{name}', '{hero}');")

def get_villain(hero):
    cursor.execute(f"""
        SELECT * FROM get_instancias_vilao()
        WHERE latitude = {hero.lat}
        AND longitude = {hero.lon}
        AND mapa = {hero.map}
        LIMIT 1;
    """)
    villain = cursor.fetchone()

    return VillainInstance(*villain)

def get_consumables(hero):
    cursor.execute(f"""
        SELECT C.nome, P.quantidade
        FROM posse P, consumivel C
        WHERE P.item = C.nome
        AND heroi = '{hero.name}';
    """)
    consumables = cursor.fetchall()

    return [Consumable(*consumable) for consumable in consumables]

