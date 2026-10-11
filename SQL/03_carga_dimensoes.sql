-- Carga das dimensões a partir do banco relacional de origem.
-- Ajuste o nome do banco de origem conforme sua instalação.
-- Este script pressupõe que as tabelas originais já existem.

USE universidade_dw;

-- Professores
INSERT INTO DIM_PROFESSOR (idProfessor)
SELECT DISTINCT p.idProfessor
FROM universidade.Professor AS p
WHERE p.idProfessor IS NOT NULL
ON DUPLICATE KEY UPDATE
    idProfessor = VALUES(idProfessor);

-- Disciplinas
INSERT INTO DIM_DISCIPLINA (idDisciplina)
SELECT DISTINCT d.idDisciplina
FROM universidade.Disciplina AS d
WHERE d.idDisciplina IS NOT NULL
ON DUPLICATE KEY UPDATE
    idDisciplina = VALUES(idDisciplina);

-- Cursos
INSERT INTO DIM_CURSO (idCurso)
SELECT DISTINCT c.idCurso
FROM universidade.Curso AS c
WHERE c.idCurso IS NOT NULL
ON DUPLICATE KEY UPDATE
    idCurso = VALUES(idCurso);

-- Departamentos
INSERT INTO DIM_DEPARTAMENTO (
    idDepartamento,
    Nome,
    Campus
)
SELECT DISTINCT
    dep.idDepartamento,
    dep.Nome,
    dep.Campus
FROM universidade.Departamento AS dep
WHERE dep.idDepartamento IS NOT NULL
ON DUPLICATE KEY UPDATE
    Nome = VALUES(Nome),
    Campus = VALUES(Campus);

-- Verificação da quantidade de registros carregados
SELECT 'DIM_PROFESSOR' AS dimensao, COUNT(*) AS total
FROM DIM_PROFESSOR
UNION ALL
SELECT 'DIM_DISCIPLINA', COUNT(*) FROM DIM_DISCIPLINA
UNION ALL
SELECT 'DIM_CURSO', COUNT(*) FROM DIM_CURSO
UNION ALL
SELECT 'DIM_DEPARTAMENTO', COUNT(*) FROM DIM_DEPARTAMENTO;
