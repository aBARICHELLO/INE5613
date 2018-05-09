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
    cod_c           SERIAL              PRIMARY KEY,
    cod_m           INT                 REFERENCES medicos(cod_m),
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

INSERT INTO funcionarios (cod_f, nome, idade, cidade, salario, cpf)
     VALUES (1, 'Rita', 32, 'São José', 1200, 20000100000);
INSERT INTO funcionarios (cod_f, nome, idade, cidade, salario, cpf)
     VALUES (2, 'Maria', 55, 'Palhoça', 1220, 30000110000);
INSERT INTO funcionarios (cod_f, nome, idade, cidade, salario, cpf)
     VALUES (3, 'Carlo', 45, 'Florianópolis', 1100, 41000100000);
INSERT INTO funcionarios (cod_f, nome, idade, cidade, salario, cpf)
     VALUES (4, 'Carlos', 44, 'Florianópolis', 1200, 51000110000);
INSERT INTO funcionarios (cod_f, nome, idade, cidade, salario, cpf)
     VALUES (5, 'Paula', 33, 'Florianópolis', 2500, 61000111000);

INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (1, 1, 1, '2016/10/12', '14:00');
INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (2, 1, 4, '2016/10/13', '10:00');
INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (3, 2, 1, '2016/10/13', '9:00');
INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (4, 2, 2, '2016/10/13', '11:00');
INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (5, 2, 3, '2016/10/14', '14:00');
INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (6, 2, 4, '2016/10/14', '17:00');
INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (7, 3, 1, '2016/10/19', '18:00');
INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (8, 3, 3, '2016/10/12', '10:00');
INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (9, 3, 4, '2016/10/19', '13:00');
INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (10, 4, 4, '2016/10/20', '13:00');
INSERT INTO consultas (cod_c, cod_m, cod_p, data, hora)
     VALUES (11, 4, 4, '2016/10/22', '19:30');

UPDATE pacientes
   SET cidade = 'Ilhota'
 WHERE nome = 'Paulo';

UPDATE consultas
   SET data = '2016/11/04', hora = '12:00'
 WHERE cod_m = 1 AND cod_p = 4;

UPDATE pacientes
   SET doenca = 'câncer'
 WHERE nome = 'Ana';

UPDATE consultas
   SET hora = hora + '01:30'
 WHERE cod_m = 3 AND cod_p = 4;

DELETE FROM funcionarios
      WHERE cod_f = 4;

DELETE FROM consultas
      WHERE hora = '19:00';

-- DELETE FROM pacientes
--       WHERE idade < 10 OR doenca = 'câncer';

DELETE FROM medicos
      WHERE cidade = 'Biguaçu' OR cidade = 'Palhoça';

SELECT *  -- 1
  FROM ambulatorios
 WHERE capacidade > 30;

SELECT *  -- 2
  FROM medicos
 WHERE idade < 40 OR especialidade = 'traumatologia';

SELECT cod_m, cod_p  -- 3
  FROM consultas
 WHERE hora >= '13:00' AND data > '2016/10/12';

SELECT nome, idade  -- 4
  FROM pacientes
 WHERE cidade != 'Florianópolis';

SELECT nome, idade * 12 AS idade  -- 5
  FROM pacientes;

SELECT MIN(salario) AS menor_salario, MAX(salario) AS maior_salario  -- 6
  FROM funcionarios
 WHERE cidade = 'Florianópolis';
