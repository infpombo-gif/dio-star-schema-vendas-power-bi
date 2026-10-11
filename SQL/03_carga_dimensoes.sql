-- Carga das dimensões do modelo de vendas
-- Fonte prevista: Microsoft Financial Sample
-- MySQL 8+
-- Status: script proposto, ainda não executado.
--
-- Pré-requisito: importar a fonte para financial_sample
-- e executar sql/01_criacao_modelo.sql.

USE vendas_dw;

-- 1. Verificar produtos com preços de fabricação diferentes
SELECT
    Product,
    COUNT(DISTINCT `Manufacturing Price`) AS quantidade_precos
FROM financial_sample
WHERE Product IS NOT NULL
GROUP BY Product
HAVING COUNT(DISTINCT `Manufacturing Price`) > 1;

-- 2. Carga de produtos
INSERT INTO D_PRODUTOS (
    Produto,
    ManufacturingPrice
)
SELECT
    Product,
    MIN(`Manufacturing Price`)
FROM financial_sample
WHERE Product IS NOT NULL
GROUP BY Product
ON DUPLICATE KEY UPDATE
    ManufacturingPrice = VALUES(ManufacturingPrice);

-- 3. Carga de segmento e país
INSERT IGNORE INTO D_DETALHES (
    Segment,
    Country
)
SELECT DISTINCT
    Segment,
    Country
FROM financial_sample
WHERE Segment IS NOT NULL
  AND Country IS NOT NULL;

-- 4. Carga de faixas de desconto
INSERT IGNORE INTO D_DESCONTOS (
    DiscountBand
)
SELECT DISTINCT
    `Discount Band`
FROM financial_sample
WHERE `Discount Band` IS NOT NULL;

-- 5. Conferência da quantidade de registros por dimensão
SELECT 'D_PRODUTOS' AS dimensao, COUNT(*) AS total
FROM D_PRODUTOS
UNION ALL
SELECT 'D_DETALHES', COUNT(*)
FROM D_DETALHES
UNION ALL
SELECT 'D_DESCONTOS', COUNT(*)
FROM D_DESCONTOS
UNION ALL
SELECT 'D_CALENDARIO', COUNT(*)
FROM D_CALENDARIO;
