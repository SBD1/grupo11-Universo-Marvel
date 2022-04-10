import curses
import time

mywindow = curses.initscr()

size = 10
matrix =  [['0'  for i in range(size)] for j in range(size)]

def colocaPersonagem(m, x, y, nome):
  m[x][y] = nome

  return m

def getMatrixString(m):
  x = ''
  for row in m:
    x += ' '.join(str(item) for item in row)
    x += "\n"
  return x

z = 10
hy = 3
hx = 0

def atualizaPosicaoX(hx):
  hx = hx + 1
  return hx

def atualizaPosicaoY(hy):
  hy = hy + 1
  return hy

while z > 1:
    # H = heroi, V = vilao
    colocaPersonagem(matrix, hx, hy, 'H')
    # if key == down:
    #   x -= 1
    # if key == up:
    #   x += 1
    hy = atualizaPosicaoY(hy)
    hx = atualizaPosicaoY(hx)
    colocaPersonagem(matrix, 6, 9, 'V')
    mywindow.addstr(0,0, getMatrixString(matrix))
    
    mywindow.refresh()
    z -= 1
    time.sleep(1)

curses.endwin()
quit()