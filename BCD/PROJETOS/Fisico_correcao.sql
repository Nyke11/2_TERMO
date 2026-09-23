-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Delivery (
Id_delivery int primary key auto_increment PRIMARY KEY,
Informacoes_Produtos varchar(200) not null,
Numero_Pedido int not null,
Data_Hora_Saida datetime not null,
Status_Entrega varchar(150) not null,
Endereco_Entrega varchar(200) not null,
Taxa_Entrega decimal(10,2) not null,
PRIMARY KEY(Id_Delivery)
)

CREATE TABLE Funcionarios (
Id_funcionarios int primary key auto_increment PRIMARY KEY,
Data_admissao datetime not null,
Salario decimal(10,2) not null,
Nome varchar(60) not null,
Cargo varchar(100) not null,
CPF varchar(14) not null,
PRIMARY KEY(Id_funcionarios)
)

CREATE TABLE Clientes(
Id_clientes int primary key auto_increment,
CPF varchar(14) not null,
Data_Cadastro datetime not null,
Telefone varchar(14) note null,
Email vachar (250) note null,
Nome vachar (60) note null
PRIMARY KEY(Id_clientes)
)

CREATE TABLE Prog_Fidelidade (
Id_Prog_Fidelidade int primary key auto_increment,
Data_Ultima_Atualizacao datetime not null,
Saldos_Pontos  int not null,
Expiracao_Produtos datetime not null,
Checagem_Produtos varchar(100) not null,
PRIMARY KEY(Id_Prog_Fidelidade)
)


CREATE TABLE Pedido(
Id_Pedidos int primary key auto_increment,
Tipo_Pedido varchar(100) not null,
Valor_Total decimal(10,2) not null,
Status varchar(150) not null,
Data_Hora datetime not null,
PRIMARY KEY(Id_Pedidos)
)

CREATE TABLE Pagamento(
Id_pagamento int primary key auto_increment,
Status_Pagamento varchar(150) not null,
Data_Hora_Pagamento datetime not null,
Forma_Pagamento decimal not null,
Valor_Pago int not null,
PRIMARY KEY(Id_pagamento)
)


CREATE TABLE Produtos (
Id_produtos int primary key auto_increment PRIMARY KEY,
Preco_Unitario decimal(10,2) not null,
Peso varchar(90) not null,
Nome varchar(60) not null,
Categoria varchaar(100) not null,
Descricao varchar(150) not null,
PRIMARY KEY(Id_Produtos)
)

CREATE TABLE Estoque (
Id_Estoque int primary key auto_increment PRIMARY KEY,
Nome_Insumo varchar(150) not null,
Quantidade_Atual decimal(10,2) not null,
Unidade_Medida int not null,
Quantidade_Minima int not null,
PRIMARY KEY(Id_Estoque)
)

CREATE TABLE Entrega  (
Id_funcionarios int,
Id_delivery int,
FOREIGN KEY(Id_funcionarios) REFERENCES Funcionarios (Id_funcionarios),
FOREIGN KEY(Id_delivery) REFERENCES Delivery (Id_delivery)
)

CREATE TABLE Realiza (
Id_Pedidos int,
Id_clientes int,
FOREIGN KEY(Id_Pedido) REFERENCES Pedido(Id_Pedidos),
FOREIGN KEY(Id_Clientes) REFERENCES Clientes(Id_clientes)
)

CREATE TABLE Atende (
Id_Pedidos int,
Id_funcionarios int,
FOREIGN KEY(Id_Pedidos) REFERENCES Pedido(Id_Pedidos),
FOREIGN KEY(Id_funcionarios) REFERENCES Funcionarios (Id_funcionarios)
)

CREATE TABLE Contem (
Id_produtos int,
Id_Pedidos int,
FOREIGN KEY(Id_produtos) REFERENCES Produtos (Id_produtos),
FOREIGN KEY(Id_Pedidos) REFERENCES Pedido (Id_Pedidos)
)

CREATE TABLE Consome (
Id_Estoque int,
Id_produtos int,
FOREIGN KEY(Id_Estoque) REFERENCES Estoque (Id_Estoque),
FOREIGN KEY(Id_produtos) REFERENCES Produtos (Id_produtos)
)
