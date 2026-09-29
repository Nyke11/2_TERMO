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
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Jesus N', 'JesusN@email.com', '1996699922', 'Belem', TRUE),
('Wlesley C', 'WlesleyC@email.com', '1996699923', 'Brotas', TRUE);

-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome_categoria) VALUES ('Especiais da casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
INSERT INTO produtos (nome_porduto, preco, ativo, id_categoria);
('Hamburguer Especial', 25.00, LAST_INSERT_ID());
('Batata fritas', 15.00, LAST_INSERT_ID());
('Suco', 5.00, LAST_INSERT_ID());

-- 4. Cadastre um terceiro cliente sem telefone.


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

