# https://dbdiagram.io/d/64c01bde02bd1c4a5eaf25b4

CREATE DATABASE IF NOT EXISTS `biblioteca`;
USE `biblioteca`;

CREATE TABLE IF NOT EXISTS `clientes` (
  `cod_cliente` integer PRIMARY KEY,
  `nome` varchar(200),
  `sexo` char(1),
  `cpf` varchar(14),
  `telefone` varchar(20),
  `email` varchar(200),
  `data_nascimento` varchar(10),
  `situacao` bit
);

CREATE TABLE IF NOT EXISTS `livros` (
  `cod_livro` integer PRIMARY KEY,
  `titulo` varchar(100),
  `autor` varchar(200),
  `genero` varchar(50),
  `ano` varchar(4),
  `status` bit
);

CREATE TABLE IF NOT EXISTS `reservas` (
  `cod_reserva` integer PRIMARY KEY,
  `cod_cliente` int,
  `cod_livro` int,
  `data_reserva` date,
  `data_retirada` date
);

CREATE TABLE IF NOT EXISTS `emprestimos` (
  `cod_emprestimo` integer PRIMARY KEY,
  `cod_cliente` int,
  `cod_livro` int,
  `cod_reserva` int,
  `data_emprestimo` date,
  `data_retorno` date
);

ALTER TABLE `reservas` ADD FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`cod_cliente`);

ALTER TABLE `reservas` ADD FOREIGN KEY (`cod_livro`) REFERENCES `livros` (`cod_livro`);

ALTER TABLE `emprestimos` ADD FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`cod_cliente`);

ALTER TABLE `emprestimos` ADD FOREIGN KEY (`cod_livro`) REFERENCES `livros` (`cod_livro`);

ALTER TABLE `emprestimos` ADD FOREIGN KEY (`cod_reserva`) REFERENCES `reservas` (`cod_reserva`);