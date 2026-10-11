# Dimensão Data — DIM_DATA

## Objetivo

Permitir a análise temporal da atuação dos professores, com agrupamentos por dia, mês, trimestre, semestre e ano.

## Estrutura proposta

| Campo | Tipo sugerido | Descrição |
|---|---|---|
| DataKey | Inteiro | Chave no formato AAAAMMDD |
| DataCompleta | Data | Data do calendário |
| Dia | Inteiro | Dia do mês |
| NomeDiaSemana | Texto | Nome do dia da semana |
| NumeroDiaSemana | Inteiro | Número do dia da semana |
| Mes | Inteiro | Número do mês |
| NomeMes | Texto | Nome do mês |
| Trimestre | Inteiro | Trimestre do ano |
| Semestre | Inteiro | Semestre do ano |
| Ano | Inteiro | Ano da data |
| AnoMes | Texto | Identificação no formato AAAA-MM |

## Regras de construção

1. Criar uma linha para cada dia do intervalo definido para a análise.
2. Usar DataKey no formato AAAAMMDD, por exemplo, 20261010.
3. Garantir que DataCompleta não tenha datas duplicadas.
4. Ordenar NomeMes pelo campo Mes.
5. Ordenar NomeDiaSemana por NumeroDiaSemana.
6. Marcar a tabela como tabela de datas no Power BI, após sua implementação.
7. Relacionar DIM_DATA à tabela fato por DataKey.

## Datas de oferta

O diagrama relacional original não contém datas de oferta de disciplinas. Para associar datas à tabela fato, será necessário obter dados complementares ou simular datas para fins didáticos.

Datas simuladas não devem ser apresentadas como registros históricos reais.

## Status

Estrutura conceitual documentada. A geração do calendário e a criação do relacionamento no Power BI ainda precisam ser implementadas e testadas.
