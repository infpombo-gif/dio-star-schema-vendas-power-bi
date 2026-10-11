-- População da dimensão calendário
-- MySQL 8+
-- Status: script proposto, ainda não executado.
-- Confirmar o intervalo com a fonte antes da execução.

USE vendas_dw;

INSERT INTO D_CALENDARIO (
    DataKey,
    DataCompleta,
    Dia,
    NomeDiaSemana,
    Mes,
    NomeMes,
    Trimestre,
    Semestre,
    Ano,
    AnoMes
)
WITH RECURSIVE calendario AS (
    SELECT DATE('2013-09-01') AS data_calendario

    UNION ALL

    SELECT DATE_ADD(data_calendario, INTERVAL 1 DAY)
    FROM calendario
    WHERE data_calendario < '2014-12-01'
)
SELECT
    CAST(DATE_FORMAT(data_calendario, '%Y%m%d') AS UNSIGNED),
    data_calendario,
    DAY(data_calendario),
    CASE DAYOFWEEK(data_calendario)
        WHEN 1 THEN 'Domingo'
        WHEN 2 THEN 'Segunda-feira'
        WHEN 3 THEN 'Terca-feira'
        WHEN 4 THEN 'Quarta-feira'
        WHEN 5 THEN 'Quinta-feira'
        WHEN 6 THEN 'Sexta-feira'
        WHEN 7 THEN 'Sabado'
    END,
    MONTH(data_calendario),
    CASE MONTH(data_calendario)
        WHEN 1 THEN 'Janeiro'
        WHEN 2 THEN 'Fevereiro'
        WHEN 3 THEN 'Marco'
        WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Maio'
        WHEN 6 THEN 'Junho'
        WHEN 7 THEN 'Julho'
        WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Setembro'
        WHEN 10 THEN 'Outubro'
        WHEN 11 THEN 'Novembro'
        WHEN 12 THEN 'Dezembro'
    END,
    QUARTER(data_calendario),
    IF(MONTH(data_calendario) <= 6, 1, 2),
    YEAR(data_calendario),
    DATE_FORMAT(data_calendario, '%Y-%m')
FROM calendario
ON DUPLICATE KEY UPDATE
    DataCompleta = VALUES(DataCompleta);

-- Validação do calendário
SELECT
    COUNT(*) AS total_datas,
    MIN(DataCompleta) AS primeira_data,
    MAX(DataCompleta) AS ultima_data
FROM D_CALENDARIO;
