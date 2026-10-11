-- Modelo dimensional: análise de vendas
-- Banco de dados: MySQL 8+
-- Status: estrutura proposta, ainda não validada por execução.

CREATE DATABASE IF NOT EXISTS vendas_dw;
USE vendas_dw;

CREATE TABLE IF NOT EXISTS D_PRODUTOS (
    ProdutoKey INT AUTO_INCREMENT PRIMARY KEY,
    CodigoProduto VARCHAR(50) NOT NULL UNIQUE,
    NomeProduto VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS D_PRODUTOS_DETALHES (
    ProdutoDetalheKey INT AUTO_INCREMENT PRIMARY KEY,
    CodigoProduto VARCHAR(50) NOT NULL UNIQUE,
    Segmento VARCHAR(100),
    Categoria VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS D_DESCONTOS (
    DescontoKey INT AUTO_INCREMENT PRIMARY KEY,
    FaixaDesconto VARCHAR(50) NOT NULL UNIQUE,
    PercentualDesconto DECIMAL(5,2)
);

CREATE TABLE IF NOT EXISTS D_DETALHES (
    DetalheKey INT AUTO_INCREMENT PRIMARY KEY,
    Pais VARCHAR(100),
    Regiao VARCHAR(100),
    Estado VARCHAR(100),
    Cidade VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS D_CALENDARIO (
    DataKey INT PRIMARY KEY,
    DataCompleta DATE NOT NULL UNIQUE,
    Dia INT NOT NULL,
    NomeDiaSemana VARCHAR(15) NOT NULL,
    Mes INT NOT NULL,
    NomeMes VARCHAR(15) NOT NULL,
    Trimestre INT NOT NULL,
    Semestre INT NOT NULL,
    Ano INT NOT NULL,
    AnoMes CHAR(7) NOT NULL
);

CREATE TABLE IF NOT EXISTS F_VENDAS (
    VendaKey BIGINT AUTO_INCREMENT PRIMARY KEY,
    ProdutoKey INT NOT NULL,
    ProdutoDetalheKey INT NOT NULL,
    DescontoKey INT NOT NULL,
    DetalheKey INT NOT NULL,
    DataKey INT NOT NULL,
    Quantidade INT NOT NULL DEFAULT 0,
    ValorVenda DECIMAL(12,2),
    ValorDesconto DECIMAL(12,2),

    FOREIGN KEY (ProdutoKey)
        REFERENCES D_PRODUTOS(ProdutoKey),

    FOREIGN KEY (ProdutoDetalheKey)
        REFERENCES D_PRODUTOS_DETALHES(ProdutoDetalheKey),

    FOREIGN KEY (DescontoKey)
        REFERENCES D_DESCONTOS(DescontoKey),

    FOREIGN KEY (DetalheKey)
        REFERENCES D_DETALHES(DetalheKey),

    FOREIGN KEY (DataKey)
        REFERENCES D_CALENDARIO(DataKey)
);

-- Granularidade proposta:
-- uma linha por registro de venda ou item vendido.
--
-- IMPORTANTE:
-- nomes de campos e relacionamentos são provisórios.
-- Devem ser conferidos com a fonte de dados antes da carga.
-- Este script ainda não foi executado nem validado no MySQL.
