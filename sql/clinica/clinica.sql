--SET SEARCH_PATH TO DEMO_CLINICA;
--COMPLETAR A CRIACAO DA TABELA AMBULATORIO

CREATE TABLE MEDICO (
    COD_M           INT 			PRIMARY KEY,
    NOME            VARCHAR(40)     NOT NULL,
    IDADE           SMALLINT 		NOT NULL,
    ESPECIALIDADE   CHAR(20),
    CIDADE 	        VARCHAR(30),
    NUM_A 	        INT,			FOREIGN KEY REFERENCES NUM_A)

CREATE TABLE PACIENTE(
    COD_P           INT             PRIMARY KEY,
    NOME            VARCHAR(40)     NOT NULL,
    IDADE           SMALLINT        NOT NULL,
    CIDADE          VARCHAR(30))

CREATE TABLE CONSULTA(
    COD_M           INT	            PRIMARY KEY REFERENCES MEDICO(COD_M),
    COD_P           INT	            REFERENCES PACIENTE(COD_P),
    DATA            DATE            PRIMARY KEY,
    HORA            TIME            PRIMARY KEY)

INSERT INTO AMBULATORIO VALUES (1, 1, 30);
--COMPLETAR A INICIALIZACAO DA TABELA AMBULATORIO

INSERT INTO MEDICO VALUES ( 1, 'Joao',     40, 'ortopedista',    'Florianopolis',    1);
INSERT INTO MEDICO VALUES ( 2, 'Maria',    42, 'oftalmologista', 'Blumenau',         2);
INSERT INTO MEDICO VALUES ( 3, 'Pedro',    51, 'pediatra',       'Sao Jose',         2);
INSERT INTO MEDICO VALUES ( 4, 'Carlos',   28, 'ortopedista',    'Florianopolis',    4);
INSERT INTO MEDICO VALUES ( 5, 'Marcia',   33, 'neurologista',   'Florianopolis',    3);
INSERT INTO MEDICO VALUES ( 6, 'Pedrinho', 38, 'infectologista', 'Blumenau',         1);
INSERT INTO MEDICO VALUES ( 7, 'Mariana',  39, 'infectologista', 'Florianopolis', NULL);
INSERT INTO MEDICO VALUES ( 8, 'Roberta',  50, 'neurologista',   'Joinville',       5);
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
