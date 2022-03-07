# Análise das Relações

## Legendas

### Formas
|   Forma Normal   |  Característica  |    
|     :---:      |         :---: |
| 1a. FN     | Todos os atributos são *Monovalorados* e *Atômicos (não há relações aninhadas)*   | 
| 2a. FN     | Está na 1a. FN e atributos comuns não dependem parcialmente de qualquer chave | 
| 3a. FN     | Está na 2a. Forma Normal e atributos comuns não dependem transitivamente de qualquer superchave |
| Boyce Codd | Toda dependência funcional XA, X é uma chave candidata |
| 4a. FN     | Relação R está na quarta forma normal se para todas as dependências multivaloradas não triviais AB, A é uma chave candidata (além de já satisfazer a FNBC) |

### Relacional
|   Tipo  |  Característica  |    
|     :---:      |         :---: |
| Chave primária | <ins>Chave primária</ins> |
| Chave secundária | ~~Chave secundária~~ |
| Chave estrangeira | **Chave estrangeira** |
| Atributo especializante | *Chave estrangeira* |

## Relações

### Mapa

- Mapa { <ins>Id</ins>, Nome, Ano, **Requisito** }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Planeta

- Planeta { <ins>**Mapa**</ins>, Planeta }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Espaço

- Espaço { <ins>Latitude</ins>, <ins>Longitude</ins>, **Mapa**, **Obstáculo**  }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Obstáculo

- Obstáculo { <ins>Descrição</ins> }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Personagem

- Personagem { <ins>Id</ins>, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Héroi

- Héroi { <ins>Id</ins>, Nome, AgilidadeBase, VidaBase, Vida, Experiência, **Espaço**, **Traje**, **Arma** }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Vilão

- Vilão { <ins>Id</ins>, Nome, Agilidade, Vida, Experiência, DanoMáximo, DanoCrítico, Rolagens, Defesa, **Espaço** }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Luta

- Luta { <ins>**Herói**</ins>, <ins>**Vilão**</ins> }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### EfeitosLuta

- EfeitosLuta { <ins>**Luta**</ins>, <ins>**Efeito**</ins>, <ins>**Personagem**</ins> }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Posse

- Posse { <ins>**Item**</ins>, <ins>**Herói**</ins>, Quantidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Recompensa

- Recompensa { <ins>**Item**</ins>, <ins>**Vilão**</ins>, Quantidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### EfeitosVilão

- EfeitosVilão { <ins>**Vilão**</ins>, <ins>**Efeito**</ins> }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Imunidade

- Imunidade { <ins>Nome</ins>, Descrição }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### ImunidadesVilão

- ImunidadesVilão { <ins>Vilão</ins>, <ins>Imunidade</ins> }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### ImunidadesEquipamento

- ImunidadesEquipamento { <ins>Equipamento</ins>, Imunidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Troca

- Troca { <ins>Id</ins>, Item, QuantidadeItem, QuantidadeMoeda, Base, Herói }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Consumo

- Consumo { <ins>Id</ins>, Herói, Consumível }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Rastro

- Rastro { <ins>Id</ins>, Espaço, Herói }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Item

- Item { <ins>Id</ins>, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Trocável

- Trocável { <ins>Id</ins>, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Equipamento

- Equipamento { <ins>Id</ins>, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Traje

- Traje { <ins>Id</ins>, Nome, Descrição, QuantidadeMáxima, Valor, Integridade, NívelMínimo, Defesa, Agilidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Arma

- Arma { <ins>Id</ins>, Nome, Descrição, QuantidadeMáxima, Valor, Integridade, NívelMínimo, DanoMáximo, DanoCrítico, Rolagens }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Consumível

- Consumível { <ins>Id</ins>, Nome, Descrição, QuantidadeMáxima, Valor, Efeito, Grau, Duração, Cooldown }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Coletável

- Coletável { <ins>Id</ins>, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Jóia

- Jóia { <ins>Id</ins>, Nome, Descrição, QuantidadeMáxima, Efeito, Grau, Espaço }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Moeda

- Moeda { <ins>Id</ins>, Nome, Descrição, QuantidadeMáxima }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Viagem

- Viagem { <ins>Id</ins>, BaseOrigem, MapaDestino, Herói }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Base

- Base { <ins>Mapa</ins>, <ins>Espaço</ins> }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Estoque

- Estoque { <ins>Base</ins>, Trocável, Quantidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Nível

- Nível { <ins>Número</ins>, ExperiênciaNecessária, EscalaVida, EscalaAgilidade, EscalaDano }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |
