import curses
from curses import wrapper
import random
from db import conn, cursor
from services import *

window = None
turns = None
current_turn = 0
hero = None
villain = None


def item_to_string(item): return f"{item[0]} ({item[1]})"


def show_options(options):
    global window

    curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_WHITE)
    SELECTED = curses.color_pair(1)

    window.clear()
    h, w = window.getmaxyx()
    selected_line = 0

    while True:
        for index, option in enumerate(options):
            a = w//2 - len(option)//2
            b = h//2 - len(options)//2 + index
            if index == selected_line:
                window.attron(SELECTED)
                window.addstr(b, a, option)
                window.attroff(SELECTED)
            else:
                window.addstr(b, a, option)

        key = window.getch()

        if key == curses.KEY_UP:
            selected_line = (selected_line - 1) % len(options)
        if key == curses.KEY_DOWN:
            selected_line = (selected_line + 1) % len(options)
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

    if 'V' in current_hero_spot:
        window.addstr('Aperte [L] para iniciar uma luta\n')

    if 'I' in current_hero_spot:
        window.addstr('Aperte [P] para pegar os items\n')

    if 'B' in current_hero_spot:
        window.addstr('Aperte [T] para fazer uma troca ou [V] para viajar\n')

    return current_hero_spot


def open_inventory(hero):
    items = get_items(hero)

    options = [item_to_string(item) for item in items]
    options.append('Voltar')

    chosen_option = show_options(options)

    if chosen_option == 'Voltar':
        start_game(hero.name)

    window.clear()


def show_fight(hero, villain):
    window.clear()

    next_turns = turns[current_turn + 1:(current_turn + 11) % len(turns)]
    heros_turn = turns[current_turn] == 'H'

    window.addstr(f'Próximos turnos: {", ".join(next_turns)}\n')
    window.addstr(f'Turno atual: {("Vilão", "Herói")[heros_turn]}\n')
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

    return heros_turn


def consume_item(hero):
    consumables = get_consumables(hero)
    options = [item_to_string(consumable) for consumable in consumables]
    options.append('Voltar')

    chosen_option = show_options(options)

    if chosen_option == 'Voltar':
        fight_villain(hero, villain)
    else:
        hero.consume(chosen_option)


def fight_villain(hero, villain):
    global current_turn

    heros_turn = show_fight(hero, villain)

    while True:
        if heros_turn:
            key = window.getkey().upper()

            if key == 'A':
                hero.attack(villain)
            elif key == 'C':
                consume_item(hero)
            elif key == 'F':
                if hero.flee():
                    start_game(hero.name)
        else:
            villain.attack(hero)

        heros_turn = show_fight(hero, villain)

        current_turn = (current_turn + 1) % len(turns)


def start_fight(hero):
    global turns, current_turn, villain

    villain = get_villain(hero)

    turns = hero.agility * ['H'] + villain.agility * ['V']
    for i in range(3):
        random.shuffle(turns)

    current_turn = 0
    
    fight_villain(hero, villain)


def start_game(save_name):
    global window

    hero = get_save_by_name(save_name)

    render_map(hero)

    while True:
        key = window.getkey().upper()

        if key in {'W', 'A', 'S', 'D'}:
            moved_successfully = hero.move(key)
            if moved_successfully:
                render_map(hero)

        elif key == 'L':
            start_fight(hero)
        elif key == 'P':
            pass
        elif key == 'T':
            pass
        elif key == 'V':
            pass

        elif key == 'Q':
            main(window)

        elif key == 'I':
            open_inventory(hero)


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
