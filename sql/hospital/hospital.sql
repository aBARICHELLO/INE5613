--PostgreSQL 9.6
--'\\' is a delimiter

CREATE TABLE ambulatorios (
    nroa            INT,
    andar           NUMERIC(3),
    capacidade      SMALLINT,
    PRIMARY KEY (nroa)
);

CREATE TABLE medicos (
    cod_m           INT,
    nome            VARCHAR(40),
    idade           SMALLINT,
    especialidade   CHAR(20),
    cpf             NUMERIC(11),
    cidade          VARCHAR(30),
    PRIMARY KEY (cod_m)
);

CREATE TABLE pacientes (
    cod_p           INT,
    nome            VARCHAR(40),
    idade           SMALLINT,
    cidade          CHAR(30),
    cpf             NUMERIC(11),
    doenca          VARCHAR(40),
    PRIMARY KEY (cod_p)
);

CREATE TABLE funcionarios (
    cod_f           INT,
    nome            VARCHAR(40),
    idade           SMALLINT,
    cpf             NUMERIC(11),
    cidade          VARCHAR(30),
    salario         NUMERIC(10),
    cargo           VARCHAR(20),
    nroa            INT,
    PRIMARY KEY (cod_f)
);

CREATE TABLE consultas (
    cod_m           INT,
    cod_p           INT,
    data_dia        DATE,
    hora            TIME,
    PRIMARY KEY (cod_m, data_dia, hora)
);

ALTER TABLE funcionarios
DROP COLUMN cargo;

ALTER TABLE funcionarios
DROP COLUMN nroa;

ALTER TABLE medicos
        ADD nroa INT;
