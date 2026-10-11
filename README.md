# Star Schema para Análise de Vendas — DIO

Projeto de modelagem dimensional inspirado nos conceitos de Star Schema estudados na DIO, aplicado à análise de vendas com base no conjunto de dados Microsoft Financial Sample.

O repositório reúne a proposta conceitual do modelo, a documentação técnica, um diagrama e scripts SQL para criação, carga e validação.

## Objetivo

Organizar os dados de vendas em uma tabela fato e dimensões, permitindo análises por produto, segmento, país, faixa de desconto e período.

## Modelo dimensional

### Tabela fato

- `F_VENDAS`: concentra as métricas de vendas, custos, descontos, unidades vendidas e lucro.

### Dimensões

- `D_PRODUTOS`: informações sobre produtos e preço de fabricação.
- `D_DETALHES`: segmento de mercado e país.
- `D_DESCONTOS`: faixa de desconto.
- `D_CALENDARIO`: atributos temporais para análise das vendas.

## Estrutura do repositório

```text
dio-star-schema-vendas-power-bi/
├── README.md
├── modelo_star_schema.md
├── dados/
│   ├── README.md
│   └── exemplo_modelo.csv
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
