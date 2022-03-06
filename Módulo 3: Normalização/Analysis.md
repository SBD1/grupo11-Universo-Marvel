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
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Espaço

- Espaço { Latitude, Longitude, Obstáculo, Mapa }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Obstáculo

- Obstáculo { Descrição }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Personagem

- Personagem { Id, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Héroi

- Héroi { Id, Nome, AgilidadeBase, VidaBase, Vida, Experiência, Espaço, Nível }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Vilão

- Vilão { Id, Nome, Agilidade, Vida, VidaMáxima, Experiência, DanoMáximo, DanoCrítico, Rolagens, Defesa, Espaço }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Luta

- Luta { Id, Herói, Vilão }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Posse

- Posse { Item, Herói, Quantidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Recompensa

- Recompensa { Item, Vilão, Quantidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Imunidade

- Imunidade { Nome, Descrição }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### ImunidadesVilão

- ImunidadesVilão { Vilão, Imunidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### ImunidadesEquipamento

- ImunidadesEquipamento { Equipamento, Imunidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Troca

- Troca { Id, Item, QuantidadeItem, QuantidadeMoeda, Base, Herói }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Consumo

- Consumo { Id, Herói, Consumível }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Rastro

- Rastro { Id, Espaço, Herói }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Item

- Item { Id, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Trocável

- Trocável { Id, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Equipamento

- Equipamento { Id, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Traje

- Traje { Id, Nome, Descrição, QuantidadeMáxima, Valor, Integridade, NívelMínimo, Defesa, Agilidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Arma

- Arma { Id, Nome, Descrição, QuantidadeMáxima, Valor, Integridade, NívelMínimo, DanoMáximo, DanoCrítico, Rolagens }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Consumível

- Consumível { Id, Nome, Descrição, QuantidadeMáxima, Valor, Efeito, Grau, Duração, Cooldown }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Coletável

- Coletável { Id, Tipo }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Jóia

- Jóia { Id, Nome, Descrição, QuantidadeMáxima, Efeito, Grau, Espaço }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Moeda

- Moeda { Id, Nome, Descrição, QuantidadeMáxima }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Viagem

- Viagem { Id, BaseOrigem, MapaDestino, Herói }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Base

- Base { Mapa, Espaço }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Estoque

- Estoque { Base, Trocável, Quantidade }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |

### Nível

- Nível { Número, ExperiênciaNecessária, EscalaVida, EscalaAgilidade, EscalaDano }

| Forma      | Ok/Não Ok |
| ---------- | -----:|
| 1a. FN     | -/- |
| 2a. FN     | -/- |
| 3a. FN     | -/- |
| Boyce Codd | -/- |
| 4a. FN     | -/- |
