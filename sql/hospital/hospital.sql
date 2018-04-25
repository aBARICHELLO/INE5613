--PostgreSQL 9.6
--'\\' is a delimiter

CREATE TABLE ambulatorios (
	nroa            INT				PRIMARY KEY,
	andar           NUMERIC(3)		NOT NULL UNIQUE CONSTRAINT andar_positivo CHECK (andar > 1),
	capacidade      SMALLINT		NOT NULL UNIQUE CONSTRAINT idade_positiva CHECK (capacidade > 1)
)

CREATE TABLE medicos (
	cod_m           INT				PRIMARY KEY,
	nome            VARCHAR(40)		NOT NULL,
	idade           SMALLINT,
	especialidade   CHAR(20)		NOT NULL,
	cpf             NUMERIC(11)		NOT NULL,
	cidade          VARCHAR(30)		NOT NULL
)

CREATE TABLE pacientes (
	cod_p           INT				PRIMARY KEY,
	nome            VARCHAR(40)		NOT NULL,
	idade           SMALLINT		NOT NULL,
	cidade          CHAR(30)		NOT NULL,
	cpf             NUMERIC(11)		UNIQUE,
	doenca          VARCHAR(40)
)

CREATE TABLE funcionarios (
	cod_f           INT				PRIMARY KEY,
	nome            VARCHAR(40)		NOT NULL,
	idade           SMALLINT		NOT NULL UNIQUE CONSTRAINT idade_positiva CHECK (idade > 0),
	cpf             NUMERIC(11)		NOT NULL,
	cidade          VARCHAR(30)		NOT NULL,
	salario         NUMERIC(10)		NOT NULL UNIQUE CONSTRAINT salario_positivo CHECK (salario > 0),
	cargo           VARCHAR(20)		NOT NULL,
	nroa            INT				NOT NULL REFERENCES ambulatorios(nroa)
)

CREATE TABLE consultas (
	id				INT				PRIMARY KEY,
	cod_m           INT				REFERENCES medicos(cod_m),
	cod_p           INT				REFERENCES pacientes(cod_p),
	data_dia        DATE,
	hora            TIME
)

ALTER TABLE funcionarios
	   DROP cargo, nroa;

ALTER TABLE medicos
		ADD nroa INT;
