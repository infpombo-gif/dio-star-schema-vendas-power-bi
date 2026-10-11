# Revisão Técnica do Star Schema

## 1. Objetivo

Validar a proposta de modelagem dimensional para análise da atuação dos professores, com foco em disciplinas, cursos, departamentos e períodos.

## 2. Granularidade proposta

Cada registro da tabela FATO_ATUACAO_PROFESSOR representa uma oferta de disciplina por um professor em determinado curso e período.

Essa granularidade pressupõe a disponibilidade de dados que identifiquem a oferta. Caso a fonte não possua essa associação explícita, será necessário obter dados complementares ou documentar a regra utilizada para construir os registros.

## 3. Relacionamentos dimensionais

A tabela fato terá chaves estrangeiras para:

- DIM_PROFESSOR
- DIM_DISCIPLINA
- DIM_CURSO
- DIM_DEPARTAMENTO
- DIM_DATA

Cada dimensão deverá ter uma chave primária única. No Power BI, os relacionamentos serão configurados preferencialmente como um para muitos (1:N), da dimensão para a tabela fato.

## 4. Cuidados com o departamento

O departamento associado ao curso não deve ser automaticamente considerado o departamento de vínculo do professor. São informações potencialmente diferentes.

A DIM_DEPARTAMENTO deverá representar uma função claramente definida no modelo. Se forem necessárias as duas análises, elas deverão ser diferenciadas na modelagem.

## 5. Dimensão de datas

A DIM_DATA será uma dimensão calendário com uma linha por dia e uma chave DataKey no formato AAAAMMDD.

A tabela fato deverá referenciar a data de oferta correspondente. Como a fonte original não fornece essa informação, as datas precisarão vir de uma fonte complementar ou ser simuladas para fins didáticos, com essa condição explicitada.

## 6. Medidas

- Quantidade de ofertas: contagem de registros da tabela fato, desde que cada registro represente uma oferta única.
- Carga horária: somente deverá ser usada se houver um valor confiável na fonte ou se os valores simulados estiverem claramente identificados.

Não se deve somar a quantidade de disciplinas por linha sem verificar a granularidade, pois isso pode causar contagens duplicadas.

## 7. Validações antes da implementação

1. Confirmar as chaves primárias e estrangeiras do modelo relacional.
2. Verificar como professores, disciplinas e cursos estão associados.
3. Confirmar que cada registro da fato representa uma ocorrência válida e única.
4. Verificar se as dimensões possuem chaves únicas e sem valores inválidos.
5. Validar a cardinalidade dos relacionamentos.
6. Identificar claramente dados reais, complementares e simulados.

## 8. Status

Revisão conceitual documentada. A implementação física, a validação dos dados e a construção do relatório no Power BI permanecem pendentes até serem efetivamente executadas e verificadas.
