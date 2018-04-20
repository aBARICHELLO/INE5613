--PostgreSQL 9.6
--'\\' is a delimiter

-- select version() as postgresql_version

CREATE TABLE ambulatorios (
    nroa            INT            PRIMARY KEY,
    andar           NUMERIC(3),
    capacidade      SMALLINT
)

CREATE TABLE medicos (
    cod_m           INT            PRIMARY KEY,
    nome            VARCHAR(40),
    idade           SMALLINT,
    especialidade   CHAR(20),
    cpf             NUMERIC(11),
    cidade          VARCHAR(30)
)

CREATE TABLE pacientes (
    cod_p           INT            PRIMARY KEY,
    nome            VARCHAR(40),
    idade           SMALLINT,
    cidade          CHAR(30),
    cpf             NUMERIC(11),
    doenca          VARCHAR(40)
)

CREATE TABLE funcionarios (
    cod_f           INT            PRIMARY KEY,
    nome            VARCHAR(40),
    idade           SMALLINT,
    cpf             NUMERIC(11),
    cidade          VARCHAR(30),
    salario         NUMERIC(10),
    cargo           VARCHAR(20),
    nroa            INT
)

CREATE TABLE consultas (
    cod_m           INT            PRIMARY KEY,
    cod_p           INT            PRIMARY KEY,
    data_dia        DATE           PRIMARY KEY,
    hora            TIME
)

ALTER TABLE funcionarios
       DROP cargo, nroa;

ALTER TABLE medicos
        ADD nroa INT;
