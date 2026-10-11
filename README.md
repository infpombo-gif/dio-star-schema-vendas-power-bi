# Star Schema para Análise de Vendas — DIO

Projeto de modelagem dimensional inspirado nos conceitos de Star Schema estudados na DIO, aplicado à análise de vendas com base no conjunto de dados Microsoft Financial Sample.

O repositório reúne a proposta conceitual do modelo, a documentação técnica, um diagrama e scripts SQL propostos para criação, carga e validação.

## Objetivo

Organizar os dados de vendas em uma tabela fato e dimensões, permitindo análises por produto, segmento, país, faixa de desconto e período.

## Modelo dimensional

### Tabela fato
- `F_VENDAS`: métricas de vendas, custos, descontos, unidades vendidas e lucro.

### Dimensões
- `D_PRODUTOS`: produtos e preço de fabricação.
- `D_DETALHES`: segmento de mercado e país.
- `D_DESCONTOS`: faixa de desconto.
- `D_CALENDARIO`: atributos temporais para análise das vendas.

## Estrutura do repositório

```text
dio-star-schema-vendas-power-bi/
├── README.md
├── modelo_star_schema.md
├── dados/
│   └── README.md
├── documentacao/
│   ├── estrutura_modelo.md
│   ├── diagrama_star_schema.mmd
│   ├── decisoes_modelagem.md
│   ├── revisao_tecnica.md
│   └── dimensao_data.md
└── sql/
    ├── 01_criacao_modelo.sql
    ├── 02_popular_dimensao_data.sql
    ├── 03_carga_dimensoes.sql
    ├── 04_validacao_origem.sql
    ├── 05_carga_exemplo_fato.sql
    └── 06_validacao_modelo.sql
```

## Fonte de dados

A fonte planejada é o Microsoft Financial Sample.

Os scripts pressupõem que os dados sejam importados para uma tabela chamada `financial_sample` no MySQL. A importação, os nomes das colunas, os tipos de dados e a quantidade de registros ainda precisam ser conferidos.

## Ordem prevista de execução

1. `sql/01_criacao_modelo.sql` — criar o banco e as tabelas.
2. Importar a fonte para a tabela `financial_sample`.
3. `sql/02_popular_dimensao_data.sql` — popular a dimensão calendário.
4. `sql/04_validacao_origem.sql` — inspecionar os dados de origem.
5. `sql/03_carga_dimensoes.sql` — carregar as dimensões.
6. Conferir registros sem correspondência antes da carga da fato.
7. `sql/05_carga_exemplo_fato.sql` — carregar a tabela fato.
8. `sql/06_validacao_modelo.sql` — executar as validações.

A ordem é uma proposta e deve ser confirmada durante os testes.

## Status do projeto

### Desenvolvido no GitHub
- Documentação conceitual do modelo de vendas.
- Estrutura SQL proposta para a fato e as dimensões.
- Script proposto para gerar o calendário.
- Consultas propostas para carga e validação.
- Diagrama conceitual do Star Schema.

### Pendente
- Importar e validar os dados no MySQL.
- Executar e testar os scripts SQL.
- Conferir as chaves, os relacionamentos e a granularidade da fato.
- Revisar a aderência do modelo aos requisitos originais do desafio.
- Desenvolver e validar o modelo no Power BI.
- Criar e adicionar o arquivo `.pbix`, caso exigido na entrega.

## Limitações

Este repositório representa uma proposta de implementação. Os scripts SQL ainda não foram executados nem validados em um ambiente MySQL, e o modelo Power BI não foi concluído.

O projeto não deve ser considerado uma implementação funcional concluída até que os testes sejam realizados.
