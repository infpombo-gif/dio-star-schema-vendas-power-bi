-- Validações do Star Schema de vendas
-- MySQL 8+
-- Executar após a criação e a carga das tabelas.
-- Status: consultas propostas, ainda não executadas.

USE vendas_dw;

-- 1. Quantidade de registros por tabela
SELECT 'D_PRODUTOS' AS tabela, COUNT(*) AS total
FROM D_PRODUTOS
UNION ALL
SELECT 'D_DETALHES', COUNT(*) FROM D_DETALHES
UNION ALL
SELECT 'D_DESCONTOS', COUNT(*) FROM D_DESCONTOS
UNION ALL
SELECT 'D_CALENDARIO', COUNT(*) FROM D_CALENDARIO
UNION ALL
SELECT 'F_VENDAS', COUNT(*) FROM F_VENDAS;

-- 2. Verificar vendas sem produto correspondente
SELECT f.VendaKey, f.ProdutoKey
FROM F_VENDAS f
LEFT JOIN D_PRODUTOS p
    ON p.ProdutoKey = f.ProdutoKey
WHERE p.ProdutoKey IS NULL;

-- 3. Verificar vendas sem detalhes comerciais correspondentes
SELECT f.VendaKey, f.DetalheKey
FROM F_VENDAS f
LEFT JOIN D_DETALHES d
    ON d.DetalheKey = f.DetalheKey
WHERE d.DetalheKey IS NULL;

-- 4. Analisar vendas por produto
SELECT
    p.Produto,
    SUM(f.UnitsSold) AS total_unidades,
    SUM(f.Sales) AS vendas_liquidas,
    SUM(f.Profit) AS lucro_total
FROM F_VENDAS f
JOIN D_PRODUTOS p
    ON p.ProdutoKey = f.ProdutoKey
GROUP BY p.Produto
ORDER BY vendas_liquidas DESC;

-- 5. Analisar vendas e lucro por ano
SELECT
    d.Ano,
    SUM(f.Sales) AS vendas_liquidas,
    SUM(f.COGS) AS custo_das_vendas,
    SUM(f.Profit) AS lucro_total
FROM F_VENDAS f
JOIN D_CALENDARIO d
    ON d.DataKey = f.DataKey
GROUP BY d.Ano
ORDER BY d.Ano;

-- 6. Conferir possíveis valores ausentes nas métricas
SELECT
    SUM(Sales IS NULL) AS vendas_ausentes,
    SUM(COGS IS NULL) AS custos_ausentes,
    SUM(Profit IS NULL) AS lucros_ausentes
FROM F_VENDAS;

-- Resultado esperado:
-- As consultas de registros órfãos devem retornar zero linhas.
-- Valores ausentes e totais devem ser avaliados conforme a fonte.
-- A validação definitiva depende da execução das consultas
-- e da comparação dos resultados com a planilha original.
