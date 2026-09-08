CREATE DATABASE Castello_Relacionamentos;

use Castello_Relacionamentos;

CREATE TABLE Produtos (
    Id_Produto Int Auto_Increment Primary Key,
    Nome_Produto varchar(100) Not Null
);

CREATE TABLE Estoque (
    Id_Estoque Int Auto_Increment Primary Key,
    Id_Produto Int Not Null Unique,
    Quantidade Int Not Null,
    Foreign Key (Id_Produto) References Produtos (Id_Produto)
);

CREATE TABLE Clientes (
    Id_Cliente Int Auto_Increment Primary Key,
    Nome_Cliente varchar(60) Not Null
);

CREATE TABLE Pedidos (
    Id_Pedido Int Auto_Increment Primary Key,
    Data_Pedido Datetime Not Null,
    Id_Cliente Int Not Null,
    Foreign Key (Id_Cliente) References Clientes (Id_Cliente)
);

CREATE TABLE Fornecedores (
    Id_Fornecedor Int Auto_Increment Primary Key,
    Nome_Fornecedor varchar(60) Not Null
);

CREATE TABLE Fornecedores_Produtos (
    Id_Fornecedor Int Not Null,
    Id_Produto Int Not Null,
    Primary Key (Id_Fornecedor, Id_Produto),
    Foreign Key (Id_Fornecedor) References Fornecedores (Id_Fornecedor),
    Foreign Key (Id_Produto) References Produtos (Id_Produto)
);

select * from Produtos;

Insert Into produtos (Nome_Produto) values ('Camiseta');
Insert Into produtos (Nome_Produto) values ('Blusa');

-- Desafio Cardinalidades

-- Questão 1
-- Categoria --- Pertence --- Produto
--  1,N                         1,1

-- Questão 2
-- Funcionário --- Registrar --- Pedidos
--  1,N                           1,1

-- Questão 3
-- Fornecedor --- Cormecializa --- Produto
-- 1,N                              1,N

-- Questão 4
-- Mesa --- Reserva --- Cliente
-- 0,N                   1,1

-- Questão 5
-- Pedido --- Unico --- Itens
-- 1,N                   1,1
