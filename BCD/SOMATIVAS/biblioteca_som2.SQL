-- Active: 1788268023903@@127.0.0.1@3306@biblioteca_som2_monyke
CREATE DATABASE BIBLIOTECA_som2_MONYKE;
USE BIBLIOTECA_som2_MONYKE;

SHOW TABLES;

CREATE TABLE USUARIOS (
Id_Usuarios INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(100) not null,
Email VARCHAR(120) not null unique,
Telefone VARCHAR(20) not null,
Ativo BOOLEAN default true
);
CREATE TABLE LIVROS (
Id_Livros INT AUTO_INCREMENT PRIMARY KEY,
Titulo VARCHAR(150) NOT NULL,
Autor VARCHAR(120) NOT NULL,
ISBN CHAR(13) NOT NULL UNIQUE,
Ano_Publicacao INT NOT NULL,
Quantidade_Disponivel INT DEFAULT 0, CHECK(Quantidade_Disponivel >=0)
);
CREATE TABLE EMPRESTIMOS (
Id_Emprestimos INT AUTO_INCREMENT PRIMARY KEY,
Data_Emprestimos DATETIME DEFAULT CURRENT_TIMESTAMP,
Data_Prevista DATE NOT NULL,
Data_Devolucao DATE,
Status_Emprestimos VARCHAR(20) DEFAULT 'ABERTO',
CHECK (Status_Emprestimos IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
Id_Usuarios int,FOREIGN KEY (Id_Usuarios) REFERENCES USUARIOS(Id_Usuarios),
Id_Livros int, FOREIGN KEY (Id_Livros) REFERENCES LIVROS(Id_LIvros)
);

INSERT INTO USUARIOS (nome, email, telefone, ativo) VALUES
('Kauan R', 'KauanR@email.com', '1999999449', TRUE),
('Laura C', 'lauraC@email.com', '1999999999', TRUE),
('Laura N', 'lauraN@email.com', '1999995999', TRUE),
('Laura R', 'lauraR@email.com', '1999999921', TRUE),
('Leonardo B', 'LeoB@email.com', '1999489921', TRUE),
('Leonardo BT', 'LeoBT@email.com', '1995599921', NULL),
('Lidia', 'LidiaE@email.com', '1996699921', TRUE),
('Livia', 'LiviaV@email.com', '1996699234', TRUE),
('Marco', 'Marco@email.com', '1985599921', TRUE),
('Nicolas F', 'nicolasF@email.com', '1985229922', TRUE),
('Pablo H', 'Pablo@email.com', '1985599912', NULL),
('Sophie A', 'Sophie@email.com', '19785599912', TRUE),
('Vinicius H', 'Vini@email.com', '1978559955', TRUE),
('Vitoria S', 'VitoriaS@email.com', '19785594034', TRUE),
('Virginia S', 'ViRGINIAs@email.com', '197855955434', NULL);

INSERT INTO LIVROS (Titulo, Autor, ISBN, Ano_Publicacao, Quantidade_Disponivel) VALUES
('É Assim que Acaba', 'Collen Hoover', '88501107381', '2016', 5),
('A Garota no Trem', 'Paula Hawkins', ' 97801103826', '2015', 6),
('Verity', 'Collen Hoover', '97885011178', '2018', 4),
('A Paciente Silenciosa', 'Alex Michaelides', '97885016413', '2019', 9),
('A Psicologia Financeira', 'Morgan Housel', '97555110586', '2020', 2),
('Tudo É Rio', 'Carla Madeira', '97865860608', '2014', 7),
('A Empregada', 'Freida McFadden', ' 97865556581', '2022', 10);

INSERT INTO EMPRESTIMOS (Data_Emprestimos, Data_Prevista, Data_Devolucao, Status_Emprestimos, Id_Usuarios, Id_Livros) VALUES
(NOW(), '2026-11-30', '2026-12-15', 'ABERTO', 1, 1),
(NOW(), '2026-11-26', '2026-12-10', 'ABERTO', 2, 1),
(NOW(), '2026-11-07', '2026-11-20', 'DEVOLVIDO', 3, 1),
(NOW(), '2026-11-30', '2026-12-12', 'ABERTO', 4, 1),
(NOW(), '2026-10-30', '2026-11-02', 'ATRASADO', 5, 1),
(NOW(), '2026-11-11', '2026-11-27', 'ABERTO', 6, 1);

ALTER TABLE LIVROS
ADD editora VARCHAR(100);
SELECT * FROM EMPRESTIMOS;

SELECT * FROM USUARIOS
WHERE email = 'VitoriaS@email.com';

UPDATE USUARIOS
SET telefone = '11971579847'
WHERE email = 'VitoriaS@email.com';

SELECT * FROM USUARIOS
WHERE email = 'VitoriaS@email.com';


UPDATE LIVROS
SET Quantidade_Disponivel = Quantidade_Disponivel + 2
WHERE Ano_Publicacao >= 2020;

SELECT * FROM LIVROS;

INSERT INTO USUARIOS (nome, email, telefone)
VALUES ('Virginia S', 'ViRGINIAs@email.com', '197855955434', NULL);

DELETE FROM USUARIOS
WHERE email = 'ViRGINIAs@email.com';

DELETE FROM USUARIOS
WHERE email = 'VitoriaS@email.com';

SELECT *
FROM LIVROS
WHERE Quantidade_Disponivel > 0;

SELECT *
FROM LIVROS
ORDER BY Ano_Publicacao DESC
LIMIT 5;

SELECT *
FROM LIVROS
WHERE titulo LIKE '%Harry%';

SELECT
    USUARIOS.nome,
    LIVROS.titulo,
    EMPRESTIMOS.Data_Emprestimos,
    EMPRESTIMOS.Status_Emprestimos
FROM EMPRESTIMOS
INNER JOIN USUARIOS
ON EMPRESTIMOS.Id_Usuarios = USUARIOS.Id_usuarios
INNER JOIN LIVROS
ON EMPRESTIMOS.Id_Livros = LIVROS.Id_Livros;

SELECT
    USUARIOS.nome,
    EMPRESTIMOS.Id_Emprestimos
FROM USUARIOS
LEFT JOIN EMPRESTIMOS
ON USUARIOS.Id_Usuarios = EMPRESTIMOS.Id_Usuarios;

SELECT
    USUARIOS.nome,
    COUNT(EMPRESTIMOS.Id_Emprestimos) AS total_emprestimos
FROM USUARIOS
LEFT JOIN EMPRESTIMOS
ON USUARIOS.Id_Usuarios = EMPRESTIMOS.Id_Usuarios
GROUP BY USUARIOS.Id_Usuarios, USUARIOS.nome;

SELECT
    USUARIOS.nome,
    COUNT(EMPRESTIMOS.Id_Emprestimos) AS total
FROM USUARIOS
INNER JOIN EMPRESTIMOS
ON USUARIOS.Id_Usuarios = EMPRESTIMOS.Id_Usuarios
GROUP BY USUARIOS.Id_Usuarios, USUARIOS.nome
HAVING COUNT(EMPRESTIMOS.Id_Emprestimos) > 1;

SELECT *
FROM LIVROS
WHERE Id_Livros NOT IN (
    SELECT Id_Livros
    FROM EMPRESTIMOS
);

SELECT
    (SELECT COUNT(*) FROM EMPRESTIMOS) AS Total_Emprestimos,
    (SELECT SUM(Quantidade_Disponivel) FROM LIVROS) AS Livros_Disponiveis;

START TRANSACTION;

INSERT INTO EMPRESTIMOS
(Data_Prevista, Id_Usuarios, Id_Livros)
VALUES
('2026-12-15', 1, 1);

UPDATE LIVROS
SET Quantidade_Disponivel = Quantidade_Disponivel - 1
WHERE Id_Livros = 1
AND Quantidade_Disponivel > 0;

SELECT * FROM LIVROS;

SELECT * FROM EMPRESTIMOS;

COMMIT;

START TRANSACTION;

UPDATE LIVROS
SET Quantidade_Disponivel = Quantidade_Disponivel + 5
WHERE Id_Livros = 1;

SELECT * FROM LIVROS;

ROLLBACK;

SELECT * FROM LIVROS;

START TRANSACTION;

UPDATE LIVROS
SET Quantidade_Disponivel = Quantidade_Disponivel + 1
WHERE Id_Livros = 1;

SAVEPOINT primeira;

UPDATE LIVROS
SET Quantidade_Disponivel = Quantidade_Disponivel + 2
WHERE Id_Livros = 2;

ROLLBACK TO primeira;

COMMIT;

SELECT * FROM LIVROS;

START TRANSACTION;

UPDATE EMPRESTIMOS
SET Status_Emprestimos = 'DEVOLVIDO',
    Data_Devolucao = CURDATE()
WHERE Id_Emprestimos = 1
AND Status_Emprestimos = 'ABERTO';

UPDATE LIVROS
SET Quantidade_Disponivel = Quantidade_Disponivel + 1
WHERE Id_Livros = (
    SELECT Id_Livros
    FROM EMPRESTIMOS
    WHERE Id_Emprestimos = 1
);

COMMIT;

SELECT * FROM EMPRESTIMOS;
SELECT * FROM LIVROS;

-- 25. Análise Técnica dos Mecanismos de Integridade:


-- 1Cadastrar dois usuários com o mesmo e-mail.
-- Mecanismo: CONSTRAINT (UNIQUE).
-- Justificativa: Garante que o nível de banco de dados que não existam registros duplicados no campo 'email'.


-- 2. Cadastrar dois livros com o mesmo ISBN.
-- Mecanismo: CONSTRAINT (UNIQUE).
-- Justificativa: O ISBN é um identificador único universal de publicações; a restrição UNIQUE impede duplicidades no cadastro de títulos.


-- 3. Permitir quantidade disponível negativa.
-- Mecanismo: CONSTRAINT (CHECK).
-- Justificativa: O CHECK (quantidade_disponivel >= 0) é validao com o valor inserido ou atualizando diretamente na tabela.


-- 4. Criar empréstimo para usuário inexistente.
-- Mecanismo: Chave Estrangeira, FOREIGN KEY.
-- Justificativa: Impede que o campo Id_Usuarios na tabela EMPRESTIMOS receba um valor que não existe na chave primária da tabela USUARIOS.


-- 5. Excluir livro com histórico de empréstimos.
-- Mecanismo: Chave Estrangeira, FOREIGN KEY com ON DELETE RESTRICT.
-- Justificativa: A cláusula ON DELETE RESTRICT bloqueia a remoção de registros pai na tabela LIVROS caso exista registros vinculados na tabela EMPRESTIMOS.


-- 6. Gravar empréstimo e falhar na redução do estoque.
-- Mecanismo: TCL - START TRANSACTION, COMMIT, ROLLBACK.
-- Justificativa: As operações de inserção em EMPRESTIMOS e atualização em LIVROS devem possuir a propriedade de atomicidade, garantindo que aconteçam com sucesso, ou nenhuma é efeita.


-- 7. Emprestar livro cuja quantidade disponível seja zero.
-- Mecanismo: Regra da aplicação.
-- Justificativa: Embora todos possam ser verificados por Triggers ou Stored Procedures no banco, a validação de disponibilidade de estoque antes de iniciar a transação de empréstimo deve ser tratada prioritariamente na lógica do sistema de aplicações da tentativa de persistência.
--