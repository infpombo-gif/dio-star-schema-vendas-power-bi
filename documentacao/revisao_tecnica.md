# Revisão Técnica do Star Schema de Vendas

## 1. Objetivo

Documentar os principais pontos técnicos do modelo dimensional proposto para análise de vendas, incluindo produtos, segmentos, países, descontos, períodos e métricas financeiras.

## 2. Proposta de granularidade

A tabela F_VENDAS foi planejada para armazenar uma linha por registro da fonte Microsoft Financial Sample.

Essa granularidade precisa ser confirmada durante a importação e a carga. Também é necessário verificar se o script de carga preserva a correspondência entre cada registro da fonte e sua linha na tabela fato.

A chave VendaKey identifica os registros inseridos, mas não garante, sozinha, que uma mesma linha da fonte não seja carregada mais de uma vez.

## 3. Relacionamentos dimensionais

A tabela fato possui referências previstas para as seguintes dimensões:

- D_PRODUTOS
- D_DETALHES
- D_DESCONTOS
- D_CALENDARIO

Cada dimensão deverá apresentar uma chave primária única. No modelo Power BI, os relacionamentos deverão ser configurados preferencialmente como um para muitos (1:N), com a dimensão no lado 1 e a tabela fato no lado N.

A integridade dos relacionamentos ainda precisa ser verificada com dados importados.

## 4. Dimensão de produtos

A dimensão D_PRODUTOS contém o nome do produto e o preço de fabricação informado pela fonte.

A modelagem pressupõe que cada produto possa ser associado a um único preço de fabricação. Essa premissa precisa ser verificada nos dados originais.

Caso um mesmo produto apresente preços de fabricação diferentes, será necessário revisar a estrutura da dimensão e a regra de carga.

## 5. Dimensão calendário

A dimensão D_CALENDARIO foi planejada com uma linha por dia e uma chave DataKey no formato AAAAMMDD.

O script atual prevê datas entre 1º de setembro de 2013 e 1º de dezembro de 2014. O intervalo precisa ser comparado com as datas efetivamente presentes na fonte.

A tabela fato deverá referenciar a dimensão por DataKey. A correspondência entre a data da fonte e a chave do calendário deverá ser validada durante a carga.

## 6. Métricas

A tabela fato prevê os seguintes campos:

- UnitsSold: unidades vendidas.
- SalePrice: preço de venda.
- GrossSales: valor bruto das vendas.
- Discounts: valor dos descontos.
- Sales: valor das vendas informado pela fonte.
- COGS: custo dos produtos vendidos.
- Profit: lucro informado pela fonte.

As métricas serão importadas da fonte original. Antes de utilizá-las em relatórios, será necessário verificar valores ausentes, tipos de dados, consistência e possíveis divergências entre os valores financeiros.

## 7. Validações antes da implementação

1. Confirmar os nomes e tipos das colunas da tabela financial_sample.
2. Conferir a quantidade de registros e a presença de valores ausentes.
3. Verificar a unicidade dos produtos e a consistência dos preços de fabricação.
4. Confirmar que as dimensões não apresentam chaves duplicadas.
5. Validar a correspondência entre as chaves da tabela fato e as dimensões.
6. Comparar o intervalo do calendário com as datas da fonte.
7. Evitar duplicações caso os scripts de carga sejam executados repetidamente.
8. Comparar as métricas agregadas do modelo com os valores da fonte original.
9. Verificar a cardinalidade dos relacionamentos no Power BI.

## 8. Limitações

A tabela financial_sample ainda precisa ser importada e conferida no MySQL. Os scripts SQL foram propostos, mas ainda não foram executados nem testados.

O modelo do Power BI, os relacionamentos visuais e os relatórios ainda precisam ser implementados e validados.

## 9. Status

Esta revisão documenta os pontos de atenção da proposta de modelagem dimensional. A validação técnica definitiva depende da execução dos scripts e da comparação dos resultados com a fonte de dados.
