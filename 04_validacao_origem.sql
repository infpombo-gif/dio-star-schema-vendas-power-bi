-- Validação do banco relacional de origem
-- Execute no banco que contém as tabelas originais.
-- Ajuste o schema se o nome real for diferente.

USE universidade;

-- 1. Conferir professores e departamentos
SELECT
    p.idProfessor,
    p.Departamento_idDepartamento
FROM Professor AS p
LIMIT 10;

-- 2. Conferir disciplinas e professores
SELECT
    d.idDisciplina,
    d.Professor_idProfessor
FROM Disciplina AS d
LIMIT 10;

-- 3. Conferir cursos e departamentos
SELECT
    c.idCurso,
    c.Departamento_idDepartamento
FROM Curso AS c
LIMIT 10;

-- 4. Conferir a associação entre disciplinas e cursos
SELECT
    dc.Disciplina_idDisciplina,
    dc.Curso_idCurso
FROM `Disciplina & Curso` AS dc
LIMIT 10;

-- 5. Conferir os dados dos departamentos
SELECT
    dep.idDepartamento,
    dep.Nome,
    dep.Campus
FROM Departamento AS dep
LIMIT 10;
