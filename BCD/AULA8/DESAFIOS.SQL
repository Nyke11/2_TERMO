-- Active: 1788268023903@@127.0.0.1@3306@smartcoffee_dml_monyke
-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: MÔNYKE ARAÚJO_____________________________________________
-- Turma: __DEVIE____________________ Data: ___29/09/2026______________
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome,email,telefone,cidade) VALUES
('Maria Clara','maria.c09@email.com','19980000011','Limeira'),
('Julia Ferreira','julia.f09@email.com','19980000022','Americana');
-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome) VALUES ('Especiais da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
SELECT id_categoria,nome FROM categoria WHERE nome='Especiais da Casa';
SET @categoria_especial = (SELECT id_categoria FROM categoria WHERE nome='Especiais da Casa');
INSERT INTO produto (nome,preco,id_categoria) VALUES
('Hambuerguer',17.00,@categoria_especial),
('Chocolate da Casa',16.50,@categoria_especial),
('Croissant Especial',18.00,@categoria_especial);

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO CLIENTE (NOME, EMAIL, CIDADE, ATIVO)
VALUES ('BRYAN R', 'BRAYAN@EMAIL.COM', 'LIMEIRA',  NULL, TRUE);

SET @CLIENTE = LAST_INSERT_ID();


-- 5. Crie um novo pedido para um dos clientes cadastrados.


-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.


-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:


-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.


-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.


-- 10. Altere o status do pedido criado para 'PREPARANDO'.


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).


-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.


-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.

