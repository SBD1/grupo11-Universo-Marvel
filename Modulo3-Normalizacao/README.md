# Normalização

### Alterações

 - Atributo "Planeta" em Entidade "Mapa" foi movido para uma entidade própria, pois dependia parcialmente de {Nome, Ano}. (2ª Forma Normal)

 - Atributo "Nível" foi removido da Entidade "Herói" pois dependia transitivamente do Atributo "Experiência". (3ª Forma Normal)

**As outras formas normais já haviam sido atendidas no modelo relacional do módulo anterior**

### Modelo Relacional não Normalizado

![Modelo relacional antes da normalização](https://github.com/SBD1/grupo11-Universo-Marvel/blob/norm/Modulo2-MRel/ModeloRelacional_v6.png?raw=true)

### Modelo Relacional Normalizado

![Modelo relacional após a normalização](https://github.com/SBD1/grupo11-Universo-Marvel/blob/norm/Modulo3-Normalizacao/ModeloRelacionalNormal_v1.png?raw=true)