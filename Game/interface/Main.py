import curses
import time
import pyfiglet

class Vilao:
  pass
class Heroi:
  pass

isInMenu = True

mywindow = curses.initscr()
curses.noecho()

opcoesMenu = ['Novo jogo', 'Continuar jogo', 'Opções', 'Sair']
mensagemfimdejogo = ['Fim de jogo\n Pressione Q para sair.']

def printmenu(mywindow, indexLinhaSelecionada):
  mywindow.clear()
  h, w = mywindow.getmaxyx()

  mywindow.addstr((h // 2) - 10, 0, pyfiglet.figlet_format("Avengers", justify="right"))

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

'''Atributos do herói'''
heroi = Heroi()
heroi.vida = 10
heroi.energia = 100
heroi.x = 1
heroi.y = 1
heroi.inventario = []
heroi.experiencia = 0
heroi.nivel = 0
heroi.isAlive = True

'''Atributos do vilão'''
vilao = Vilao()
vilao.vida = 100
vilao.x = 2
vilao.y = 1

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

def resetGame():
  global heroi, vilao
  vilao.nome = "Thanos"
  vilao.vida = 100
  vilao.x = 2
  vilao.y = 1
  heroi.nome = "Thor"
  heroi.vida = 100
  heroi.energia = 100
  heroi.x = 1
  heroi.y = 1
  heroi.inventario = []
  heroi.experiencia = 0
  heroi.nivel = 0
  heroi.isAlive = True
  colocaPersonagem(heroi.x, heroi.y, 'H')

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
  if c == ord('y') or c == ord('Y'):
    return 6
  if c == ord('n') or c == ord('N'):
    return 7
  if c == ord('b') or c == ord('B'):
    return 8

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
    mywindow.addstr(matrixSize + index + 3, 0, f"{left : <30}{right : >20}")

def hideInventario():
  mywindow.clear()

setBorder()

def batalha(heroi, vilao, mywindow):
  mywindow.refresh()
  h, w = mywindow.getmaxyx()
  pad = curses.newpad(h, w)
  while vilao.vida > 0:
    pad.addstr(0, 0, pyfiglet.figlet_format("{} vs {}".format(heroi.nome, vilao.nome), font="slant", justify="right"))
    pad.addstr(6, 0, "Life {}: {}".format(heroi.nome, heroi.vida))
    pad.addstr(7, 0, "Life {}: {}".format(vilao.nome, vilao.vida))
    pad.refresh(0,0,0,0,h,w)
    movimento = entrada(mywindow.getch())
    if movimento == 8:
      vilao.vida -= 50
    pad.clear()



  time.sleep(3)
  mywindow.clear()

def main():
  global heroi, inventarioAberto
  curses.curs_set(0)

  while heroi.isAlive:
    colocaPersonagem(vilao.x , vilao.y, 'V')
    mywindow.addstr(0,0, getMatrixString(matrix))
    mywindow.addstr(matrixSize, 0, nomeLocal)
    mywindow.addstr(matrixSize + 1, 0, "Vida: " + str(heroi.vida))
    mywindow.addstr(matrixSize + 2, 0, "Energia: " + str(heroi.energia))

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
      heroi.isAlive = False

    if inventarioAberto:
      showInventario()
    else:
      hideInventario()

    if heroi.x == vilao.x and heroi.y == vilao.y:
      if inventarioAberto:
        hideInventario()
      mywindow.addstr(matrixSize + 3, 0, "Iniciar batalha contra {}?Y/N".format(vilao.nome))
      choice = entrada(c)
      if choice == 6:
        batalha(heroi, vilao, mywindow)
      if choice == 7:
        mywindow.clear()
        mywindow.addstr(matrixSize + 3, 0, "Thanos: eu nem sei quem você é!")



    if heroi.vida <= 0:
      heroi.isAlive = False
      menu(mywindow)

    mywindow.refresh()

def menu(mywindow):
  global isInMenu
  curses.curs_set(0)
  curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_WHITE)
  
  if not heroi.isAlive:
    mywindow.refresh()
    h, w = mywindow.getmaxyx()
    pad = curses.newpad(h, w)
    pad.addstr((h // 2) - 3, 0, pyfiglet.figlet_format("Game Over", font="slant", justify="right"))
    pad.refresh(0,0,0,0,h,w)
    time.sleep(3)

  linhaAtualIndex = 0
  printmenu(mywindow, linhaAtualIndex)
    
  while isInMenu:
    key = mywindow.getch()
    mywindow.clear()


    if key == curses.KEY_UP and linhaAtualIndex > 0:
      linhaAtualIndex -= 1
    elif key == curses.KEY_DOWN and linhaAtualIndex < len(opcoesMenu)-1:
        linhaAtualIndex += 1
    elif key == curses.KEY_ENTER or key in [10, 13]:
      if linhaAtualIndex == len(opcoesMenu) - 1:
        isInMenu = False
      if opcoesMenu[linhaAtualIndex] == 'Novo jogo':
        resetGame()
        main()

    printmenu(mywindow, linhaAtualIndex)
    mywindow.refresh()
    
curses.wrapper(menu)

curses.endwin()
quit()

