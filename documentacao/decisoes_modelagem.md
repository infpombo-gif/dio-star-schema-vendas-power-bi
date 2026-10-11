# Decisões de Modelagem Dimensional

## Objetivo analítico

O modelo tem como objetivo analisar a atuação dos professores, relacionando-os às disciplinas, aos cursos, aos departamentos e às datas de oferta.

## Escolha da tabela fato

A tabela FATO_ATUACAO_PROFESSOR foi proposta para centralizar as informações quantitativas e as chaves das dimensões.

A granularidade inicialmente planejada é uma linha por combinação de professor, disciplina, curso e data de oferta.

## Dimensões selecionadas

- **Professor:** permite analisar a atuação individual dos docentes.
- **Disciplina:** permite identificar as disciplinas ministradas.
- **Curso:** permite comparar a distribuição das disciplinas entre cursos.
- **Departamento:** permite agrupar as análises por unidade acadêmica.
- **Data:** permite analisar a atuação ao longo do tempo.

## Dimensão de datas

Como o diagrama relacional original não apresenta datas de oferta, a dimensão DIM_DATA será criada para disponibilizar atributos temporais, como dia, mês, trimestre, semestre e ano.

As datas associadas às ofertas deverão vir de uma fonte complementar ou ser simuladas para fins didáticos. Dados simulados devem ser identificados claramente.

## Exclusão de alunos e matrículas

As tabelas ALUNO e MATRICULADO foram excluídas do modelo porque o desafio solicita que a análise seja centrada nos professores e dispensa informações dos alunos.

## Limitações e pontos de atenção

1. O modelo relacional associa professores às disciplinas e disciplinas aos cursos por meio de uma tabela associativa.
2. O diagrama não apresenta uma tabela de ofertas com datas específicas.
3. A carga horária não aparece entre os atributos fornecidos no diagrama.
4. Antes da implementação, é necessário validar como representar disciplinas ministradas em diferentes cursos e períodos sem gerar duplicações indevidas.
5. As chaves substitutas das dimensões deverão ser criadas durante a preparação dos dados.

## Status

Este documento descreve a proposta conceitual. A implementação física, a validação dos relacionamentos e a construção de relatórios no Power BI devem ser realizadas e verificadas antes de serem consideradas concluídas.
