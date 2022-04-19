### Ideia de Jogo de turnos

    Mudanças no menu, ao andar e ao batalhar na logica de jogo e no visual 

```
	Terminal:
		Andar: (Se chegar na quina do mapa o jogador nao poderá andar naquela direção. Sempre que andar dar a coordenada atual do player começando de 0, 0)
			Andar para direta
			Andar para esquerda
			Andar para frete
			Andar para trás
			
			(Ao andar pode ser que encontre uma batalha caso o inimigo esteja no quadrado ao lado dando as opções de batalhar ou fugir. Exeplo, se o jogador estiver na coordenada (10, 10) e houver um inimigo na coordenada (12, 10) ao andar para a coordenada (11, 10) ele encontra um vilão e vem a opção de fugir ou batalhar)
			
			Batalha:
				Atacar (Causa dano de acordo com o personagem escolhido e o inimigo a ser enfrentado)
				Usar Item (caso haja algum item consumivel utilizavel na batalha)
				Fugir (tería possibilidade de dar errado forçando a batalha)
			
		Consultar Inventário:
			(Mostra as jóias e os itens)
``` 