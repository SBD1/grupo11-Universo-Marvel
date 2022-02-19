# Modelo Relacional

## Legenda
  - <u>Chave primária</u>
  - <span style="text-decoration:double underline">Chave candidata</span>
  - **Chave estrangeira**
  - *Atributo especializador*

Mapa(<u>Id</u>, <span style="text-decoration:double underline">Nome, Ano</span>, Planeta, **ItemRequisito**)

Espaço(<u>Latitude, Longitude</u>, **Obstáculo**, **Mapa**)

Obstáculo(<u>Descrição</u>)

Personagem(<u>Id</u>, *Tipo*)
 - Herói(<u>Id</u>, <span style="text-decoration:double underline">Nome</span>, AgilidadeBase, Vida, VidaBase, Experiência, **Espaço**, **Nível**)
 - Vilão(<u>Id</u>, Nome, Agilidade, Vida, VidaMáxima, Experiência, **Espaço**, DanoMáximo, DanoCrítico, Rolagens, Defesa)

Luta(<u>Id</u>, **Herói**, **Vilão**)

Recompensa(<u>**Item**, **Vilão**</u>, Quantidade)

Posse(<u>**Item**, **Herói**</u>, Quantidade)

Imunidade(<u>Nome</u>, Descrição)

ImunidadesVilão(<u>**Vilão**, **Imunidade**</u>)

ImunidadesEquipamento(<u>**Equipamento**, **Imunidade**</u>)

Troca(<u>Id</u>, **Item**, QuantidadeItem, QuantidadeMoeda, **Base**, **Herói**)

Consumo(<u>Id</u>, **Herói**, **Consumível**)

Rastro(<u>Id</u>, **Espaço**, **Herói**)

Item(<u>Id</u>, *Tipo*)
  - Trocável(<u>Id</u>, *Tipo*)
    - Equipamento(<u>Id</u>, *Tipo*)
      - Traje(<u>Id</u>, <span style="text-decoration:double underline">Nome</span>, Descrição, QuantidadeMáxima, Valor, Integridade, NívelMínimo, Defesa, Agilidade)
      - Arma(<u>Id</u>, <span style="text-decoration:double underline">Nome</span>, Descrição, QuantidadeMáxima, Valor, Integridade, NívelMínimo, DanoMáximo, DanoCrítico, Rolagens)
    - Consumível(<u>Id</u>, <span style="text-decoration:double underline">Nome</span>, Descrição, QuantidadeMáxima, Valor, Efeito, Grau, Duração, Cooldown)
  - Coletável(<u>Id</u>, *Tipo*)
    - Jóia(<u>Id</u>, <span style="text-decoration:double underline">Nome</span>, Descrição, QuantidadeMáxima, Efeito, Grau, Espaço)
    - Moeda(<u>Id</u>, <span style="text-decoration:double underline">Nome</span>, Descrição, QuantidadeMáxima)

Viagem(<u>Id</u>, **BaseOrigem**, **MapaDestino**, **Herói**)

Base(<u>**Mapa**</u>, <span style="text-decoration:double underline">**Espaço**</span>)

Estoque(<u>**Base**, **Trocável**</u>, Quantidade)

Nível(<u>Número</u>, ExperiênciaNecessária, EscalaVida, EscalaAgilidade, EscalaDano)