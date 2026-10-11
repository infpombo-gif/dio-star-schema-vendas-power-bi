# Modelo Dimensional — Star Schema para Análise de Vendas

## Objetivo

Definir uma proposta de modelo dimensional para análise de vendas, utilizando o esquema estrela (*Star Schema*) para organizar os dados e facilitar análises de produtos, descontos, segmentos, países, períodos e resultados financeiros.

## Granularidade

A granularidade pretendida para a tabela fato é uma linha por registro da fonte Microsoft Financial Sample.

Essa definição deverá ser confirmada durante a importação e a validação dos dados, garantindo que o carregamento preserve os registros de origem sem duplicações indevidas.

## Diagrama do modelo

O diagrama está documentado em `documentacao/diagrama_star_schema.mmd` e representa a tabela fato central e suas quatro dimensões relacionadas.

## Tabela fato

### F_VENDAS

A tabela fato foi planejada para centralizar os registros de vendas e suas métricas financeiras.

Campos previstos:

- `VendaKey`: identificador do registro na tabela fato.
- `ProdutoKey`: referência à dimensão de produtos.
- `DetalheKey`: referência à dimensão de detalhes comerciais.
- `DescontoKey`: referência à dimensão de descontos.
- `DataKey`: referência à dimensão calendário.
- `UnitsSold`: quantidade de unidades vendidas.
- `SalePrice`: preço de venda.
- `GrossSales`: valor bruto das vendas.
- `Discounts`: valor dos descontos.
- `Sales`: valor das vendas informado pela fonte.
- `COGS`: custo dos produtos vendidos.
- `Profit`: lucro informado pela fonte.

Os campos e seus tipos estão definidos nos scripts SQL propostos, mas ainda precisam ser testados com os dados importados.

## Dimensões

- **D_PRODUTOS:** identifica os produtos e armazena o preço de fabricação informado pela fonte.
- **D_DETALHES:** reúne os atributos de segmento de mercado e país.
- **D_DESCONTOS:** representa as faixas de desconto.
- **D_CALENDARIO:** reúne atributos temporais como dia, mês, trimestre, semestre e ano.

## Relacionamentos

As dimensões foram planejadas para se relacionar com a tabela fato por meio de chaves estrangeiras:

- `D_PRODUTOS.ProdutoKey` → `F_VENDAS.ProdutoKey`
- `D_DETALHES.DetalheKey` → `F_VENDAS.DetalheKey`
- `D_DESCONTOS.DescontoKey` → `F_VENDAS.DescontoKey`
- `D_CALENDARIO.DataKey` → `F_VENDAS.DataKey`

Cada relacionamento deverá ser validado durante a execução dos scripts e, posteriormente, na configuração do modelo no Power BI.

## Fonte de dados e premissas

A fonte planejada é o Microsoft Financial Sample. Os scripts pressupõem que seus dados estejam disponíveis em uma tabela chamada `financial_sample` no MySQL.

A dimensão calendário é gerada por um script SQL. Seu intervalo deverá ser comparado com o período efetivamente presente na fonte.

Também será necessário verificar a consistência do preço de fabricação por produto e definir como evitar duplicações durante cargas repetidas.

## Status do projeto

Este documento descreve uma proposta de modelagem dimensional para análise de vendas. Os scripts SQL estão estruturados como propostas, mas ainda não foram executados nem validados. A implementação do modelo e dos relatórios no Power BI permanece pendente.

O modelo atual possui quatro dimensões e deve ser comparado aos requisitos originais do desafio DIO antes da entrega final.
