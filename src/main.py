import curses
from curses import wrapper
import random
from time import sleep
from db import conn, cursor
from services import *

window = None
turns = None
current_turn = 0
hero = None
villain = None
last_hit = None


def item_to_string(item): return f"{item.name} ({item.qty})"


def show_options(options, page_size=10):
    global window

    curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_WHITE)
    SELECTED = curses.color_pair(1)

    window.clear()
    h, w = window.getmaxyx()
    selected_line = 0

    current_page = 0

    upper_index, lower_index = current_page * \
        page_size, (current_page + 1) * page_size

    displayed_options = options[upper_index:lower_index]

    while True:
        for index, option in enumerate(displayed_options):
            a = w//2 - len(option)//2
            b = h//2 - len(displayed_options)//2 + index
            if index == selected_line - current_page * page_size:
                window.attron(SELECTED)
                window.addstr(b, a, option)
                window.attroff(SELECTED)
            else:
                window.addstr(b, a, option)

        key = window.getch()

        if key == curses.KEY_UP:
            selected_line = max(selected_line - 1, 0)
            while selected_line < upper_index:
                window.clear()
                current_page -= 1
                upper_index, lower_index = current_page * \
                    page_size, (current_page + 1) * page_size
                displayed_options = options[upper_index:lower_index]
        if key == curses.KEY_DOWN:
            selected_line = min(selected_line + 1, len(options) - 1)
            while selected_line >= lower_index:
                window.clear()
                current_page += 1
                upper_index, lower_index = current_page * \
                    page_size, (current_page + 1) * page_size
                displayed_options = options[upper_index:lower_index]
        if key == curses.KEY_ENTER or key in [10, 13]:
            window.clear()
            return options[selected_line]

        window.refresh()


def show_menu():
    instances = get_hero_instance_names()
    options = ['Novo Jogo', 'Sair']
    if len(instances):
        options = ['Continuar', *options]
    chosen_option = show_options(options)

    return chosen_option


def get_string(prompt=''):
    global window

    curses.echo()
    window.addstr(prompt)
    curses.curs_set(1)
    string = window.getstr().decode('UTF-8')
    curses.curs_set(0)
    curses.noecho()

    return string


def create_character():
    global window

    heroes = get_heroes()
    options = [hero.name for hero in heroes]
    options.append("Voltar")
    chosen_option = show_options(options)

    if chosen_option == 'Voltar':
        main(window)
    else:
        save_name = get_string('Insira seu nome: ')
        create_save(save_name, chosen_option)
        start_game(save_name)


def show_info(hero):
    global window

    window.addstr('\n')
    window.addstr(f'Herói: {hero.name} ({hero.hero})\n')
    window.addstr(f'Vida: {hero.health}\n')
    window.addstr(f'Nível: {hero.get_level()} ({hero.xp}xp)\n')
    window.addstr(f'Moedas: {hero.get_money()}\n')
    window.addstr('\n')


def render_map(hero):
    global window

    window.clear()
    map_matrix = get_map_matrix(hero)

    for row in map_matrix:
        for coord in row:
            try:
                window.addstr(f'[{coord[0]}]')
            except:
                window.addstr('[ ]')
        window.addstr('\n')

    show_info(hero)

    window.addstr('Aperte [Q] para voltar ao menu inicial\n')
    window.addstr('Aperte [I] para abrir o inventário\n')

    current_hero_spot = map_matrix[hero.lat][hero.lon]

    if 'V' in current_hero_spot and hero.weapon:
        window.addstr('Aperte [L] para iniciar uma luta\n')

    if 'I' in current_hero_spot:
        window.addstr('Aperte [P] para pegar os items\n')

    if 'B' in current_hero_spot:
        window.addstr('Aperte [T] para fazer uma troca\n')
        window.addstr('Aperte [V] para viajar\n')

    return current_hero_spot


def show_actions(hero, item):
    item_name = item.split(' (')[0]
    equipments = get_equipment_names()
    consumable = get_consumable_names()

    options = ['Soltar']

    if item_name in equipments:
        options.append('Equipar')
    if item_name in consumable:
        options.append('Consumir')
    options.append('Voltar')

    chosen_option = show_options(options)

    if chosen_option == 'Consumir':
        hero.consume(item)
        play_game(hero)
    elif chosen_option == 'Equipar':
        hero.equip(item_name)
        play_game(hero)
    elif chosen_option == 'Soltar':
        try:
            qty = int(get_string('Quantos deseja soltar? '))
            hero.drop(item_name, qty)
            play_game(hero)
        except ValueError:
            open_inventory(hero)
    else:
        open_inventory(hero)


def open_inventory(hero):
    items = get_items(hero)

    options = [item_to_string(item) for item in items]
    if len(options) > 9:
        options = ['Voltar', *options]
    options.append('Voltar')

    chosen_option = show_options(options)

    if chosen_option == 'Voltar':
        play_game(hero)
    else:
        show_actions(hero, chosen_option)

    window.clear()


def show_fight(hero, villain):
    global last_hit
    window.clear()

    next_turns = [turns[(current_turn + x) % len(turns)] for x in range(1, 11)]
    heros_turn = turns[current_turn] == 'H'

    window.addstr(f'Próximos turnos: {", ".join(next_turns)}\n')
    window.addstr(
        f'Turno atual: {("Vilão", "Herói")[heros_turn]}\n')
    window.addstr("\n")

    window.addstr(f"{hero.hero}\n")
    window.addstr(f"Vida: {hero.health}\n")
    window.addstr("\n")

    window.addstr(f"{villain.villain}\n")
    window.addstr(f"Vida: {villain.health}\n")
    window.addstr("\n")

    if heros_turn:
        window.addstr("[A]tacar\n")
        window.addstr("[C]onsumir Item\n")
        window.addstr("[F]ugir\n")
        window.addstr("\n")

    if last_hit:
        window.addstr("Último ataque: ")
        window.addstr(f"{last_hit[0]} causou {last_hit[1]} de dano\n")
        last_hit = None

    return heros_turn


def consume_item(hero):
    global last_hit

    consumables = get_consumables(hero)
    options = [item_to_string(consumable) for consumable in consumables]
    options.append('Voltar')

    chosen_option = show_options(options)

    if chosen_option == 'Voltar':
        fight_villain(hero, villain)
    else:
        hero.consume(chosen_option)


def respawn_hero(hero):
    hero.health = hero.max_health
    window.clear()
    h, w = window.getmaxyx()

    strings = ['Você Morreu\n', 'Aperte ENTER para continuar\n']

    for index, string in enumerate(strings):
        a = w//2 - len(string)//2
        b = h//2 - len(strings)//2 + index
        window.addstr(b, a, string)

    while True:
        key = window.getch()

        if key == curses.KEY_ENTER or key in [10, 13]:
            window.clear()
            play_game(hero)


def fight_villain(hero, villain):
    global current_turn, last_hit

    heros_turn = show_fight(hero, villain)

    while True:
        if heros_turn:
            key = window.getkey().upper()
            if key == 'A':
                dmg_dealt = hero.attack(villain)
                last_hit = (hero.hero, dmg_dealt)
                if villain.health == 0:
                    play_game(hero)
            elif key == 'C':
                consume_item(hero)
            elif key == 'F':
                if hero.flee():
                    play_game(hero)
        else:
            dmg_dealt = villain.attack(hero)
            last_hit = (villain.villain, dmg_dealt)

            if hero.health == 0:
                respawn_hero(hero)

        heros_turn = show_fight(hero, villain)

        current_turn = (current_turn + 1) % len(turns)


def start_fight(hero):
    global turns, current_turn, villain, last_hit
    last_hit = None

    villain = get_villain(hero)

    if hero.agility > villain.agility:
        ratio = hero.agility // villain.agility
        turns = (ratio - 1) * ['H'] + ['V']
    else:
        ratio = villain.agility // hero.agility
        turns = ratio * ['V']
    random.shuffle(turns)
    turns = ['H', *turns]

    current_turn = 0

    fight_villain(hero, villain)


def show_travel(hero):
    maps = get_maps(hero)
    options = [f"{map.name}, {map.year}" for map in maps]
    options.append('Voltar')

    chosen_option = show_options(options)

    if chosen_option != 'Voltar':
        hero.travel(chosen_option)

    play_game(hero)


def show_store_sell(hero):
    items = get_tradeables(hero)
    options = [item_to_string(item) for item in items]
    if len(options) > 9:
        options = ['Voltar', *options]
    options.append('Voltar')

    chosen_option = show_options(options)

    if chosen_option == 'Voltar':
        show_store(hero)
    else:
        try:
            qty = int(get_string('Quantos deseja vender? '))
            hero.sell(chosen_option, qty)
            show_store(hero)
        except ValueError:
            show_store(hero)


def show_store_buy(hero):
    items = get_stock(hero)
    options = [item_to_string(item) for item in items]
    if len(options) > 9:
        options = ['Voltar', *options]
    options.append('Voltar')

    chosen_option = show_options(options)

    if chosen_option == 'Voltar':
        show_store(hero)
    else:
        try:
            qty = int(get_string('Quantos deseja comprar? '))
            hero.buy(chosen_option, qty)
            show_store(hero)
        except ValueError:
            show_store(hero)


def show_store(hero):
    options = ['Comprar', 'Vender', 'Voltar']
    chosen_option = show_options(options)

    if chosen_option == 'Comprar':
        show_store_buy(hero)
    elif chosen_option == 'Vender':
        show_store_sell(hero)
    else:
        play_game(hero)


def play_game(hero):
    render_map(hero)

    while True:
        key = window.getkey().upper()

        if key in {'W', 'A', 'S', 'D'}:
            moved_successfully = hero.move(key)
            if moved_successfully:
                render_map(hero)

        elif key == 'L' and hero.weapon:
            start_fight(hero)
        elif key == 'P':
            hero.pick_up_items()
            render_map(hero)
        elif key == 'T':
            show_store(hero)
        elif key == 'V':
            revive_villains(hero)
            show_travel(hero)
        elif key == 'Q':
            main(window)
        elif key == 'I':
            open_inventory(hero)


def start_game(save_name):
    global window

    hero = get_save_by_name(save_name)

    play_game(hero)


def choose_save():
    global window

    instance_names = get_hero_instance_names()
    options = [name for name in instance_names]
    options.append("Voltar")
    chosen_option = show_options(options)

    if chosen_option == 'Voltar':
        main(window)
    else:
        start_game(chosen_option)


def main(stdscr):
    global window
    window = stdscr

    curses.curs_set(0)
    window.clear()

    h, w = window.getmaxyx()
    if h < 35 or w < 80:
        raise Exception(
            'Aumente seu terminal para acomodar 35 linhas e 80 colunas')

    # try:
    chosen_option = show_menu()

    if chosen_option == 'Novo Jogo':
        create_character()
    elif chosen_option == 'Continuar':
        choose_save()
    elif chosen_option == 'Sair':
        cursor.close()
        conn.commit()
        conn.close()
        exit(0)
    # except KeyboardInterrupt:
    #     main(window)


wrapper(main)
