import curses
from curses import wrapper
from services import get_hero_instances, get_heroes, get_save_by_name, create_save, get_map_matrix, get_items


def show_options(window, options):
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


def show_menu(window):
    instances = get_hero_instances()
    options = ['Novo Jogo', 'Sair']
    if len(instances):
        options = ['Continuar', *options]
    chosen_option = show_options(window, options)

    return chosen_option


def get_string(window, prompt=''):
    curses.echo()
    window.addstr(prompt)
    curses.curs_set(1)
    string = window.getstr().decode('UTF-8')
    curses.curs_set(0)
    return string


def create_character(window):
    heroes = get_heroes()
    options = [hero.name for hero in heroes]
    options.append("Voltar")
    chosen_option = show_options(window, options)

    if chosen_option == 'Voltar':
        main(window)
    else:
        save_name = get_string(window, 'Insira seu nome: ')
        create_save(save_name, chosen_option)
        start_game(window, save_name)


def render_map(window, hero):
    window.clear()
    map_matrix = get_map_matrix(hero)

    for row in map_matrix:
        for coord in row:
            try:
                window.addstr(f'[{coord[0]}]')
            except:
                window.addstr('[ ]')
        window.addstr('\n')

    show_info(window, hero)

    window.addstr('Aperte [Q] para voltar ao menu inicial\n')
    window.addstr('Aperte [I] para abrir o inventário\n')

    if 'V' in map_matrix[hero.lat][hero.lon]:
        window.addstr('Aperte [L] para iniciar uma luta\n')

    if 'I' in map_matrix[hero.lat][hero.lon]:
        window.addstr('Aperte [P] para pegar os items\n')

    if 'B' in map_matrix[hero.lat][hero.lon]:
        window.addstr('Aperte [T] para fazer uma troca ou [V] para viajar\n')


def show_info(window, hero):
    window.addstr(f'\nHerói: {hero.name} ({hero.hero})\n')
    window.addstr(f'Vida: {hero.health}\n\n')


def open_inventory(window, hero):
    def item_to_string(item): return f"{item[0]} ({item[1]})"
    items = get_items(hero)

    options = [item_to_string(item) for item in items]
    options.append('Voltar')

    chosen_option = show_options(window, options)

    if chosen_option == 'Voltar':
        start_game(window, hero.name)

    window.clear()


def start_game(window, save_name):
    hero = get_save_by_name(save_name)

    render_map(window, hero)

    while True:
        key = window.getkey().upper()

        if key in {'W', 'A', 'S', 'D'}:
            moved_successfully = hero.move(key)
            if moved_successfully:
                render_map(window, hero)

        elif key == 'Q':
            main(window)

        elif key == 'I':
            open_inventory(window, hero)


def choose_save(window):
    instances = get_hero_instances()
    options = [instance.name for instance in instances]
    options.append("Voltar")
    chosen_option = show_options(window, options)

    if chosen_option == 'Voltar':
        main(window)
    else:
        start_game(window, chosen_option)


def main(stdscr):
    curses.curs_set(0)
    stdscr.clear()

    chosen_option = show_menu(stdscr)

    if chosen_option == 'Novo Jogo':
        create_character(stdscr)
    elif chosen_option == 'Continuar':
        choose_save(stdscr)
    elif chosen_option == 'Sair':
        exit(0)

    # conn.commit()

    while True:
        stdscr.getch()


wrapper(main)
