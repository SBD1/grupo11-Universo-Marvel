# Dependências Funcionais

## Mapa
Id &rarr; Nome \
Id &rarr; Ano \
Id &rarr; Planeta \
Id &rarr; Requisito 

Nome &rarr; Planeta (Parcial)

Nome, Ano &rarr; Planeta \
Nome, Ano &rarr; Requisito \
Nome, Ano &rarr; Id 

## Espaço
Latitude, Longitude, Mapa &rarr; Obstáculo

## Herói
Id &rarr; Nome \
Id &rarr; AgilidadeBase \
Id &rarr; VidaBase \
Id &rarr; Vida \
Id &rarr; Experiência \
Id &rarr; Espaço \
Id &rarr; Nível \
Id &rarr; Traje \
Id &rarr; Arma 

Nome &rarr; Id \
Nome &rarr; AgilidadeBase \
Nome &rarr; VidaBase \
Nome &rarr; Vida \
Nome &rarr; Experiência \
Nome &rarr; Espaço \
Nome &rarr; Nível \
Nome &rarr; Traje \
Nome &rarr; Arma 

## Vilão
Id &rarr; Nome \
Id &rarr; Agilidade \
Id &rarr; Vida \
Id &rarr; VidaMáxima \
Id &rarr; Experiência \
Id &rarr; DanoMáximo \
Id &rarr; DanoCrítico \
Id &rarr; Rolagens \
Id &rarr; Defesa \
Id &rarr; Espaço 

## Posse
Item, Herói &rarr; Quantidade

## Recompensa
Item, Vilão &rarr; Quantidade

## Imunidade
Nome &rarr; Descrição

## Troca
Id &rarr; Item \
Id &rarr; QuantidadeItem \
Id &rarr; VendaOuCompra \
Id &rarr; Base \
Id &rarr; Herói 

## Consumo
Herói, Consumível &rarr; Vezes

## Rastro
Id &rarr; Espaço \
Id &rarr; Herói

## Traje
Id &rarr; Nome \
Id &rarr; Descrição \
Id &rarr; QuantidadeMáxima \
Id &rarr; Valor \
Id &rarr; NívelMínimo \
Id &rarr; Defesa \
Id &rarr; Agilidade

Nome &rarr; Id \
Nome &rarr; Descrição \
Nome &rarr; QuantidadeMáxima \
Nome &rarr; Valor \
Nome &rarr; NívelMínimo \
Nome &rarr; Defesa \
Nome &rarr; Agilidade

## Arma
Id &rarr; Nome \
Id &rarr; Descrição \
Id &rarr; QuantidadeMáxima \
Id &rarr; Valor \
Id &rarr; NívelMínimo \
Id &rarr; DanoMáximo \
Id &rarr; DanoCrítico \
Id &rarr; Rolagens

Nome &rarr; Id \
Nome &rarr; Descrição \
Nome &rarr; QuantidadeMáxima \
Nome &rarr; Valor \
Nome &rarr; NívelMínimo \
Nome &rarr; DanoMáximo \
Nome &rarr; DanoCrítico \
Nome &rarr; Rolagens

## Consumível
Id &rarr; Nome \
Id &rarr; Descrição \
Id &rarr; QuantidadeMáxima \
Id &rarr; Valor \
Id &rarr; Efeito \
Id &rarr; Grau \
Id &rarr; Duração \
Id &rarr; Cooldown

Nome &rarr; Id \
Nome &rarr; Descrição \
Nome &rarr; QuantidadeMáxima \
Nome &rarr; Valor \
Nome &rarr; Efeito \
Nome &rarr; Grau \
Nome &rarr; Duração \
Nome &rarr; Cooldown

## Jóia
Id &rarr; Nome \
Id &rarr; Descrição \
Id &rarr; QuantidadeMáxima \
Id &rarr; Efeito \
Id &rarr; Grau 

Nome &rarr; Id \
Nome &rarr; Descrição \
Nome &rarr; QuantidadeMáxima \
Nome &rarr; Efeito \
Nome &rarr; Grau

## Moeda
Id &rarr; Nome \
Id &rarr; Descrição \
Id &rarr; QuantidadeMáxima

Nome &rarr; Id \
Nome &rarr; Descrição \
Nome &rarr; QuantidadeMáxima

## Efeito
Nome &rarr; Descrição

## Viagem
Id &rarr; Origem \
Id &rarr; Destino \
Id &rarr; Herói

## Estoque
Base, Trocável &rarr; Quantidade

## Nível
Número &rarr; ExperiênciaNecessária \
Número &rarr; EscalaVida \
Número &rarr; EscalaAgilidade \
Número &rarr; EscalaDano

ExperiênciaNecessária &rarr; Número \
ExperiênciaNecessária &rarr; EscalaVida \
ExperiênciaNecessária &rarr; EscalaAgilidade \
ExperiênciaNecessária &rarr; EscalaDano