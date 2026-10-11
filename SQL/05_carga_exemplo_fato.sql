-- Carga demonstrativa para o Star Schema de professores
-- ATENÇÃO: todos os registros abaixo são fictícios.
-- Pré-requisitos: executar 01_criacao_modelo.sql e
-- 02_popular_dimensao_data.sql em um MySQL 8+.

USE universidade_dw;

-- 1. Criar departamentos fictícios
INSERT INTO DIM_DEPARTAMENTO (idDepartamento, Nome, Campus)
VALUES
    (10, 'Departamento A', 'Campus Central'),
    (20, 'Departamento B', 'Campus Norte'),
    (30, 'Departamento C', 'Campus Sul')
ON DUPLICATE KEY UPDATE
    Nome = VALUES(Nome),
    Campus = VALUES(Campus);

-- 2. Criar professores fictícios
INSERT INTO DIM_PROFESSOR (idProfessor)
VALUES (1), (2), (3)
ON DUPLICATE KEY UPDATE
    idProfessor = VALUES(idProfessor);

-- 3. Criar disciplinas fictícias
INSERT INTO DIM_DISCIPLINA (idDisciplina)
VALUES (101), (102), (103), (104)
ON DUPLICATE KEY UPDATE
    idDisciplina = VALUES(idDisciplina);

-- 4. Criar cursos fictícios
INSERT INTO DIM_CURSO (idCurso)
VALUES (201), (202), (203), (204)
ON DUPLICATE KEY UPDATE
    idCurso = VALUES(idCurso);

-- 5. Inserir ofertas hipotéticas na tabela fato
-- Cada linha representa professor + disciplina + curso + data.
INSERT INTO FATO_ATUACAO_PROFESSOR (
    ProfessorKey,
    DisciplinaKey,
    CursoKey,
    DepartamentoProfessorKey,
    DepartamentoCursoKey,
    DataKey,
    QuantidadeOfertas
)
SELECT
    dp.ProfessorKey,
    dd.DisciplinaKey,
    dc.CursoKey,
    dep_prof.DepartamentoKey,
    dep_curso.DepartamentoKey,
    CAST(DATE_FORMAT(ex.DataOferta, '%Y%m%d') AS UNSIGNED),
    1
FROM (
    SELECT 1 AS ProfessorID, 101 AS DisciplinaID,
           201 AS CursoID, 10 AS DepartamentoProfessor,
           10 AS DepartamentoCurso, DATE('2026-02-10') AS DataOferta
    UNION ALL
    SELECT 1, 102, 201, 10, 10, DATE('2026-03-15')
    UNION ALL
    SELECT 2, 101, 202, 20, 10, DATE('2026-04-20')
    UNION ALL
    SELECT 3, 103, 203, 20, 20, DATE('2026-05-05')
    UNION ALL
    SELECT 2, 104, 204, 20, 30, DATE('2026-06-12')
) AS ex
JOIN DIM_PROFESSOR dp
    ON dp.idProfessor = ex.ProfessorID
JOIN DIM_DISCIPLINA dd
    ON dd.idDisciplina = ex.DisciplinaID
JOIN DIM_CURSO dc
    ON dc.idCurso = ex.CursoID
JOIN DIM_DEPARTAMENTO dep_prof
    ON dep_prof.idDepartamento = ex.DepartamentoProfessor
JOIN DIM_DEPARTAMENTO dep_curso
    ON dep_curso.idDepartamento = ex.DepartamentoCurso
JOIN DIM_DATA dt
    ON dt.DataCompleta = ex.DataOferta;

-- 6. Conferir o resultado demonstrativo
SELECT
    dp.idProfessor,
    dd.idDisciplina,
    dc.idCurso,
    dep_prof.Nome AS DepartamentoProfessor,
    dep_curso.Nome AS DepartamentoCurso,
    dt.DataCompleta,
    f.QuantidadeOfertas
FROM FATO_ATUACAO_PROFESSOR f
JOIN DIM_PROFESSOR dp
    ON dp.ProfessorKey = f.ProfessorKey
JOIN DIM_DISCIPLINA dd
    ON dd.DisciplinaKey = f.DisciplinaKey
JOIN DIM_CURSO dc
    ON dc.CursoKey = f.CursoKey
JOIN DIM_DEPARTAMENTO dep_prof
    ON dep_prof.DepartamentoKey = f.DepartamentoProfessorKey
JOIN DIM_DEPARTAMENTO dep_curso
    ON dep_curso.DepartamentoKey = f.DepartamentoCursoKey
JOIN DIM_DATA dt
    ON dt.DataKey = f.DataKey
ORDER BY dt.DataCompleta;
