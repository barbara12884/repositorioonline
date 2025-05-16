-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 16-Maio-2025 às 23:15
-- Versão do servidor: 8.2.0
-- versão do PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `centro_cultural`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `artistas`
--

CREATE TABLE IF NOT EXISTS `artistas` (
  `id_artistas` int NOT NULL AUTO_INCREMENT,
  `id_eventos` int NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_evento` date NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `morada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contacto` int NOT NULL,
  `data_nascimento` date NOT NULL,
  `horas_trabalho` time NOT NULL,
  PRIMARY KEY (`id_artistas`),
  KEY `id_eventos` (`id_eventos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `artistas`
--

INSERT INTO `artistas` (`id_artistas`, `id_eventos`, `nome`, `data_evento`, `email`, `morada`, `contacto`, `data_nascimento`, `horas_trabalho`) VALUES
(1, 1, 'Joana Aguiar', '2025-04-16', 'joanaaguiar@gmail.com', 'Rua L Nº7', 934587610, '2000-02-24', '05:00:00'),
(2, 2, 'Paulo Sousa', '2025-04-22', 'paulo@gmail.com', 'Rua I Nº9', 964752304, '2005-02-13', '07:00:00'),
(3, 1, 'Beatriz Correia', '2025-04-23', 'beatriz5@gmail.com', 'Rua K Nº8', 964570310, '1985-03-20', '08:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `bilhetes`
--

CREATE TABLE IF NOT EXISTS `bilhetes` (
  `id_bilhetes` int NOT NULL AUTO_INCREMENT,
  `id_eventos` int NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `preco` varchar(255) NOT NULL,
  `tipo_de_bilhete` varchar(255) NOT NULL,
  `data_compra` timestamp NOT NULL,
  PRIMARY KEY (`id_bilhetes`),
  KEY `id_eventos` (`id_eventos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `bilhetes`
--

INSERT INTO `bilhetes` (`id_bilhetes`, `id_eventos`, `nome`, `data`, `hora`, `preco`, `tipo_de_bilhete`, `data_compra`) VALUES
(1, 1, 'Concerto', '2025-04-15', '22:00:00', '15€', 'Em dinheiro', '2025-04-06 21:53:37'),
(2, 2, 'Teatro', '2025-04-16', '00:00:00', '10€', 'Em dinheiro', '2025-04-06 21:53:37');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id_clientes` int NOT NULL AUTO_INCREMENT,
  `id_utilizadores` int NOT NULL,
  `data_registo` timestamp NOT NULL,
  `nome_completo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `N.I.F` int NOT NULL,
  `morada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `codigo_postal` int NOT NULL,
  `data_nascimento` date NOT NULL,
  `contacto` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_clientes`),
  KEY `id_utilizadores` (`id_utilizadores`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `id_utilizadores`, `data_registo`, `nome_completo`, `N.I.F`, `morada`, `codigo_postal`, `data_nascimento`, `contacto`, `email`) VALUES
(1, 1, '2025-04-06 21:45:41', 'Ana Maria', 257894614, 'Rua A Nº1', 5761456, '2001-01-09', 964587154, 'anamaria2@gmail.com'),
(2, 2, '2025-04-06 21:45:41', 'João Pedro', 578136584, 'Rua H Nº9', 5474648, '1993-01-12', 964758467, 'joão08@sapo.pt'),
(3, 3, '2025-04-06 21:45:41', 'Leonor Santos', 547854978, 'Rua S Nº8', 5180756, '1995-01-18', 934578946, 'leonors@hotmail.com'),
(4, 4, '2025-04-06 21:45:41', 'Joaquim Matos', 248579564, 'Rua F Nº6', 5780698, '1985-02-14', 934578216, 'joaquimm@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

CREATE TABLE IF NOT EXISTS `eventos` (
  `id_eventos` int NOT NULL AUTO_INCREMENT,
  `id_artistas` int NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `local` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  PRIMARY KEY (`id_eventos`),
  KEY `id_artistas` (`id_artistas`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `eventos`
--

INSERT INTO `eventos` (`id_eventos`, `id_artistas`, `nome`, `data`, `hora`, `local`, `data_inicio`, `data_fim`) VALUES
(1, 1, 'Concerto', '2025-04-15', '22:00:00', 'Convento São Francisco, Coimbra', '2025-04-06 20:57:54', '2025-04-06 20:57:54'),
(2, 2, 'Teatro', '2025-04-16', '00:00:00', 'Convento São Francisco, Coimbra', '2025-04-06 20:57:54', '2025-04-06 20:57:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `organizacao`
--

CREATE TABLE IF NOT EXISTS `organizacao` (
  `id_organizacao` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_inicio` timestamp NOT NULL,
  `id_artistas` int NOT NULL,
  PRIMARY KEY (`id_organizacao`),
  KEY `id_artistas` (`id_artistas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE IF NOT EXISTS `utilizadores` (
  `id_utilizadores` int NOT NULL AUTO_INCREMENT,
  `id_clientes` int NOT NULL,
  `nome_utilizador` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` int NOT NULL,
  `admin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `morada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_utilizadores`),
  KEY `id_clientes` (`id_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`id_utilizadores`, `id_clientes`, `nome_utilizador`, `password`, `admin`, `email`, `morada`) VALUES
(1, 1, 'Ana', 1, 'AnaM', 'anamaria2@gmail.com', 'Rua A Nº 1'),
(2, 2, 'Manel', 2, 'Manel', 'manuel3@gmail.com', 'Rua C Nº5'),
(3, 3, 'João', 3, 'JoãoP', 'joão08@sapo.pt', 'Rua H Nº9'),
(4, 4, 'Matilde', 4, 'MatildeS', 'matilde@gmail.com', 'Rua B Nº6'),
(5, 5, 'Anabela', 5, 'AnabelaC', 'anabelacosta@gmail.com', 'Rua D Nº4');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `artistas`
--
ALTER TABLE `artistas`
  ADD CONSTRAINT `artistas_ibfk_1` FOREIGN KEY (`id_eventos`) REFERENCES `eventos` (`id_eventos`);

--
-- Limitadores para a tabela `bilhetes`
--
ALTER TABLE `bilhetes`
  ADD CONSTRAINT `bilhetes_ibfk_1` FOREIGN KEY (`id_eventos`) REFERENCES `eventos` (`id_eventos`);

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_utilizadores`) REFERENCES `utilizadores` (`id_utilizadores`);

--
-- Limitadores para a tabela `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_artistas`) REFERENCES `artistas` (`id_artistas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
