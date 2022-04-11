import curses
import time

mywindow = curses.initscr()
curses.noecho()

size = 15
size += 2
area = size ** 2
hX = 1
hY = 1
nomeLocal = "Area da joia\n"
matrix = [[' '  for i in range(size)] for j in range(size)]

def colocaPersonagem(x, y, nome):
  matrix[x][y] = nome

def getMatrixString(m):
  x = ''
  for row in m:
    x += ' '.join(str(item) for item in row)
    x += "\n"
  return x

z = 10
hy = 3
hx = 0

def sobe(x, y):
  matrix[x][y] = ' '
  x -= 1
  colocaPersonagem(x, y, 'H')
  return x

def desce(x, y):
  matrix[x][y] = ' '
  x += 1
  colocaPersonagem(x, y, 'H')
  return x

def direita(x, y):
  matrix[x][y] = ' '
  y += 1
  colocaPersonagem(x, y, 'H')
  return y

def esquerda(x, y):
  matrix[x][y] = ' '
  y -= 1
  colocaPersonagem(x, y, 'H')
  return y

def entrada(c):
  if c == ord('q') or c == ord('Q'):
    return 0
  if c == ord('w') or c == ord('W'):
    return 1
  if c == ord('s') or c == ord('S'):
    return 2
  if c == ord('a') or c == ord('A'):
    return 3
  if c == ord('d') or c == ord('D'):
    return 4

def setBorder():
  for i in range(size):
    matrix[i][0] = '#'
    matrix[0][i] = '#'
    matrix[i][size - 1] = '#'
    matrix[size - 1][i] = '#'

setBorder()


colocaPersonagem(hX, hY, 'H')


while True:

  # H = heroi, V = vilao
  curses.noecho()

  colocaPersonagem(6 , 9, 'V')
  mywindow.addstr(0,0, getMatrixString(matrix))
  mywindow.addstr(size, 0, nomeLocal)
  
  c = mywindow.getch()
  attEntry = entrada(c)
  
  if attEntry == 1:
    hX = sobe(hX, hY) if hX > 1 else hX
  if attEntry == 2:
    hX = desce(hX, hY) if hX < size - 2 else hX
  if attEntry == 3:
    hY = esquerda(hX, hY) if hY > 1 else hY
  if attEntry == 4:
    hY = direita(hX, hY) if hY < size - 2 else hY
  
  if attEntry == 0:
    break

  mywindow.refresh()
  # z -= 1
  # time.sleep(1)

curses.endwin()
quit()