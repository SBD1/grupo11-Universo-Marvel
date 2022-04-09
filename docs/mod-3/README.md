# Normalização

Atualmente existem 5 formas normais nos Bancos de Dados e que foram utilizadas neste trabalho:

| Formas                      | Propósito                                                    |
|-----------------------------|--------------------------------------------------------------|
| Primeira forma normal (1FN) | Os atributos devem ser atômicos e monovalorados              |
| Segunda forma normal (2FN)  | 1FN + ausência de dependências parciais                      |
| Terceira forma normal (3FN) | 2FN + ausência de dependências transitivas                   |
| Forma Normal de Boyce-Codd  | As chaves de dependências funcionais sejam chaves candidatas |
| Quarta forma normal (4FN)   | Todas as chaves multivaloradas sejam chaves candidatas       |

### Alterações

A entrega do Modelo Relacional já estava normalizada, contudo, algumas alterações precisavam ser feitas: 

 - O atributo "Planeta" em Entidade "Mapa" foi movido para uma entidade própria, pois dependia parcialmente de {Nome, Ano}. (2ª Forma Normal)
 - O atributo "Nível" foi removido da Entidade "Herói" pois dependia transitivamente do Atributo "Experiência". (3ª Forma Normal)

**As outras formas normais já haviam sido atendidas no modelo relacional do módulo anterior.**

### Modelo Relacional não Normalizado

![Modelo relacional antes da normalização](https://github.com/SBD1/grupo11-Universo-Marvel/blob/norm/Modulo2-MRel/ModeloRelacional_v6.png?raw=true)

### Modelo Relacional Normalizado

![Modelo relacional após a normalização](https://github.com/SBD1/grupo11-Universo-Marvel/blob/norm/Modulo3-Normalizacao/ModeloRelacionalNormal_v1.png?raw=true)