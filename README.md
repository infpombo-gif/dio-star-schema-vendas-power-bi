# Star Schema para Análise de Professores — DIO

Projeto de modelagem dimensional desenvolvido como parte de um desafio da DIO, com foco na análise da atuação dos professores, disciplinas ministradas, cursos, departamentos e períodos.

O repositório contém a proposta do esquema em estrela, scripts SQL, documentação técnica e dados fictícios para demonstração. A implementação e a validação em MySQL e Power BI permanecem pendentes.

## Status do projeto

### Concluído no GitHub
- Documentação da proposta de modelagem dimensional.
- Estrutura SQL proposta para as dimensões e a tabela fato.
- Script proposto para criação da dimensão calendário.
- Documentação das decisões e premissas de modelagem.
- Diagrama conceitual do Star Schema.
- Arquivo CSV com dados fictícios para demonstração.

### Pendente
- Validar os nomes e tipos das colunas no banco de origem.
- Executar e testar os scripts SQL em um servidor MySQL.
- Validar a granularidade e a carga da tabela fato.
- Configurar e testar os relacionamentos no Power BI.
- Criar visualizações para análise da atuação dos professores.

### Limitações
O diagrama original não apresenta datas de oferta nem carga horária. Os dados do CSV são fictícios e servem somente para demonstração. O modelo ainda não foi executado nem validado em um ambiente de banco de dados ou Power BI.

## Estrutura do repositório

```text
dio-star-schema-professores-power-bi/
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
```

## Como navegar pelo projeto

1. Consulte `modelo_star_schema.md` para entender a proposta conceitual.
2. Consulte `documentacao/diagrama_star_schema.mmd` para visualizar as relações entre fato e dimensões.
3. Leia `documentacao/decisoes_modelagem.md` e `documentacao/revisao_tecnica.md` para conhecer as premissas.
4. Confira `dados/exemplo_modelo.csv` para visualizar os registros fictícios.
5. Consulte os scripts da pasta `sql/` para acompanhar a estrutura, a carga e as validações propostas.

## Ordem sugerida dos scripts SQL

1. `01_criacao_modelo.sql`
2. `02_popular_dimensao_data.sql`
3. `05_carga_exemplo_fato.sql` para a demonstração com dados fictícios.
4. `06_validacao_modelo.sql` para as verificações.
5. `03_carga_dimensoes.sql` e `04_validacao_origem.sql` somente após ajustar os nomes do schema e confirmar a estrutura real da origem.

**Atenção:** os scripts ainda não foram executados nem testados. A ordem acima é uma referência de trabalho, não uma confirmação de execução bem-sucedida.

## Limitações conhecidas

O modelo relacional de origem não fornece datas de oferta nem carga horária. Os registros demonstrativos são fictícios e não devem ser interpretados como dados históricos reais. A implementação no MySQL e a configuração do modelo no Power BI permanecem pendentes.
