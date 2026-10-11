# Decisões de Modelagem Dimensional

## Objetivo analítico

O modelo tem como objetivo analisar os dados de vendas, permitindo examinar resultados por produto, segmento de mercado, país, faixa de desconto e período.

## Escolha da tabela fato

A tabela F_VENDAS foi proposta para centralizar as métricas financeiras e as chaves estrangeiras das dimensões.

A granularidade pretendida é uma linha para cada registro da fonte de vendas importado para o modelo. Essa granularidade ainda precisa ser confirmada durante a implementação.

## Dimensões

- **Produtos (D_PRODUTOS):** permite analisar os resultados por produto e consultar o preço de fabricação informado na fonte.
- **Detalhes (D_DETALHES):** permite segmentar as análises por segmento de mercado e país.
- **Descontos (D_DESCONTOS):** permite comparar os resultados entre as diferentes faixas de desconto.
- **Calendário (D_CALENDARIO):** permite analisar as vendas por dia, mês, trimestre, semestre e ano.

## Métricas da tabela fato

A F_VENDAS contempla os seguintes campos numéricos:

- UnitsSold — unidades vendidas.
- SalePrice — preço de venda.
- GrossSales — valor bruto das vendas.
- Discounts — valor dos descontos.
- Sales — valor das vendas após os descontos, conforme informado pela fonte.
- COGS — custo dos produtos vendidos.
- Profit — lucro informado pela fonte.

Os valores serão importados da fonte original. As fórmulas e a consistência entre as métricas ainda precisam ser verificadas.

## Dimensão calendário

A dimensão D_CALENDARIO foi planejada para oferecer atributos temporais e facilitar consultas por períodos.

O script de criação prevê datas entre setembro de 2013 e dezembro de 2014. Esse intervalo deve ser comparado com as datas efetivamente existentes na fonte antes da validação final.

## Chaves e relacionamentos

As dimensões utilizam chaves substitutas para identificar seus registros. A tabela fato utiliza essas chaves como referências às dimensões.

Os relacionamentos previstos são:

- D_PRODUTOS → F_VENDAS
- D_DETALHES → F_VENDAS
- D_DESCONTOS → F_VENDAS
- D_CALENDARIO → F_VENDAS

## Limitações e pontos de atenção

1. A fonte precisa ser importada para a tabela financial_sample antes da execução das cargas.
2. Os nomes e os tipos de dados das colunas precisam ser conferidos após a importação.
3. O relacionamento entre produtos e preço de fabricação pressupõe que o preço possa ser associado ao produto sem ambiguidades.
4. O script de carga da tabela fato precisa de uma estratégia contra duplicações caso seja executado mais de uma vez.
5. O intervalo da dimensão calendário precisa cobrir todas as datas presentes na fonte.
6. As chaves estrangeiras e os resultados das consultas de validação precisam ser testados no MySQL.
7. O modelo ainda não foi validado no Power BI, e nenhum arquivo PBIX foi concluído.

## Status

Este documento descreve as decisões previstas para o modelo dimensional de vendas. A implementação física, a execução dos scripts, a validação dos dados e a criação de relatórios ainda precisam ser realizadas e verificadas.
