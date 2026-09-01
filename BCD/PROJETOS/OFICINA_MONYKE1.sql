CREATE DATABASE OFICINA_MONYKE;
USE OFICINA_MONYKE;
SHOW TABLES;

CREATE TABLE CLIENTES (
Id_Clientes int auto_increment primary key,
Nome varchar(60) not null,
Data_Nasc datetime not null,
Telefone varchar(14) not null,
CPF varchar(14) not null,
Endereço varchar(40) not null
);

CREATE TABLE VEÍCULOS (
Id_Veículos int auto_increment primary key,
Modelo varchar(200) not null,
Marca varchar(200) not null,
Quilometragem int not null,
Placa varchar(8) not null,
Ano int not null
);

CREATE TABLE PAGAMENTOS (
Id_Pagamentos int auto_increment primary key,
Parcelas_Pagamentos int not null,
Quem_Paga varchar(200) not null,
Data_Emissão datetime not null,
Valor_Pago int not null,
Forma_Pagamento decimal not null
);

CREATE TABLE ORDENS_SERVIÇO (
Id_Ordens_Serviço int auto_increment primary key,
Data datetime not null,
Status varchar(200) not null,
Valor int not null,
Garantia varchar(200) not null,
Tipo_Serviço varchar(250) not null
);

CREATE TABLE MARCAS (
Id_Marcas int auto_increment primary key,
Descrição varchar(250) not null,
Status varchar(200) not null,
Nome varchar(200) not null,
País_Origem varchar(250),
Ano_Fundação year not null
);

CREATE TABLE PECAS (
Id_Pecas int auto_increment primary key,
Código int not null,
Preco int not null,
Quantidade_Estoque int not null,
Marca varchar(200) not null,
Nome varchar(60) not null
);

CREATE TABLE FORNECEDORES (
Id_Fornecedores int auto_increment primary key,
Nome varchar(60) not null,
Telefone varchar(14) not null,
CNPJ varchar(200) not null,
E_Mail varchar(250) not null,
Endereço varchar(40) not null
);

CREATE TABLE MODELOS (
Id_Modelos int auto_increment primary key,
Peso int not null,
Tamanho varchar(200) not null,
Material varchar(250) not null,
Categoria varchar(250) not null,
Cor varchar(40) not null
);

CREATE TABLE SERVIÇOS (
Id_Serviços int auto_increment primary key,
Tipo_Serviço varchar(200) not null,
Descrição_Veículo varchar(250) not null,
Nome_Cliente varchar(60) not null,
Valor int not null,
Tempo_Estimado datetime not null
);

CREATE TABLE FUNCIONÁRIOS (
Id_Funcionários int auto_increment primary key,
Turno varchar(250) not null,
Data_Nasc datetime not null,
Nome varchar(60) not null,
CPF varchar(14) not null,
Cargo varchar(200) not null
);