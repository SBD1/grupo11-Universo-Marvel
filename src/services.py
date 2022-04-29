from db import cursor
from models import *


def get_heroes():
    cursor.execute(f"SELECT * FROM heroi;")
    heroes = cursor.fetchall()

    return [Hero(*hero) for hero in heroes]


def get_hero_instance_names():
    cursor.execute('SELECT nome FROM instancia_heroi;')
    name_tuples = cursor.fetchall()

    return [tuple[0] for tuple in name_tuples]


def get_save_by_name(name):
    cursor.execute(
        f"SELECT * FROM get_instancias_heroi() WHERE nome = '{name}';")
    save = HeroInstance(*cursor.fetchone())

    return save


def get_items(hero):
    cursor.execute(
        f"SELECT item, quantidade FROM posse WHERE heroi = '{hero.name}' AND item != 'Moeda';")
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

    return [Item(*consumable) for consumable in consumables]


def revive_villains(hero):
    cursor.execute(f"CALL reviver_viloes({hero.map});")


def get_maps(hero):
    cursor.execute(f"SELECT * FROM get_mapas('{hero.name}');")
    maps = cursor.fetchall()

    return [Map(*map) for map in maps]


def get_tradeables(hero):
    cursor.execute(f"SELECT * FROM get_trocaveis('{hero.name}');")
    tradeables = cursor.fetchall()

    return [Item(*tradeable) for tradeable in tradeables]


def get_stock(hero):
    cursor.execute(f"SELECT item, quantidade FROM get_estoque('{hero.name}');")
    items = cursor.fetchall()

    return [Item(*item) for item in items]


def get_equipment_names():
    cursor.execute('SELECT nome FROM equipamento;')
    equips = cursor.fetchall()

    return set([equip[0] for equip in equips])


def get_consumable_names():
    cursor.execute('SELECT nome FROM consumivel;')
    consumables = cursor.fetchall()

    return set([consumable[0] for consumable in consumables])


def should_game_end(hero):
    cursor.execute("SELECT COUNT(*) FROM joia;")
    num_stones = cursor.fetchone()[0]

    cursor.execute(
        f"SELECT COUNT(*) FROM posse WHERE heroi = '{hero.name}' AND item IN (SELECT nome FROM joia);")
    possessed_stones = cursor.fetchone()[0]

    if num_stones == possessed_stones:
        return True
    return False
