import curses, pyfiglet, time, random

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
heroi.dano = 10

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
    "item": "Cristal de vida",
    "quantidade": 2,
    "descricao": "Este cristal cura sua vida em 10."
  },
  {
    "id": 2,
    "item": "Cristal de energia",
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
  vilao.dano = 20
  heroi.nome = "Thor"
  heroi.vida = 100
  heroi.energia = 100
  heroi.x = 1
  heroi.y = 1
  heroi.inventario = []
  heroi.experiencia = 0
  heroi.nivel = 0
  heroi.isAlive = True
  heroi.defendendo = False
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
  if c == ord('q') or c == ord('Q'):  # sair do jogo
    return 0
  if c == ord('w') or c == ord('W'):  # andar pra cima
    return 1
  if c == ord('s') or c == ord('S'):  # andar pra baixo
    return 2
  if c == ord('a') or c == ord('A'):  # andar para a esquerda
    return 3
  if c == ord('d') or c == ord('D'):  # andar para a direita
    return 4
  if c == ord('i') or c == ord('I'):  # abrir inventário
    return 5
  if c == ord('y') or c == ord('Y'):  # aceitar batalha
    return 6
  if c == ord('n') or c == ord('N'):  # negar batalha
    return 7
  if c == ord('f') or c == ord('F'):  # atacar no seu turno
    return 8
  if c == ord('d') or c == ord('D'):  # defender próximo ataque
    return 9
  if c == ord('v') or c == ord('V'):  # consumir cristal de vida
    return 10
  if c == ord('e') or c == ord('E'):  # consumir cristal de energia
    return 11

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
  jogada = 0
  titleLimit = 6
  chanceCritico = 0.1
  chanceAcerto = 0.8
  danoCritico = heroi.dano * 2

  while vilao.vida > 0 or heroi.vida > 0:
    pad.addstr(0, 0, pyfiglet.figlet_format("{} vs {}".format(heroi.nome, vilao.nome), font="slant", justify="right"))
    pad.addstr(titleLimit, 0, "❤️  {}: {}".format(heroi.nome, heroi.vida))
    pad.addstr(titleLimit + 1, 0, "⚡ {}: {}".format(heroi.nome, heroi.energia))
    pad.addstr(titleLimit + 3, 0, "❤️  {}: {}".format(vilao.nome, vilao.vida))
    pad.addstr(titleLimit + 6, 0, "F - Atacar")
    pad.addstr(titleLimit + 7, 0, "D - Defender próximo ataque")
    pad.addstr(titleLimit + 8, 0, "V - Usar cristal de vida (caso tenha)")
    pad.addstr(titleLimit + 9, 0, "E - Usar cristal de energia (caso tenha)")
    pad.addstr(titleLimit + 12, 0, "Agora é a vez de {} atacar!".format(heroi.nome if jogada %2 == 0 else vilao.nome))
    pad.addstr(titleLimit + 15, 0, "Registro de batalha:")
    pad.refresh(0,0,0,0,h,w)


    if jogada % 2 == 0:   # vez do herói
      pad.clear()
      movimento = entrada(mywindow.getch())
      heroi.defendendo = False

      if heroi.energia > 0:
        if movimento == 8:  # vai atacar
          ataque = random.random() < chanceAcerto
          if ataque:  # acertou o ataque
            critico = random.random() < chanceCritico
            if not critico:
              chanceCritico += 0.1  # a chance do critico aumenta 10% a cada ataque sem critico
              vilao.vida -= heroi.dano
            else:
              vilao.vida -= danoCritico
              chanceCritico = 0.1   # se acertou o critico a chance de outro ataque critico cai pra 10%
            pad.clear()
          else: # errou o ataque
            pad.addstr(titleLimit + 16, 0, "{} errou o ataque!".format(heroi.nome))

        elif movimento == 9:  # vai defender o próximo ataque
          heroi.defendendo = True
        
        elif movimento == 10: # vai usar cristal de vida
          achou = False
          for index, item in enumerate(inventario):
            if item["item"] == "Cristal de vida" and item["quantidade"] > 0:
              heroi.vida = 100
              item["quantidade"] -= 1
              achou = True
              pad.addstr(titleLimit + 16, 0, "{} cosumiu um cristal de ❤️ ! Agora possui {}".format(heroi.nome, item["quantidade"]))
          if not achou:
            pad.addstr(titleLimit + 16, 0, "{} tentou consumir um cristal de ❤️  mas não encontrou nenhum.".format(heroi.nome))
            jogada += 1
            heroi.energia += 10
        
        elif movimento == 11: # vai usar cristal de vida
          achou = False
          for index, item in enumerate(inventario):
            if item["item"] == "Cristal de energia" and item["quantidade"] > 0:
              heroi.energia = 110
              item["quantidade"] -= 1
              achou = True
              pad.addstr(titleLimit + 16, 0, "{} cosumiu um cristal de ⚡! Agora possui {}".format(heroi.nome, item["quantidade"]))
          if not achou:
            pad.addstr(titleLimit + 16, 0, "{} tentou consumir um cristal de ⚡ mas não encontrou nenhum.".format(heroi.nome))
            jogada += 1
            heroi.energia += 10
      
      heroi.energia -= 10

    else:                 # vez do vilão
      pad.clear()

      if not heroi.defendendo:
        ataque = random.random() < 0.5


    time.sleep(1)
    jogada += 1
        



  time.sleep(3)
  mywindow.clear()

def main():
  global heroi, inventarioAberto
  curses.curs_set(0)

  while heroi.isAlive:
    colocaPersonagem(vilao.x , vilao.y, 'V')
    mywindow.addstr(0,0, getMatrixString(matrix))
    mywindow.addstr(matrixSize, 0, nomeLocal)
    mywindow.addstr(matrixSize + 1, 0, "❤️  : " + str(heroi.vida))
    mywindow.addstr(matrixSize + 2, 0, "⚡ : " + str(heroi.energia))

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

