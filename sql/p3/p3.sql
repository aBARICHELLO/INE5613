CREATE TABLE IF NOT EXISTS tipos_veiculos (
    codigo          INT         PRIMARY KEY,
    descricao       TEXT
);

CREATE TABLE IF NOT EXISTS habilitacoes (
    codigo          INT         PRIMARY KEY,
    tipo            TEXT,
    idade_minima    INT,
    descricao       TEXT
);

CREATE TABLE IF NOT EXISTS veiculos (
    matricula       INT         PRIMARY KEY,
    nome            TEXT,
    modelo          TEXT,
    comprimento     FLOAT,
    potencia_motor  INT,
    diaria          INT,
    tipo            TEXT
);

CREATE TABLE IF NOT EXISTS funcionarios (
    codigo          INT         PRIMARY KEY,
    nome            TEXT,
    endereco        TEXT,
    idade           INT,
    salario         INT
);

CREATE TABLE IF NOT EXISTS veiculos_habilitacoes (
    codigo_tipo         INT     REFERENCES tipos_veiculos (codigo),
    codigo_habilitacao  INT     REFERENCES habilitacoes (codigo),
    PRIMARY KEY (codigo_tipo, codigo_habilitacao)
);

CREATE TABLE IF NOT EXISTS clientes (
    cpf                 TEXT        PRIMARY KEY,
    nome                TEXT,
    endereco            TEXT,
    estado_civil        TEXT,
    numero_filhos       INT,
    data_nascimento     DATE,
    telefone            TEXT,
    codigo_habilitacao  INT         REFERENCES habilitacoes (codigo)
);

CREATE TABLE IF NOT EXISTS locacoes (
    codigo              INT         PRIMARY KEY,
    valor               FLOAT,
    inicio              TIMESTAMP,
    fim                 TIMESTAMP,
    observacao          TEXT,
    matricula           INT         REFERENCES veiculos (matricula),
    codigo_funcionario  INT         REFERENCES funcionarios (codigo),
    cpf                 TEXT        REFERENCES clientes (cpf)
);

-- Dados para teste
-- INSERT INTO habilitacoes (codigo, tipo) VALUES (0, 'moto');
-- INSERT INTO habilitacoes (codigo, tipo) VALUES (1, 'carro');
-- INSERT INTO clientes (cpf, nome, codigo_habilitacao) VALUES (0, 'barichello', '0');
-- INSERT INTO veiculos (matricula, nome, modelo, tipo) VALUES (0, 'carro', 'modelo x', 'tipo');
-- INSERT INTO funcionarios (codigo, nome, salario) VALUES (1, 'fulano', 1000);
-- INSERT INTO locacoes (codigo, valor, inicio, fim, matricula, codigo_funcionario, cpf)
-- VALUES (0, 1000, '01/01/2018', '03/03/2018', 0, 1, 0);

-- 1
-- a)
SELECT DISTINCT clientes.nome, funcionarios.nome AS nome_funcionario FROM locacoes
 INNER JOIN clientes ON clientes.cpf = locacoes.cpf
 INNER JOIN funcionarios ON funcionarios.codigo = locacoes.codigo_funcionario;

-- b)
SELECT nome, total_funcionarios.inicio FROM (
    SELECT DISTINCT nome, locacoes.inicio
      FROM funcionarios
     INNER JOIN locacoes ON locacoes.codigo_funcionario = funcionarios.codigo
     ORDER BY inicio DESC
) AS total_funcionarios
 LIMIT 1;

-- c)
SELECT tipo, COUNT(cpf) OVER() AS "numero_clientes"
  FROM habilitacoes
 INNER JOIN clientes ON clientes.codigo_habilitacao = habilitacoes.codigo;

-- d)
SELECT DISTINCT nome, funcionarios.codigo, salario + 0.05 * salario AS acrescimo
  FROM funcionarios
 INNER JOIN locacoes ON locacoes.codigo_funcionario = funcionarios.codigo
 WHERE locacoes.inicio > '05/01/2017 00:00:00';

-- 2
-- a)
ALTER TABLE veiculos_habilitacoes
 DROP CONSTRAINT IF EXISTS veiculos_habilitacoes_pkey;
ALTER TABLE veiculos_habilitacoes
  ADD COLUMN IF NOT EXISTS codigo SERIAL PRIMARY KEY;

-- b) -- estatistica
CREATE OR REPLACE VIEW estatistica_locacoes AS
SELECT clientes.nome, clientes.cpf, AVG(locacoes.fim - locacoes.inicio) OVER() AS media_locacoes,
       AVG(locacoes.valor) OVER() AS media_valor
  FROM clientes
 INNER JOIN locacoes ON locacoes.cpf = clientes.cpf;

-- c)
-- ALTER TABLE locacoes
--   ADD CONSTRAINT locacao_valida
-- CHECK (inicio < fim);
