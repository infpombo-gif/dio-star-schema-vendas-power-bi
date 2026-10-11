-- População da dimensão calendário
-- MySQL 8+
USE universidade_dw;

-- Exemplo didático: calendário de 2025 a 2030.
-- Estas datas são um intervalo de calendário, não datas reais de oferta.

WITH RECURSIVE calendario AS (
    SELECT DATE('2025-01-01') AS data_calendario

    UNION ALL

    SELECT DATE_ADD(data_calendario, INTERVAL 1 DAY)
    FROM calendario
    WHERE data_calendario < '2030-12-31'
)
INSERT INTO DIM_DATA (
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
SELECT
    CAST(DATE_FORMAT(data_calendario, '%Y%m%d') AS UNSIGNED),
    data_calendario,
    DAY(data_calendario),
    CASE DAYOFWEEK(data_calendario)
        WHEN 1 THEN 'Domingo'
        WHEN 2 THEN 'Segunda'
        WHEN 3 THEN 'Terca'
        WHEN 4 THEN 'Quarta'
        WHEN 5 THEN 'Quinta'
        WHEN 6 THEN 'Sexta'
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

-- Validação: deve retornar 2191 dias para o intervalo completo.
SELECT
    COUNT(*) AS total_datas,
    MIN(DataCompleta) AS primeira_data,
    MAX(DataCompleta) AS ultima_data
FROM DIM_DATA;
