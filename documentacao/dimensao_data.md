# Dimensão Calendário — D_CALENDARIO

## Objetivo

Permitir a análise temporal das vendas, com agrupamentos por dia, mês, trimestre, semestre e ano.

## Estrutura proposta

| Campo | Tipo | Descrição |
|---|---|---|
| DataKey | Inteiro | Chave no formato AAAAMMDD |
| DataCompleta | DATE | Data completa do calendário |
| Dia | Inteiro | Dia do mês |
| NomeDiaSemana | Texto | Nome do dia da semana |
| Mes | Inteiro | Número do mês |
| NomeMes | Texto | Nome do mês |
| Trimestre | Inteiro | Trimestre do ano |
| Semestre | Inteiro | Semestre do ano |
| Ano | Inteiro | Ano da data |
| AnoMes | Texto | Identificação no formato AAAA-MM |

## Regras de construção

1. Criar uma linha para cada dia do intervalo definido para a análise.
2. Utilizar DataKey no formato AAAAMMDD, por exemplo, 20261010.
3. Garantir que DataCompleta não tenha datas duplicadas.
4. Ordenar NomeMes pelo campo Mes no Power BI.
5. Ordenar NomeDiaSemana por um campo numérico de ordenação, caso seja necessário exibir os dias na sequência correta.
6. Marcar a tabela como tabela de datas no Power BI após sua implementação.
7. Relacionar D_CALENDARIO à F_VENDAS por DataKey.

## Intervalo de datas

O script SQL atual prevê a criação do calendário entre 1º de setembro de 2013 e 1º de dezembro de 2014.

Esse intervalo deve ser conferido com as datas existentes na fonte Microsoft Financial Sample. Se houver datas fora do intervalo, o calendário precisará ser ampliado.

## Relacionamento com a tabela fato

A dimensão D_CALENDARIO será relacionada à tabela F_VENDAS por meio de DataKey.

A chave da dimensão é calculada no formato AAAAMMDD, enquanto DataCompleta armazena o tipo DATE. A correspondência entre essas colunas deve ser validada durante a carga dos dados.

## Status

A estrutura e o script de geração do calendário foram propostos, mas ainda precisam ser executados e testados no MySQL. O relacionamento e a configuração da tabela de datas no Power BI também não foram validados.
