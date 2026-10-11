-- Carga da tabela fato de vendas
-- Fonte esperada: financial_sample
-- MySQL 8+
-- Status: script proposto, ainda não executado.
--
-- Pré-requisitos:
-- 1. Executar sql/01_criacao_modelo.sql.
-- 2. Executar sql/02_popular_dimensao_data.sql.
-- 3. Importar a fonte para financial_sample.
-- 4. Executar sql/03_carga_dimensoes.sql.
--
-- ATENÇÃO:
-- Este script substitui o conteúdo atual da tabela fato.
-- Execute somente após conferir a fonte e as dimensões.

USE vendas_dw;

START TRANSACTION;

DELETE FROM F_VENDAS;

INSERT INTO F_VENDAS (
    ProdutoKey,
    DetalheKey,
    DescontoKey,
    DataKey,
    UnitsSold,
    SalePrice,
    GrossSales,
    Discounts,
    Sales,
    COGS,
    Profit
)
SELECT
    p.ProdutoKey,
    det.DetalheKey,
    descnt.DescontoKey,
    cal.DataKey,
    src.`Units Sold`,
    src.`Sale Price`,
    src.`Gross Sales`,
    src.Discounts,
    src.Sales,
    src.COGS,
    src.Profit
FROM financial_sample src
JOIN D_PRODUTOS p
    ON p.Produto = src.Product
JOIN D_DETALHES det
    ON det.Segment = src.Segment
   AND det.Country = src.Country
JOIN D_DESCONTOS descnt
    ON descnt.DiscountBand = src.`Discount Band`
JOIN D_CALENDARIO cal
    ON cal.DataCompleta = src.Date;

COMMIT;

-- Conferência resumida da tabela fato
SELECT
    COUNT(*) AS total_registros,
    SUM(UnitsSold) AS total_unidades,
    SUM(GrossSales) AS vendas_brutas,
    SUM(Discounts) AS total_descontos,
    SUM(Sales) AS vendas_liquidas,
    SUM(COGS) AS custo_das_vendas,
    SUM(Profit) AS lucro_total
FROM F_VENDAS;
