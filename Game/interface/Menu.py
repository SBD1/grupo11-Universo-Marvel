import time
import curses

opcoesMenu = ['Pagina Inicial', 'Jogar', 'Score', 'Fechar']

def printmenu(stdscr, indexLinhaSelecionada):
    stdscr.clear()
    h, w = stdscr.getmaxyx()

    for indexMenu, row in enumerate(opcoesMenu):
        a = w//2 - len(row)//2
        b = h//2 - len(opcoesMenu)//2 + indexMenu
        if indexMenu == indexLinhaSelecionada:
            stdscr.attron(curses.color_pair(1))
            stdscr.addstr(b, a, row)
            stdscr.attroff(curses.color_pair(1))
        else:
            stdscr.addstr(b, a, row)

    stdscr.refresh()

def menu(stdscr):
    curses.curs_set(0)
    curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_WHITE)

    linhaAtualIndex = 0
    printmenu(stdscr, linhaAtualIndex)
    
    while 1:
        key = stdscr.getch()

        stdscr.clear()

        if key == curses.KEY_UP:
            stdscr.addstr(0, 0, "You pressed Up key!")
        elif key == curses.KEY_DOWN:
            stdscr.addstr(0, 0, "You pressed Down key!")
        elif key == curses.KEY_ENTER or key in [10, 13]:
            stdscr.addstr(0, 0, "You pressed enter!")
        
        stdscr.refresh()
    
curses.wrapper(menu)
