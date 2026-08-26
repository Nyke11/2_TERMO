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
Parcelas_Pagamentos int not null
);
