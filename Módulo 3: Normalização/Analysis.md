# Análise das Relações

## Legendas
|   Forma Normal   |  Característica  |    
|     :---:      |         :---: |
| 1a. FN     | Todos os atributos são *Monovalorados* e *Atômicos (não há relações aninhadas)*   | 
| 2a. FN     | Está na 1a. FN e atributos comuns não dependem parcialmente de qualquer chave | 
| 3a. FN     | Está na 2a. Forma Normal e atributos comuns não dependem transitivamente de qualquer superchave |
| Boyce Codd | Toda dependência funcional XA, X é uma chave candidata |
| 4a. FN     | Relação R está na quarta forma normal se para todas as dependências multivaloradas não triviais AB, A é uma chave candidata (além de já satisfazer a FNBC) |

## Modelos

### Mapa

- Mapa { Id, Nome, Ano, Planeta, ItemRequisito }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Espaço

- Espaço { Latitude, Longitude, Obstáculo, Mapa }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Obstáculo

- Obstáculo { Descrição }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Personagem

- Personagem { Id, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Héroi

- Héroi { Id, Nome, AgilidadeBase, VidaBase, Vida, Experiência, Espaço, Nível }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Vilão

- Vilão { Id, Nome, Agilidade, Vida, VidaMáxima, Experiência, DanoMáximo, DanoCrítico, Rolagens, Defesa, Espaço }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Luta

- Luta { Id, Herói, Vilão }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Posse

- Posse { Item, Herói, Quantidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Recompensa

- Recompensa { Item, Vilão, Quantidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Imunidade

- Imunidade { Nome, Descrição }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### ImunidadesVilão

- ImunidadesVilão { Vilão, Imunidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### ImunidadesEquipamento

- ImunidadesEquipamento { Equipamento, Imunidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Troca

- Troca { Id, Item, QuantidadeItem, QuantidadeMoeda, Base, Herói }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Consumo

- Consumo { Id, Herói, Consumível }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Rastro

- Rastro { Id, Espaço, Herói }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Item

- Item { Id, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Trocável

- Trocável { Id, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Equipamento

- Equipamento { Id, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Traje

- Traje { Id, Nome, Descrição, QuantidadeMáxima, Valor, Integridade, NívelMínimo, Defesa, Agilidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Arma

- Arma { Id, Nome, Descrição, QuantidadeMáxima, Valor, Integridade, NívelMínimo, DanoMáximo, DanoCrítico, Rolagens }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Consumível

- Consumível { Id, Nome, Descrição, QuantidadeMáxima, Valor, Efeito, Grau, Duração, Cooldown }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Coletável

- Coletável { Id, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Jóia

- Jóia { Id, Nome, Descrição, QuantidadeMáxima, Efeito, Grau, Espaço }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Moeda

- Moeda { Id, Nome, Descrição, QuantidadeMáxima }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Viagem

- Viagem { Id, BaseOrigem, MapaDestino, Herói }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Base

- Base { Mapa, Espaço }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Estoque

- Estoque { Base, Trocável, Quantidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |

### Nível

- Nível { Número, ExperiênciaNecessária, EscalaVida, EscalaAgilidade, EscalaDano }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | Ok |
| 2a. FN     | Ok |
| 3a. FN     | Ok |
| Boyce Codd | Ok |
| 4a. FN     | Ok |
