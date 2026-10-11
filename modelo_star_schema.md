# Modelo Dimensional — Star Schema para Análise de Vendas

## Objetivo

Definir uma proposta de modelo dimensional para análise de vendas, utilizando o esquema estrela (*Star Schema*) como referência para organizar os dados e facilitar futuras análises de produtos, descontos, períodos e resultados comerciais.

## Granularidade

A granularidade proposta para a tabela fato é **uma linha por registro de venda ou item vendido**, conforme a estrutura disponível na fonte de dados. Essa definição deverá ser confirmada durante a implementação.

## Diagrama do modelo

O diagrama do modelo dimensional será documentado em `documentacao/diagrama_star_schema.mmd` e deverá representar a tabela fato central e suas dimensões relacionadas.

## Tabela fato

**F_VENDAS**

A tabela fato deverá concentrar os registros de vendas e as métricas utilizadas nas análises.

Campos propostos:

- Chaves das dimensões relacionadas.
- Quantidade vendida.
- Valor de venda, quando disponível na fonte.
- Valor de desconto, quando disponível na fonte.
- Outras métricas comerciais disponíveis nos dados de origem.

Os nomes e tipos definitivos dos campos deverão ser validados com a fonte de dados utilizada.

## Dimensões

- **D_PRODUTOS:** informações de identificação e classificação dos produtos.
- **D_PRODUTOS_DETALHES:** atributos complementares dos produtos, conforme os dados disponíveis.
- **D_DESCONTOS:** informações relacionadas às faixas ou condições de desconto.
- **D_DETALHES:** informações complementares necessárias para as análises comerciais.
- **D_CALENDÁRIO:** atributos de data, dia, mês, trimestre, semestre e ano, para permitir análises temporais.

## Premissas e limitações

A estrutura definitiva das tabelas, seus campos e relacionamentos deverá ser definida a partir da fonte de dados escolhida. Nenhum campo deve ser considerado confirmado antes dessa verificação.

A dimensão calendário poderá ser construída no Power BI com DAX, utilizando a função `CALENDAR()`, após a definição do intervalo de datas.

O relacionamento entre a tabela fato e as dimensões deverá ser validado durante a implementação, garantindo a consistência das chaves e a adequação ao esquema estrela.

## Status do projeto

Este documento representa uma proposta conceitual de modelagem dimensional para análise de vendas. A implementação no Power BI, a validação dos relacionamentos e a conferência dos resultados ainda precisam ser realizadas.

