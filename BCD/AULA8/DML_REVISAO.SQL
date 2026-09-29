-- Active: 1788268023903@@127.0.0.1@3306@smartcoffee_dml_monyke
-- REVISÃO DE DML - AULA 08

-- REVISÃO DE INSERTS
INSERT INTO CLIENTE (nome, email,telefone,cidade, ativo) VALUES
('Kauan R', 'KauanR@email.com', '1999999449', 'limeira', TRUE),
('Laura C', 'lauraC@email.com', '1999999999', 'limeira', TRUE),
('Laura N', 'lauraN@email.com', '1999995999', 'limeira', TRUE),
('Laura R', 'lauraR@email.com', '1999999921', 'limeira', TRUE),
('Leonardo B', 'LeoB@email.com', '1999489921', 'limeira', TRUE),
('Leonardo BT', 'LeoBT@email.com', '1995599921', 'Americana', TRUE),
('Lidia', 'LidiaE@email.com', '1996699921', 'Belem', TRUE),
('Livia', 'LiviaV@email.com', NULL, 'Limeira', TRUE),
('Marco', 'Marco@email.com', '1985599921', 'campo Mourão', TRUE),
('Nicolas N', 'nicolasN@email.com', '1985599922', '', FALSE),
('Nicolas F', 'nicolasF@email.com', '1985229922', 'Campinas', TRUE),
('Pablo H', 'Pablo@email.com', '1985599912', 'Indaiatuba', TRUE),
('Sophie A', 'Sophie@email.com', '19785599912', 'Campinas', TRUE),
('Vinicius H', 'Vini@email.com', '1978559955', 'Limeira', TRUE),
('Vitoria S', 'VitoriaS@email.com', '19785594034', 'Limeira', TRUE),
('Virginia S', 'ViRGINIAs@email.com', '197855955434', 'Boston', TRUE);

INSERT INTO categoria (nome_categoria) VALUES
('Combos Especias'),('Nutella');

INSERT INTO pedido (data_pedido,status_pedido,valor_total,id_cliente)VALUES
(NOW(), 'pendente',0.00,12);

INSERT INTO pedido (data_pedido,status_pedido,valor_total,id_cliente)VALUES
(NOW(), 'pendente',0.00,12);

SET  @pedido = LAST_INSERT_ID();
SELECT @pedido;

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 24, 2, 13.00, 'Nutella'); sms AffctedRows: 1

------------------------------------------------------------------------------------------

-- ATUALIZADO DADOS NO BD
UPDATE cliente
SET telefone = '19 9999939374'
WHERE id_cliente = 8;

-- UPDATE cliente
-- SET telefone = '19 6754885437',
--     cliente = 'Curitiba',
--     ativo = FALSE
-- WHERE id_cliente = 8;

--- TOMAR MUITO CUIDADO ------ NÃO ESQUECER :(
UPDATE cliente
SET ativo = FALSE;

UPDATE pedido
SET valor_total = 10.00;

--------------------------------------------------------------------------------

-- DIACS DE OURO
-- EXECUTAR O SELECT SEMPRE ANTES DE ATUALIZAR
-- SELECT * FROM TABELA_QUE_DESEJO;

--------------------------------------------------------------------------------

-- CONDICIONAIS
UPDATE produto
SET preco =
CASE 
    WHEN preco < 30 THEN preco * 1.50
    ELSE preco * 1.25
END
WHERE ativo = TRUE;

UPDATE cliente 
SET telefone = NULL
WHERE id_cliente = 3;

--- APAGAMENTO DADOS DO BD
DELETE FROM cliente
WHERE id_cliente = 1;

TRUNCATE TABLE cliente;

-- EXCLUINDO DADOS DE FORMA LÓGICA
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 8;

-- CADASTRO UM PROCEDIMENTO DE COMPRA
-- PASSO 1: ADICIONADO NOVO CLIENTE
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Lidia', 'Lidia@email.com', '1996699921', 'Belem', TRUE);
SET @cliente = LAST_INSERT_ID();

-- PASSO 2: ADICIONANDO UM NOVO PEDIDO
INSERT INTO PEDIDO (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(), 'PENDENTE',0.00,@cliente);

-- PASSO 3: ADICIONANDO ITENS AO PEDIDO
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 4, 2, 13.00, 'Mel'),
(@pedido, 5, 1, 15.50, '');

-- PASSO 4: ATUALIZANDO O VALOR TOTAL DO PEDIDO
UPDATE pedido
SET valor_total = 22.00,
    status = 'Preparando'
WHERE id_pedido = @pedido;

-- PASSO 5: REGISTRANDO PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido, 2, 22.00, NOW());

--- CONSULTA DE FORMA COMPLETA
SELECT p.id_pedido,
       c.nome AS cliente,
       p.status,
       p.valor_total
FROM pedido PARTITION BYJOIN cliente c ON c.id_cliente = p.`ID_CLIENTE`
WHERE p.id_pedido = @pedido;

-- CONSULTA PARA OS DADOS NO BD
SELECT * FROM pedido;
SELECT * FROM cliente
where id_cliete = 23;
