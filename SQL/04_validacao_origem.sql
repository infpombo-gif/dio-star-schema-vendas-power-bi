-- Validação da fonte de dados de vendas
-- Fonte prevista: Microsoft Financial Sample
-- MySQL 8+
-- Status: consultas propostas, ainda não executadas.
--
-- Pré-requisito:
-- importar a planilha para uma tabela chamada financial_sample.

USE vendas_dw;

-- 1. Conferir os primeiros registros da fonte
SELECT *
FROM financial_sample
LIMIT 10;

-- 2. Conferir os produtos disponíveis
SELECT
    Product,
    COUNT(*) AS total_registros
FROM financial_sample
WHERE Product IS NOT NULL
GROUP BY Product
ORDER BY Product;

-- 3. Conferir os segmentos e países
SELECT
    Segment,
    Country,
    COUNT(*) AS total_registros
FROM financial_sample
GROUP BY Segment, Country
ORDER BY Segment, Country;

-- 4. Conferir as faixas de desconto
SELECT
    `Discount Band`,
    COUNT(*) AS total_registros
FROM financial_sample
GROUP BY `Discount Band`
ORDER BY `Discount Band`;

-- 5. Conferir o intervalo de datas
SELECT
    MIN(Date) AS primeira_data,
    MAX(Date) AS ultima_data,
    COUNT(*) AS total_registros
FROM financial_sample;

-- 6. Conferir valores ausentes nas principais colunas
SELECT
    SUM(Product IS NULL) AS produtos_ausentes,
    SUM(Segment IS NULL) AS segmentos_ausentes,
    SUM(Country IS NULL) AS paises_ausentes,
    SUM(Date IS NULL) AS datas_ausentes,
    SUM(Sales IS NULL) AS vendas_ausentes,
    SUM(Profit IS NULL) AS lucros_ausentes
FROM financial_sample;

-- Observação:
-- Os resultados devem ser comparados com a planilha original.
-- As consultas dependem da importação prévia dos dados
-- e ainda não foram executadas nem validadas.
