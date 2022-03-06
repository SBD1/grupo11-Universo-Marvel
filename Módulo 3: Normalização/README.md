# Normalização

### Alterações

 - Atributo "Planeta" em Entidade "Mapa" foi movido para uma entidade própria, pois dependia parcialmente de {Nome, Ano}. (2ª Forma Normal)

 - Atributo "Nível" foi removido da Entidade "Herói" pois dependia transitivamente do Atributo "Experiência". (3ª Forma Normal)

**As outras formas normais já haviam sido atendidas no modelo relacional do módulo anterior**

### Modelo Relacional não Normalizado

![Modelo relacional antes da normalização](https://github.com/SBD1/grupo11-Universo-Marvel/blob/norm/M%C3%B3dulo%202:%20MRel/ModeloRelacional_v6.png?raw=true)

### Modelo Relacional não Normalizado

![Modelo relacional após a normalização](https://github.com/SBD1/grupo11-Universo-Marvel/blob/norm/M%C3%B3dulo%203:%20Normaliza%C3%A7%C3%A3o/ModeloRelacionalNormal_v1.png)