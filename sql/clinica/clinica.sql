--SET SEARCH_PATH TO DEMO_CLINICA;
--COMPLETAR A CRIACAO DA TABELA AMBULATORIO

CREATE TABLE AMBULATORIO (
    NUM_A                   INT,
    ANDAR                   NUMERIC(3),
    CAPACIDADE              SMALLINT,
    PRIMARY KEY (NUM_A)
);

CREATE TABLE MEDICO (
    COD_M                   INT,
    NOME                    VARCHAR(40)     NOT NULL,
    IDADE                   SMALLINT        NOT NULL,
    ESPECIALIDADE           CHAR(20),
    CIDADE 	                VARCHAR(30),
    NUM_A 	                INT,
    PRIMARY KEY (COD_M),
    FOREIGN KEY (NUM_A) REFERENCES AMBULATORIO(NUM_A));

CREATE TABLE PACIENTE (
    COD_P                   INT             PRIMARY KEY,
    NOME                    VARCHAR(40)     NOT NULL,
    IDADE                   SMALLINT        NOT NULL,
    CIDADE                  VARCHAR(30));

CREATE TABLE CONSULTA(
    COD_M                   INT,
    COD_P                   INT,
    DATA                    DATE,
    HORA                    TIME,
    PRIMARY KEY (COD_M, DATA, HORA),
    FOREIGN KEY (COD_M) REFERENCES MEDICO(COD_M),
    FOREIGN KEY (COD_P) REFERENCES PACIENTE(COD_P));

-- Exercises:

INSERT INTO AMBULATORIO VALUES (1, 1, 30);
INSERT INTO AMBULATORIO VALUES (2, 1, 50);
INSERT INTO AMBULATORIO VALUES (3, 2, 40);
INSERT INTO AMBULATORIO VALUES (4, 2, 25);
INSERT INTO AMBULATORIO VALUES (5, 2, 55);
INSERT INTO AMBULATORIO VALUES (6, 2, 10);
INSERT INTO AMBULATORIO VALUES (7, 2, 10);

INSERT INTO MEDICO VALUES ( 1, 'Joao',     40, 'ortopedista',    'Florianopolis',    1);
INSERT INTO MEDICO VALUES ( 2, 'Maria',    42, 'oftalmologista', 'Blumenau',         2);
INSERT INTO MEDICO VALUES ( 3, 'Pedro',    51, 'pediatra',       'Sao Jose',         2);
INSERT INTO MEDICO VALUES ( 4, 'Carlos',   28, 'ortopedista',    'Florianopolis',    4);
INSERT INTO MEDICO VALUES ( 5, 'Marcia',   33, 'neurologista',   'Florianopolis',    3);
INSERT INTO MEDICO VALUES ( 6, 'Pedrinho', 38, 'infectologista', 'Blumenau',         1);
INSERT INTO MEDICO VALUES ( 7, 'Mariana',  39, 'infectologista', 'Florianopolis', NULL);
INSERT INTO MEDICO VALUES ( 8, 'Roberta',  50, 'neurologista',   'Joinville',        5);
INSERT INTO MEDICO VALUES ( 9, 'Vanusa',   39, 'aa',             'Curitiba',      NULL);
INSERT INTO MEDICO VALUES (10, 'Valdo',    50, 'aa',             'Curitiba',      NULL);

INSERT INTO PACIENTE VALUES (1, 'Clevi',    60, 'Florianopolis');
INSERT INTO PACIENTE VALUES (2, 'Cleusa',   25, 'Palhoca');
INSERT INTO PACIENTE VALUES (3, 'Alberto',  45, 'Palhoca');
INSERT INTO PACIENTE VALUES (4, 'Roberta',  44, 'Sao Jose');
INSERT INTO PACIENTE VALUES (5, 'Fernanda',  3, 'Sao Jose');
INSERT INTO PACIENTE VALUES (6, 'Luanda',    2, 'Florianopolis');
INSERT INTO PACIENTE VALUES (7, 'Manuela',  69, 'Florianopolis');
INSERT INTO PACIENTE VALUES (8, 'Bruno',    45, 'Florianopolis');
INSERT INTO PACIENTE VALUES (9, 'Andre',    83, 'Florianopolis');
INSERT INTO PACIENTE VALUES (10,'Andre',    21, 'Florianopolis');

INSERT INTO CONSULTA VALUES (1,3, '2000/06/12', '14:00');
INSERT INTO CONSULTA VALUES (4,3, '2000/06/13', '9:00');
INSERT INTO CONSULTA VALUES (2,9, '2000/06/14', '14:00');
INSERT INTO CONSULTA VALUES (7,5, '2000/06/12', '10:00');
INSERT INTO CONSULTA VALUES (8,6, '2000/06/19', '13:00');
INSERT INTO CONSULTA VALUES (5,1, '2000/06/20', '13:00');
INSERT INTO CONSULTA VALUES (6,8, '2000/06/20', '20:30');
INSERT INTO CONSULTA VALUES (6,2, '2000/06/15', '11:00');
INSERT INTO CONSULTA VALUES (6,4, '2000/06/15', '14:00');
INSERT INTO CONSULTA VALUES (7,2, '2000/06/10', '19:30');

UPDATE MEDICO
   SET CIDADE = 'Biguaçu'
 WHERE CIDADE = 'Blumenal';

UPDATE MEDICO
   SET CIDADE = 'Blumenal'
 WHERE CIDADE = 'Biguaçu';

UPDATE AMBULATORIO
   SET CAPACIDADE = '35'
 WHERE NUM_A = 1;

DELETE
  FROM MEDICO
 WHERE CIDADE = 'Curitiba';

DELETE
  FROM AMBULATORIO
 WHERE CAPACIDADE = 10;

SELECT NOME
  FROM MEDICO
 WHERE CIDADE = 'Florianopolis';

SELECT COD_M
  FROM MEDICO
 WHERE NOME = 'Marcia';

SELECT DISTINCT ESPECIALIDADE
  FROM MEDICO;

-- FIXME Data de consulta paciente Carlos
SELECT *
  FROM PACIENTE
 INNER JOIN CONSULTA
    ON CONSULTA.COD_P = PACIENTE.COD_P
 WHERE NOME = 'Carlos'

-- Nome dos pacientes do médico Pedrinho
SELECT DISTINCT NOME
  FROM PACIENTE
 INNER JOIN CONSULTA
    ON CONSULTA.COD_P = PACIENTE.COD_P

-- Nome dos médicos que tem consulta marcada e as datas de suas consultas
SELECT NOME, DATA
  FROM MEDICO
 INNER JOIN CONSULTA
    ON CONSULTA.COD_M = MEDICO.COD_M

-- Obter os nomes dos médicos infectologistas e andar em que atendem
SELECT NOME
  FROM MEDICO
 WHERE ESPECIALIDADE = 'infectologista'

-- Obter o nome dos pacientes que tem consulta marcada no ambulatorio 2

-- Obter o nome de cada médico e respecdvos nomes dos pacientes que tem
-- consulta com ele (caso o médico não tenha nenhuma consulta, o nome do
-- paciente deve ser prenchido com null).
