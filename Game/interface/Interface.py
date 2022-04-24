import curses
from curses import textpad

def main(mywindow):
    curses.curs_set(0)
    sh, sw = mywindow.getmaxyx()
    box = [[3,3], [sh-3, sw-3]]
    textpad.rectangle(mywindow, box[0][0], box[0][1], box[1][0], box[1][1])

    personagem = [[sh//2, sw//2-1]]
    direction = curses.KEY_RIGHT

    for y,x in personagem:
        mywindow.addstr(y, x, '#')

    mywindow.getch()

curses.wrapper(main)