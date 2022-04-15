import curses
import threading
import time

class Vilao:
  pass
class Heroi:
  pass

mywindow = curses.initscr()
curses.noecho()

'''Atributos do herói'''
heroi = Heroi()
heroi.vida = 100
heroi.energia = 100
heroi.x = 1
heroi.y = 1
heroi.inventario = []
heroi.experiencia = 0
heroi.nivel = 0

'''Atributos do vilão'''
vilao = Vilao()
vilao.vida = 100
vilao.x = 5
vilao.y = 6

'''Atributos do jogo'''
matrixSize = 15
matrixSize += 2
nomeLocal = "Area da joia\n"
matrix = [[' ' for i in range(matrixSize)] for j in range(matrixSize)]
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
  for i in range(matrixSize):
    matrix[i][0] = '#'
    matrix[0][i] = '#'
    matrix[i][matrixSize - 1] = '#'
    matrix[matrixSize - 1][i] = '#'

def showInventario():
  for index, item in enumerate(inventario):
    left = item["item"]
    right = item["quantidade"]
    mywindow.addstr(matrixSize + index + 2, 0, f"{left : <30}{right : >20}")

def hideInventario():
  mywindow.clear()

setBorder()
colocaPersonagem(heroi.x, heroi.y, 'H')

def main():
  global heroi, inventarioAberto
  while True:

    colocaPersonagem(vilao.x , vilao.y, 'V')
    mywindow.addstr(0,0, getMatrixString(matrix))
    mywindow.addstr(matrixSize, 0, nomeLocal)
    mywindow.addstr(matrixSize + 1, 0, "Vida: " + str(heroi.vida))

    c = mywindow.getch()
    attEntry = entrada(c)
    
    if attEntry == 1:
      heroi.x = sobe(heroi.x, heroi.y) if heroi.x > 1 else heroi.x
    if attEntry == 2:
      heroi.x = desce(heroi.x, heroi.y) if heroi.x < matrixSize - 2 else heroi.x
    if attEntry == 3:
      heroi.y = esquerda(heroi.x, heroi.y) if heroi.y > 1 else heroi.y
    if attEntry == 4:
      heroi.y = direita(heroi.x, heroi.y) if heroi.y < matrixSize - 2 else heroi.y
    if attEntry == 5:
      inventarioAberto = not inventarioAberto  
    if attEntry == 0:
      break

    if inventarioAberto:
      showInventario()
    else:
      hideInventario()

    if heroi.x == vilao.x and heroi.y == vilao.y:
      heroi.vida -= 20

    mywindow.refresh()

def refresh():
  while True:
    mywindow.refresh()
    time.sleep(.5)

t1 = threading.Thread(target=main)
t1.start()


curses.endwin()
quit()

