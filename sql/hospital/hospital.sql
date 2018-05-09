--PostgreSQL 9.6
--'\\' is a delimiter

CREATE TABLE ambulatorios (
    nroa            INT                 PRIMARY KEY,
    andar           NUMERIC(3)          NOT NULL CONSTRAINT andar_positivo CHECK (andar > 0),
    capacidade      SMALLINT            NOT NULL CONSTRAINT idade_positiva CHECK (capacidade > 0)
);

CREATE TABLE medicos (
    cod_m           INT                 PRIMARY KEY,
    nome            VARCHAR(40)         NOT NULL,
    idade           SMALLINT,
    especialidade   CHAR(20)            NOT NULL,
    cpf             NUMERIC(11)         NOT NULL,
    cidade          VARCHAR(30)         NOT NULL,
    nroa            INT                 REFERENCES ambulatorios(nroa)
);

CREATE TABLE pacientes (
    cod_p           INT                 PRIMARY KEY,
    nome            VARCHAR(40)         NOT NULL,
    idade           SMALLINT            NOT NULL,
    cidade          CHAR(30)            NOT NULL,
    cpf             NUMERIC(11)         UNIQUE,
    doenca          VARCHAR(40)
);

CREATE TABLE funcionarios (
    cod_f           INT                 PRIMARY KEY,
    nome            VARCHAR(40)         NOT NULL,
    idade           SMALLINT            NOT NULL UNIQUE CONSTRAINT idade_positiva CHECK (idade > 0),
    cpf             NUMERIC(11)         NOT NULL,
    cidade          VARCHAR(30)         NOT NULL,
    salario         NUMERIC(10)         NOT NULL UNIQUE CONSTRAINT salario_positivo CHECK (salario > 0)
);

CREATE TABLE consultas (
    cod_m           INT                 PRIMARY KEY,
    cod_p           INT                 REFERENCES pacientes(cod_p),
    data            DATE,
    hora            TIME
);

INSERT INTO ambulatorios (nroa, andar, capacidade) VALUES (1, 1, 30);
INSERT INTO ambulatorios (nroa, andar, capacidade) VALUES (2, 1, 50);
INSERT INTO ambulatorios (nroa, andar, capacidade) VALUES (3, 2, 40);
INSERT INTO ambulatorios (nroa, andar, capacidade) VALUES (4, 2, 25);
INSERT INTO ambulatorios (nroa, andar, capacidade) VALUES (5, 2, 55);

INSERT INTO medicos (cod_m, nome, idade, especialidade, cpf, cidade, nroa)
     VALUES (1, 'João', 40, 'ortopedia', 10000100000, 'Florianópolis', 1);
INSERT INTO medicos (cod_m, nome, idade, especialidade, cpf, cidade, nroa)
     VALUES (2, 'Maria', 42, 'traumatologia', 10000110000, 'Blumenau', 2);
INSERT INTO medicos (cod_m, nome, idade, especialidade, cpf, cidade, nroa)
     VALUES (3, 'Pedro', 51, 'pediatria', 11000100000, 'São José', 2);
INSERT INTO medicos (cod_m, nome, idade, especialidade, cpf, cidade)
     VALUES (4, 'Carlos', 28, 'ortopedia', 11000110000, 'Joinville');
INSERT INTO medicos (cod_m, nome, idade, especialidade, cpf, cidade, nroa)
     VALUES (5, 'Márcia', 33, 'neurologia', 10000111000, 'Biguaçu', 3);

INSERT INTO pacientes (cod_p, nome, idade, cidade, cpf, doenca)
     VALUES (1, 'Ana', 20, 'Florianópolis', 20000200000, 'gripe');
INSERT INTO pacientes (cod_p, nome, idade, cidade, cpf, doenca)
     VALUES (2, 'Paulo', 24, 'Palhoça', 20000220000, 'gripe');
INSERT INTO pacientes (cod_p, nome, idade, cidade, cpf, doenca)
     VALUES (3, 'Lucia', 30, 'Biguaçu', 22000220000, 'gripe');
INSERT INTO pacientes (cod_p, nome, idade, cidade, cpf, doenca)
     VALUES (4, 'Carlos', 38, 'Joinville', 11000110000, 'gripe');

INSERT INTO consultas (cod_m, cod_p, data, hora)
     VALUES (1, 1, '2016/10/12', '14:00');
