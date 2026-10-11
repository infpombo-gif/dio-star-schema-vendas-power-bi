# Estrutura do Modelo Dimensional

## 1. FATO_ATUACAO_PROFESSOR

Tabela central do modelo, com uma linha por combinação de professor, disciplina, curso e data de oferta.

| Campo | Descrição |
|---|---|
| ProfessorKey | Chave estrangeira para DIM_PROFESSOR |
| DisciplinaKey | Chave estrangeira para DIM_DISCIPLINA |
| CursoKey | Chave estrangeira para DIM_CURSO |
| DepartamentoKey | Chave estrangeira para DIM_DEPARTAMENTO |
| DataKey | Chave estrangeira para DIM_DATA |
| QuantidadeDisciplinas | Medida numérica para contagem de ofertas |
| CargaHoraria | Carga horária da oferta, se disponível |

## 2. Dimensões

### DIM_PROFESSOR
- ProfessorKey — chave primária substituta.
- idProfessor — identificador original.
- DepartamentoVinculoKey — referência ao departamento de vínculo, se aplicável.

### DIM_DISCIPLINA
- DisciplinaKey — chave primária substituta.
- idDisciplina — identificador original.

### DIM_CURSO
- CursoKey — chave primária substituta.
- idCurso — identificador original.
- idDepartamento — referência original ao departamento responsável pelo curso.

### DIM_DEPARTAMENTO
- DepartamentoKey — chave primária substituta.
- idDepartamento — identificador original.
- Nome — nome do departamento.
- Campus — campus do departamento.

### DIM_DATA
- DataKey — chave primária no formato AAAAMMDD.
- DataCompleta — data completa.
- Dia, Mês, NomeMes, Trimestre, Semestre e Ano.

## 3. Relacionamentos

Todas as dimensões se relacionam com a tabela fato em uma relação de um para muitos (1:N), com a dimensão no lado 1 e a tabela fato no lado N.

- DIM_PROFESSOR → FATO_ATUACAO_PROFESSOR
- DIM_DISCIPLINA → FATO_ATUACAO_PROFESSOR
- DIM_CURSO → FATO_ATUACAO_PROFESSOR
- DIM_DEPARTAMENTO → FATO_ATUACAO_PROFESSOR
- DIM_DATA → FATO_ATUACAO_PROFESSOR

## 4. Premissas

O diagrama de origem não contém datas de oferta nem carga horária. Esses dados precisam ser obtidos de outra fonte ou simulados e identificados como dados didáticos.

A granularidade proposta depende da existência de registros de oferta de disciplinas por curso, professor e data. A tabela relacional original não apresenta uma tabela específica de ofertas; portanto, essa estrutura deverá ser validada na implementação.

As tabelas de alunos e matrículas não fazem parte do escopo analítico.
