# Dados do Projeto

## Objetivo

Este diretório reúne informações e orientações relacionadas aos dados utilizados no projeto de modelagem dimensional para análise de vendas.

## Fonte de dados

A fonte planejada é o conjunto de dados Microsoft Financial Sample, que contém informações sobre produtos, segmentos, países, descontos, quantidades vendidas, valores financeiros e datas.

O conjunto de dados precisa ser importado e validado antes da execução dos scripts SQL.

## Arquivos

- `exemplo_modelo.csv`: arquivo de exemplo herdado da estrutura anterior do projeto. Seu conteúdo deve ser revisado para confirmar se ainda é relevante para o modelo de vendas.

## Como interpretar os dados

A tabela de origem prevista no MySQL é `financial_sample`. Os scripts de carga utilizam seus registros para preencher as dimensões e a tabela fato.

Os nomes das colunas, os tipos de dados e o conteúdo efetivamente importado devem ser conferidos antes da execução.

## Cuidados

- O Microsoft Financial Sample é a fonte planejada, mas sua importação ainda não foi validada neste projeto.
- Os scripts SQL ainda precisam ser executados e testados.
- Os resultados financeiros devem ser conferidos com os dados de origem.
- Não afirmar que o modelo está implementado ou validado antes dos testes.
- O relatório Power BI e o arquivo PBIX ainda não foram concluídos.

## Próximas etapas

1. Conferir e importar o arquivo de origem para o MySQL.
2. Executar os scripts de criação e carga.
3. Validar as dimensões, os relacionamentos e as métricas.
4. Revisar o diagrama para garantir que corresponda ao modelo SQL.
5. Desenvolver e validar o relatório no Power BI.
