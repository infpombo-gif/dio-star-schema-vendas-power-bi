-- Carga das dimensões do modelo de vendas
-- Fonte prevista: Microsoft Financial Sample
-- Status: script de referência; requer tabelas de origem importadas.

USE vendas_dw;

-- ATENÇÃO:
-- Este script pressupõe que os dados da planilha já foram
-- importados para uma tabela de origem chamada financial_sample.
-- Os nomes das colunas devem ser conferidos na importação.

-- Produtos
INSERT INTO D_PRODUTOS (Produto, ManufacturingPrice)
SELECT DISTINCT
    Product,
    `Manufacturing Price`
FROM financial_sample
WHERE Product IS NOT NULL
ON DUPLICATE KEY UPDATE
    ManufacturingPrice = VALUES(ManufacturingPrice);

-- Segmento e país
INSERT INTO D_DETALHES (Segment, Country)
SELECT DISTINCT
    Segment,
    Country
FROM financial_sample
WHERE Segment IS NOT NULL
  AND Country IS NOT NULL
ON DUPLICATE KEY UPDATE
    Country = VALUES(Country);

-- Faixas de desconto
INSERT INTO D_DESCONTOS (DiscountBand)
SELECT DISTINCT
    `Discount Band`
FROM financial_sample
WHERE `Discount Band` IS NOT NULL
ON DUPLICATE KEY UPDATE
    DiscountBand = VALUES(DiscountBand);

-- Verificação das dimensões
SELECT 'D_PRODUTOS' AS dimensao, COUNT(*) AS total
FROM D_PRODUTOS
UNION ALL
SELECT 'D_DETALHES', COUNT(*) FROM D_DETALHES
UNION ALL
SELECT 'D_DESCONTOS', COUNT(*) FROM D_DESCONTOS
UNION ALL
SELECT 'D_CALENDARIO', COUNT(*) FROM D_CALENDARIO;
