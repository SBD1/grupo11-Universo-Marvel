import curses
from curses import textpad
import math, time, random

def getMatrixString(m):
  x = ''
  for row in m:
    x += ' '.join(str(item) for item in row)
    x += "\n"
  return x

def main(mywindow):
    curses.curs_set(0)
    sh, sw = mywindow.getmaxyx()
    sh = math.floor(sh / 2)
    sw = math.floor(sw / 2)
    box = [[1,1], [sh-3, sw-3]]
    # matrix = [['#' for i in range(sw)] for j in range(sh)]
    textpad.rectangle(mywindow, box[0][0], box[0][1], box[1][0], box[1][1]) 

    print(math.floor(sh / 8))

    # matrix[sh//2][sw//2-1] = '🟢'
    # mywindow.addstr(1,1, )

    # personagem = [[sh//2, sw//2 + 1]]
    direction = curses.KEY_RIGHT

    mywindow.addstr(sh, sw//2, '#')
    mywindow.addstr(sh, sw//2-1, '#')
    mywindow.addstr(sh, sw//2-2, '#')
    mywindow.addstr(sh, sw//2-3, '#')

    #def colocaPersonagem(y, x):
    #sh, sw = mywindow.getmaxyx()
    #personagem = [[sh//2, sw//2-1]]
    #direction = curses.KEY_RIGHT

    #for y,x in personagem:
    #    mywindow.addstr(y, x, '#')

    mywindow.getch()

curses.wrapper(main)