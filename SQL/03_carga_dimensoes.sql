-- Carga das dimensões do modelo de vendas
-- Banco de dados: MySQL 8+
-- Status: modelo de referência, ainda não validado por execução.
--
-- IMPORTANTE:
-- A carga definitiva depende da identificação e preparação
-- da fonte de dados de vendas.
-- Não são realizadas cargas fictícias neste script.

USE vendas_dw;

-- As tabelas dimensionais são criadas em:
-- sql/01_criacao_modelo.sql
--
-- A dimensão calendário é preparada em:
-- sql/02_popular_dimensao_data.sql
--
-- Próximas etapas:
-- 1. Identificar a fonte de dados de vendas.
-- 2. Conferir os nomes e tipos das colunas disponíveis.
-- 3. Definir o mapeamento dos campos para cada dimensão.
-- 4. Implementar a carga das dimensões com base nos dados reais.
-- 5. Validar chaves, duplicidades e registros sem correspondência.

-- Verificação estrutural: quantidade de registros em cada dimensão.
-- Os resultados serão zero caso as tabelas ainda estejam vazias.

SELECT 'D_PRODUTOS' AS dimensao, COUNT(*) AS total
FROM D_PRODUTOS
UNION ALL
SELECT 'D_PRODUTOS_DETALHES', COUNT(*)
FROM D_PRODUTOS_DETALHES
UNION ALL
SELECT 'D_DESCONTOS', COUNT(*)
FROM D_DESCONTOS
UNION ALL
SELECT 'D_DETALHES', COUNT(*)
FROM D_DETALHES
UNION ALL
SELECT 'D_CALENDARIO', COUNT(*)
FROM D_CALENDARIO;
