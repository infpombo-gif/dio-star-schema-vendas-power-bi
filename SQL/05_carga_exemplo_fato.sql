```sql
-- Carga da tabela fato de vendas
-- Fonte esperada: financial_sample
-- MySQL 8+
-- Status: script proposto, ainda não executado.
--
-- ATENÇÃO:
-- A carga substitui os registros existentes em F_VENDAS.
-- Confira a fonte e as dimensões antes de executar.

USE vendas_dw;

-- 1. Conferir quantas linhas existem na origem
SELECT COUNT(*) AS total_origem
FROM financial_sample;

-- 2. Identificar registros sem correspondência nas dimensões
SELECT COUNT(*) AS registros_sem_correspondencia
FROM financial_sample src
LEFT JOIN D_PRODUTOS p
    ON p.Produto = src.Product
LEFT JOIN D_DETALHES det
    ON det.Segment = src.Segment
   AND det.Country = src.Country
LEFT JOIN D_DESCONTOS descnt
    ON descnt.DiscountBand = src.`Discount Band`
LEFT JOIN D_CALENDARIO cal
    ON cal.DataCompleta = DATE(src.Date)
WHERE p.ProdutoKey IS NULL
   OR det.DetalheKey IS NULL
   OR descnt.DescontoKey IS NULL
   OR cal.DataKey IS NULL;

-- 3. Inserir somente após verificar que não há
-- registros sem correspondência na consulta anterior.
-- Se o resultado for maior que zero, investigue antes
-- de continuar. Não execute a carga sem corrigir a causa.

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
    ON cal.DataCompleta = DATE(src.Date);

-- 4. Conferir o resultado da carga
SELECT
    COUNT(*) AS total_registros,
    SUM(UnitsSold) AS total_unidades,
    SUM(GrossSales) AS vendas_brutas,
    SUM(Discounts) AS total_descontos,
    SUM(Sales) AS vendas_liquidas,
    SUM(COGS) AS custo_das_vendas,
    SUM(Profit) AS lucro_total
FROM F_VENDAS;

COMMIT;
```
