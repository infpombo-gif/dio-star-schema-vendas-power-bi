-- Modelo dimensional: análise de vendas
-- Fonte prevista: Microsoft Financial Sample
-- Banco de dados: MySQL 8+
-- Status: script proposto, ainda não executado.

CREATE DATABASE IF NOT EXISTS vendas_dw;
USE vendas_dw;

CREATE TABLE IF NOT EXISTS D_PRODUTOS (
    ProdutoKey INT AUTO_INCREMENT PRIMARY KEY,
    Produto VARCHAR(100) NOT NULL UNIQUE,
    ManufacturingPrice DECIMAL(12,2)
);

CREATE TABLE IF NOT EXISTS D_DETALHES (
    DetalheKey INT AUTO_INCREMENT PRIMARY KEY,
    Segment VARCHAR(50) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    UNIQUE (Segment, Country)
);

CREATE TABLE IF NOT EXISTS D_DESCONTOS (
    DescontoKey INT AUTO_INCREMENT PRIMARY KEY,
    DiscountBand VARCHAR(30) NOT NULL UNIQUE
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
    DetalheKey INT NOT NULL,
    DescontoKey INT NOT NULL,
    DataKey INT NOT NULL,
    UnitsSold DECIMAL(12,2) NOT NULL,
    SalePrice DECIMAL(12,2),
    GrossSales DECIMAL(14,2),
    Discounts DECIMAL(14,2),
    Sales DECIMAL(14,2),
    COGS DECIMAL(14,2),
    Profit DECIMAL(14,2),

    FOREIGN KEY (ProdutoKey)
        REFERENCES D_PRODUTOS(ProdutoKey),

    FOREIGN KEY (DetalheKey)
        REFERENCES D_DETALHES(DetalheKey),

    FOREIGN KEY (DescontoKey)
        REFERENCES D_DESCONTOS(DescontoKey),

    FOREIGN KEY (DataKey)
        REFERENCES D_CALENDARIO(DataKey)
);

-- Granularidade proposta:
-- um registro por linha da fonte Financial Sample.
--
-- A carga dos dados e a validação das chaves estrangeiras
-- deverão ser implementadas após importar e conferir a fonte.
--
-- Month Number, Month Name e Year são atributos de calendário
-- que podem ser derivados da coluna Date.
-- Não são dimensões independentes.
