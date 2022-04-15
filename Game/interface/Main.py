import curses
import threading
import time

class Vilao:
  pass

mywindow = curses.initscr()
curses.noecho()

size = 15
size += 2
hX = 1
hY = 1
v = Vilao()
v.x = 5
v.y = 6
hVida = 100
hEnergia = 0
hExp = 0
nomeLocal = "Area da joia\n"
matrix = [[' ' for i in range(size)] for j in range(size)]
inventarioAberto = False
inventario = [
  {
    "id": 1,
    "item": "Cristal de vida pequeno",
    "quantidade": 2,
    "descricao": "Este cristal cura sua vida em 10."
  },
  {
    "id": 2,
    "item": "Cristal de energia médio",
    "quantidade": 3,
    "descricao": "Este cristal aumenta sua energia em 20."
  },
  {
    "id": 3,
    "item": "Escudo de vibranium",
    "quantidade": 1,
    "descricao": "Este escudo absorve todo tipo de dano."
  },
  {
    "id": 4,
    "item": "Mjolnir",
    "quantidade": 1,
    "descricao": "Indignos não podem levantá-lo."
  },
]


def colocaPersonagem(x, y, nome):
  matrix[x][y] = nome

def getMatrixString(m):
  x = ''
  for row in m:
    x += ' '.join(str(item) for item in row)
    x += "\n"
  return x

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
  if c == ord('i') or c == ord('I'):
    return 5

def setBorder():
  for i in range(size):
    matrix[i][0] = '#'
    matrix[0][i] = '#'
    matrix[i][size - 1] = '#'
    matrix[size - 1][i] = '#'

def showInventario():
  for index, item in enumerate(inventario):
    left = item["item"]
    right = item["quantidade"]
    mywindow.addstr(size + index + 2, 0, f"{left : <30}{right : >20}")

def hideInventario():
  mywindow.clear()

setBorder()
colocaPersonagem(hX, hY, 'H')

def main():
  global hX, hY, inventarioAberto, hVida, hit
  while True:

    colocaPersonagem(v.x , v.y, 'V')
    mywindow.addstr(0,0, getMatrixString(matrix))
    mywindow.addstr(size, 0, nomeLocal)
    mywindow.addstr(size + 1, 0, "Vida: " + str(hVida))

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
    if attEntry == 5:
      inventarioAberto = not inventarioAberto  
    if attEntry == 0:
      break

    if inventarioAberto:
      showInventario()
    else:
      hideInventario()

    if hX == v.x and hY == v.y:
      hVida -= 20

    mywindow.refresh()

def refresh():
  while True:
    mywindow.refresh()
    time.sleep(.5)

t1 = threading.Thread(target=main)
# t3 = threading.Thread(target=refresh, daemon=True)
t1.start()
# t3.start()


curses.endwin()
quit()

