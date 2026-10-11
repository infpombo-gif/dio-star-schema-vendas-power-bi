-- Validações do Star Schema
-- Executar depois da criação e carga das tabelas.

USE universidade_dw;

-- 1. Quantidade de registros em cada tabela
SELECT 'DIM_PROFESSOR' AS tabela, COUNT(*) AS total
FROM DIM_PROFESSOR
UNION ALL
SELECT 'DIM_DISCIPLINA', COUNT(*) FROM DIM_DISCIPLINA
UNION ALL
SELECT 'DIM_CURSO', COUNT(*) FROM DIM_CURSO
UNION ALL
SELECT 'DIM_DEPARTAMENTO', COUNT(*) FROM DIM_DEPARTAMENTO
UNION ALL
SELECT 'DIM_DATA', COUNT(*) FROM DIM_DATA
UNION ALL
SELECT 'FATO_ATUACAO_PROFESSOR', COUNT(*)
FROM FATO_ATUACAO_PROFESSOR;

-- 2. Procurar ofertas sem professor correspondente
SELECT f.*
FROM FATO_ATUACAO_PROFESSOR f
LEFT JOIN DIM_PROFESSOR p
    ON p.ProfessorKey = f.ProfessorKey
WHERE p.ProfessorKey IS NULL;

-- 3. Procurar ofertas sem disciplina correspondente
SELECT f.*
FROM FATO_ATUACAO_PROFESSOR f
LEFT JOIN DIM_DISCIPLINA d
    ON d.DisciplinaKey = f.DisciplinaKey
WHERE d.DisciplinaKey IS NULL;

-- 4. Analisar quantidade de ofertas por professor
SELECT
    p.idProfessor,
    SUM(f.QuantidadeOfertas) AS total_ofertas
FROM FATO_ATUACAO_PROFESSOR f
JOIN DIM_PROFESSOR p
    ON p.ProfessorKey = f.ProfessorKey
GROUP BY p.idProfessor
ORDER BY total_ofertas DESC;

-- 5. Analisar ofertas por ano
SELECT
    d.Ano,
    SUM(f.QuantidadeOfertas) AS total_ofertas
FROM FATO_ATUACAO_PROFESSOR f
JOIN DIM_DATA d
    ON d.DataKey = f.DataKey
GROUP BY d.Ano
ORDER BY d.Ano;

-- Resultado esperado:
-- As consultas de registros órfãos devem retornar zero linhas.
-- As contagens e os totais devem ser avaliados após a execução real.
