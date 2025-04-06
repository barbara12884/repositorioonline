-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 06-Abr-2025 às 11:38
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

DROP TABLE IF EXISTS `artistas`;
CREATE TABLE IF NOT EXISTS `artistas` (
  `id_artistas` int NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `contacto` int NOT NULL,
  `morada` varchar(500) NOT NULL,
  `horas_trabalho` timestamp NOT NULL,
  `email` int NOT NULL,
  `data_nascimento` date NOT NULL,
  `id_eventos` int NOT NULL,
  PRIMARY KEY (`id_artistas`),
  KEY `id_eventos` (`id_eventos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bilhetes`
--

DROP TABLE IF EXISTS `bilhetes`;
CREATE TABLE IF NOT EXISTS `bilhetes` (
  `id_bilhetes` int NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `preço` int NOT NULL,
  `data` date NOT NULL,
  `hora` int NOT NULL,
  `id_evento` int NOT NULL,
  `data_compra` timestamp NOT NULL,
  `tipo_de_bilhete` int NOT NULL,
  PRIMARY KEY (`id_bilhetes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_clientes` int NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `N.I.F` int NOT NULL,
  `morada` text NOT NULL,
  `codigo-postal` int NOT NULL,
  `email` text NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_registo` timestamp NOT NULL,
  `id_utilizadores` int NOT NULL,
  `contacto` int NOT NULL,
  PRIMARY KEY (`id_clientes`),
  KEY `id_utilizadores` (`id_utilizadores`),
  KEY `id_utilizadores_2` (`id_utilizadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id_eventos` int NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `data` date NOT NULL,
  `hora` int NOT NULL,
  `local` text NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `id_artistas` int NOT NULL,
  PRIMARY KEY (`id_eventos`),
  KEY `id_artistas` (`id_artistas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `organização`
--

DROP TABLE IF EXISTS `organização`;
CREATE TABLE IF NOT EXISTS `organização` (
  `id_organizacao` int NOT NULL,
  `nome` text NOT NULL,
  PRIMARY KEY (`id_organizacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci PACK_KEYS=1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

DROP TABLE IF EXISTS `utilizadores`;
CREATE TABLE IF NOT EXISTS `utilizadores` (
  `id_utilizadores` int NOT NULL AUTO_INCREMENT,
  `nome_utiizador` text NOT NULL,
  `password` int NOT NULL,
  `admin` text NOT NULL,
  `email` text NOT NULL,
  `morada` varchar(500) NOT NULL,
  PRIMARY KEY (`id_utilizadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `artistas`
--
ALTER TABLE `artistas`
  ADD CONSTRAINT `artistas_ibfk_1` FOREIGN KEY (`id_eventos`) REFERENCES `eventos` (`id_eventos`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `bilhetes`
--
ALTER TABLE `bilhetes`
  ADD CONSTRAINT `bilhetes_ibfk_1` FOREIGN KEY (`id_bilhetes`) REFERENCES `eventos` (`id_eventos`);

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_clientes`) REFERENCES `bilhetes` (`id_bilhetes`);

--
-- Limitadores para a tabela `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_eventos`) REFERENCES `artistas` (`id_artistas`);

--
-- Limitadores para a tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD CONSTRAINT `utilizadores_ibfk_1` FOREIGN KEY (`id_utilizadores`) REFERENCES `clientes` (`id_clientes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
