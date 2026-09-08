-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Fornecedores (
ID_Fornecedores Int Auto_Increment Primary Key PRIMARY KEY,
Razão_Social varchar(100) not null
)

CREATE TABLE Produtos (
ID_Produtos Int Auto_Increment Primary Key PRIMARY KEY,
Nome_Produto varchar(100) not null
)

CREATE TABLE Item_Produto (
ID_Produtos Int Unique,
ID_Fornecedores Int Unique,
QTDE int not null,
observação  text(300),
ID_Item int Auto_Increment Primary Key PRIMARY KEY,
FOREIGN KEY(ID_Produtos) REFERENCES Produtos (ID_Produtos)
)

