import time
import curses

opcoesMenu = ['Novo jogo', 'Continuar jogo', 'Opções', 'Sair']

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

        if key == curses.KEY_UP and linhaAtualIndex > 0:
            linhaAtualIndex -= 1
        elif key == curses.KEY_DOWN and linhaAtualIndex < len(opcoesMenu)-1:
            linhaAtualIndex += 1
        elif key == curses.KEY_ENTER or key in [10, 13]:
            if linhaAtualIndex == len(opcoesMenu)-1:
                break
            stdscr.addstr(0, 0, "You pressed {}".format(opcoesMenu[linhaAtualIndex]))
            stdscr.refresh()
            stdscr.getch()
        # elif key == ord('Q') or key == ord('q'):
            

        printmenu(stdscr, linhaAtualIndex)

        stdscr.refresh()
    
curses.wrapper(menu)
