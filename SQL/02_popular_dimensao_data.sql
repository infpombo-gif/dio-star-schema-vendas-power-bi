-- População da dimensão calendário
-- Banco de dados: MySQL 8+
-- Status: script proposto, ainda não executado.
--
-- O período abaixo corresponde ao intervalo esperado
-- da base Microsoft Financial Sample.
-- Confirmar as datas após importar a fonte.

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

-- Validação do calendário
SELECT
    COUNT(*) AS total_datas,
    MIN(DataCompleta) AS primeira_data,
    MAX(DataCompleta) AS ultima_data
FROM D_CALENDARIO;
