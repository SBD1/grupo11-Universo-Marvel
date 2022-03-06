# Análise das Relações

## Legendas
|   Forma Normal   |  Característica  |    
|     :---:      |         :---: |
| 1a. FN   | Todos os atributos são *Monovalorados* e *Atômicos (não há relações aninhadas)*   | 
| 2a. FN     | Está na 1a. FN e atributos comuns não dependem parcialmente de qualquer chave | 
| 3a. FN   | Está na 2a. Forma Normal e atributos comuns não dependem transitivamente de qualquer superchave |
| Boyce Codd  | Toda dependência funcional XA, X é uma chave candidata |
| 4a. FN    | Relação R está na quarta forma normal se para todas as dependências multivaloradas não triviais AB, A é uma chave candidata (além de já satisfazer a FNBC) |

## Modelos

Mapa { Id, Nome, Ano, Planeta, ItemRequisito }

Espaço { Latitude, Longitude, Obstáculo, Mapa }

Obstáculo { Descrição }

Personagem { Id, Tipo }

Héroi { Id, Nome, AgilidadeBase, VidaBase, Vida, Experiência, Espaço, Nível }

Vilão { Id, Nome, Agilidade, Vida, VidaMáxima, Experiência, DanoMáximo, DanoCrítico, Rolagens, Defesa, Espaço }

Luta { Id, Herói, Vilão }

Posse { Item, Herói, Quantidade }

Recompensa { Item, Vilão, Quantidade }

Imunidade { Nome, Descrição }

ImunidadesVilão { Vilão, Imunidade }

ImunidadesEquipamento { Equipamento, Imunidade }

Troca { Id, Item, QuantidadeItem, QuantidadeMoeda, Base, Herói }

Consumo { Id, Herói, Consumível }

Rastro { Id, Espaço, Herói }

Item { Id, Tipo }

Trocável { Id, Tipo }

Equipamento { Id, Tipo }

Traje { Id, Nome, Descrição, QuantidadeMáxima, Valor, Integridade, NívelMínimo, Defesa, Agilidade }

Arma { Id, Nome, Descrição, QuantidadeMáxima, Valor, Integridade, NívelMínimo, DanoMáximo, DanoCrítico, Rolagens }

Consumível { Id, Nome, Descrição, QuantidadeMáxima, Valor, Efeito, Grau, Duração, Cooldown }

Coletável { Id, Tipo }

Jóia { Id, Nome, Descrição, QuantidadeMáxima, Efeito, Grau, Espaço }

Moeda { Id, Nome, Descrição, QuantidadeMáxima }

Viagem { Id, BaseOrigem, MapaDestino, Herói }

Base { Mapa, Espaço }

Estoque { Base, Trocável, Quantidade }

Nível { Número, ExperiênciaNecessária, EscalaVida, EscalaAgilidade, EscalaDano }
