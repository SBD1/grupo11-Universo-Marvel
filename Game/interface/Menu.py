import time
import curses

opcoesMenu = ['Novo jogo', 'Continuar jogo', 'Opções', 'Sair']

def printmenu(mywindow, indexLinhaSelecionada):
    mywindow.clear()
    h, w = mywindow.getmaxyx()

    for indexMenu, row in enumerate(opcoesMenu):
        a = w//2 - len(row)//2
        b = h//2 - len(opcoesMenu)//2 + indexMenu
        if indexMenu == indexLinhaSelecionada:
            mywindow.attron(curses.color_pair(1))
            mywindow.addstr(b, a, row)
            mywindow.attroff(curses.color_pair(1))
        else:
            mywindow.addstr(b, a, row)

    mywindow.refresh()

def menu(mywindow):
    curses.curs_set(0)
    curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_WHITE)

    linhaAtualIndex = 0
    printmenu(mywindow, linhaAtualIndex)
    
    while 1:
        key = mywindow.getch()

        mywindow.clear()

        if key == curses.KEY_UP and linhaAtualIndex > 0:
            linhaAtualIndex -= 1
        elif key == curses.KEY_DOWN and linhaAtualIndex < len(opcoesMenu)-1:
            linhaAtualIndex += 1
        elif key == curses.KEY_ENTER or key in [10, 13]:
            if linhaAtualIndex == len(opcoesMenu)-1:
                break
            mywindow.addstr(0, 0, "You pressed {}".format(opcoesMenu[linhaAtualIndex]))
            mywindow.refresh()
            mywindow.getch()
        # elif key == ord('Q') or key == ord('q'):
            

        printmenu(mywindow, linhaAtualIndex)

        mywindow.refresh()
    
curses.wrapper(menu)
