-- População da dimensão calendário
-- MySQL 8+
-- Status: script proposto, ainda não validado por execução.

USE vendas_dw;

-- Calendário de 2025 a 2030.
-- O intervalo é ilustrativo e deverá ser ajustado
-- conforme as datas presentes na fonte de vendas.

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
    SELECT DATE('2025-01-01') AS data_calendario

    UNION ALL

    SELECT DATE_ADD(data_calendario, INTERVAL 1 DAY)
    FROM calendario
    WHERE data_calendario < '2030-12-31'
)
SELECT
    CAST(DATE_FORMAT(data_calendario, '%Y%m%d') AS UNSIGNED),
    data_calendario,
    DAY(data_calendario),
    CASE DAYOFWEEK(data_calendario)
        WHEN 1 THEN 'Domingo'
        WHEN 2 THEN 'Segunda'
        WHEN 3 THEN 'Terca'
        WHEN 4 THEN 'Quarta'
        WHEN 5 THEN 'Sexta'
        WHEN 6 THEN 'Sabado'
        WHEN 7 THEN 'Quarta'
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

-- Validação da dimensão calendário
SELECT
    COUNT(*) AS total_datas,
    MIN(DataCompleta) AS primeira_data,
    MAX(DataCompleta) AS ultima_data
FROM D_CALENDARIO;
