import time
import curses

opcoesmenu = ['Pagina Inicial', 'Jogar', 'Score', 'Fechar']

def printmenu(stdscr):
    stdscr.clear()
    h, w = stdscr.getmaxyx()

    for idx, row in enumerate(opcoesmenu):
        a = w//2 - len(row)//2
        b = h//2 - len(opcoesmenu)//2 + idx
        stdscr.addstr(b, a, row)

    stdscr.refresh()

def menu(stdscr):
    curses.curs_set(0)

    printmenu(stdscr)
    
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
