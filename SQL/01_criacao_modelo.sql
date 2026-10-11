-- Modelo dimensional: análise da atuação dos professores
-- Banco de dados: MySQL 8+
-- Observação: estrutura proposta; dados e datas ainda precisam ser preparados.

CREATE DATABASE IF NOT EXISTS universidade_dw;
USE universidade_dw;

CREATE TABLE IF NOT EXISTS DIM_PROFESSOR (
    ProfessorKey INT AUTO_INCREMENT PRIMARY KEY,
    idProfessor INT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS DIM_DISCIPLINA (
    DisciplinaKey INT AUTO_INCREMENT PRIMARY KEY,
    idDisciplina INT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS DIM_CURSO (
    CursoKey INT AUTO_INCREMENT PRIMARY KEY,
    idCurso INT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS DIM_DEPARTAMENTO (
    DepartamentoKey INT AUTO_INCREMENT PRIMARY KEY,
    idDepartamento INT NOT NULL UNIQUE,
    Nome VARCHAR(45),
    Campus VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS DIM_DATA (
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

CREATE TABLE IF NOT EXISTS FATO_ATUACAO_PROFESSOR (
    AtuacaoKey BIGINT AUTO_INCREMENT PRIMARY KEY,
    ProfessorKey INT NOT NULL,
    DisciplinaKey INT NOT NULL,
    CursoKey INT NOT NULL,
    DepartamentoProfessorKey INT NOT NULL,
    DepartamentoCursoKey INT NOT NULL,
    DataKey INT NOT NULL,
    QuantidadeOfertas INT NOT NULL DEFAULT 1,

    FOREIGN KEY (ProfessorKey)
        REFERENCES DIM_PROFESSOR(ProfessorKey),

    FOREIGN KEY (DisciplinaKey)
        REFERENCES DIM_DISCIPLINA(DisciplinaKey),

    FOREIGN KEY (CursoKey)
        REFERENCES DIM_CURSO(CursoKey),

    FOREIGN KEY (DepartamentoProfessorKey)
        REFERENCES DIM_DEPARTAMENTO(DepartamentoKey),

    FOREIGN KEY (DepartamentoCursoKey)
        REFERENCES DIM_DEPARTAMENTO(DepartamentoKey),

    FOREIGN KEY (DataKey)
        REFERENCES DIM_DATA(DataKey)
);

-- Granularidade pretendida:
-- uma linha por professor, disciplina, curso e data de oferta.
--
-- Atenção:
-- o diagrama original não contém datas de oferta.
-- Os registros da tabela fato só poderão ser inseridos depois
-- de obter ou simular essas datas e preparar os dados de origem.
--
-- DepartamentoProfessorKey representa o departamento do professor.
-- DepartamentoCursoKey representa o departamento responsável pelo curso.
-- São papéis distintos da mesma dimensão.
