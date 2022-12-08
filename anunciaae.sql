-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.20-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para anuncia_ae
CREATE DATABASE IF NOT EXISTS `anuncia_ae` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `anuncia_ae`;

-- Copiando estrutura para tabela anuncia_ae.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela anuncia_ae.clientes: ~3 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `email`, `name`, `document`, `zip_code`, `district`, `address`, `password`) VALUES
	(1, 'joao@gmial.com', 'João de Jesus', '26574770033', '4540000', 'Tento', 'Rua das Flores', '2545@#'),
	(2, 'hevelinfreitas21@gmail.com', 'Pabricio de Jesus Freitas', '09422944586', '4540000', 'Tento', 'Rua das Flores', '123456'),
	(3, 'paula@gmail.com', 'Puala dos Santos', '39072245075', '454000', 'Graça', 'Rua pintangueira', '4415@ers');

-- Copiando estrutura para tabela anuncia_ae.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` float DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela anuncia_ae.products: ~2 rows (aproximadamente)
INSERT INTO `products` (`id`, `id_cliente`, `title`, `description`, `price`, `image`) VALUES
	(1, 2, 'Acarajé', 'Essa é uma acarajé feita com azeite e camaração e maça de abacate', 35, '01.jpg'),
	(2, 5, 'Manicure', 'Faço mão e pé atendimendo a domicilio, não vou em bairros perigosos', 100, '02.jpg');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
