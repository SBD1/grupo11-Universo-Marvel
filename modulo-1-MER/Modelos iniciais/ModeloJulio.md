## Entidades
* Mapa
* Planeta
* Jogador
* Personagem
* Habilidade
* Inventário
* Item
* Atributo
* Loja

## Atributos
* Mapa (*id*, nome, ano, planetaId, obstáculos)
* Planeta (*id*, nome, latitude, longitude)
* Jogador(*id*, *nome*, heroiOuVilao, personagemId, moeda)
* Habilidade(*id*, )
* Personagem(*id*, *nome*, heroiOuVilao, atributoId, planetaId, mapaId)
* Inventário(*id*, jogadorId, itemId, slot, quantidade)
* Item(*id*, nome, durabilidade, tipo, consumivel, equipavel, trocavel, coletável, preço, atributoId, habilidadeId)
* Atributo(*id*, agilidade, defesa, vida, força, imunidade)
* Habilidade(*id*, efeito, grau, duração, cooldown, valor)
* Loja(*id*, itemId, quantidade, preço)