-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Jun-2021 às 15:41
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tpeds`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `backend_user`
--

CREATE TABLE `backend_user` (
  `id` int(11) NOT NULL,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `authKey` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `backend_user`
--

INSERT INTO `backend_user` (`id`, `firstName`, `lastName`, `username`, `password`, `authKey`) VALUES
(1, 'Code', 'Epicenter', 'code.epicenter', '123', '123'),
(2, 'Admin', 'Admin', 'admin', '123', '123'),
(3, 'Cozinha', '', 'cozinha', '123', '123'),
(4, 'Entregador', '', 'entregador', '123', '123'),
(5, 'Armazem', '', 'armazem', '123', '123'),
(6, 'Balcao', '', 'balcao', '123', '123'),
(7, 'Cliente', '', 'cliente', '123', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(10) NOT NULL,
  `nif` int(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `nporta` int(20) NOT NULL,
  `codpostal` varchar(10) DEFAULT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nif`, `nome`, `rua`, `nporta`, `codpostal`, `telefone`, `email`) VALUES
(1, 2147483647, 'Joao', 'Rua do Joao', 12, '4775-266', '961549205', 'joao@sapo.pt'),
(2, 2147483647, 'Leonardo', 'Rua de S.Leonardo', 1, '4775-100', '919191911', 'leonarod@email.com'),
(3, 2147483647, 'Miguel Rita', 'Rua de Bastuço', 69, '4775-300', '903309031', 'miguel_rita@email.nz');

-- --------------------------------------------------------

--
-- Estrutura da tabela `codpostal`
--

CREATE TABLE `codpostal` (
  `codpostal` varchar(20) NOT NULL,
  `localidade` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `codpostal`
--

INSERT INTO `codpostal` (`codpostal`, `localidade`) VALUES
('4775-100', 'Grimancelos'),
('4775-266', 'Viatodos'),
('4775-300', 'Silveiros');

-- --------------------------------------------------------

--
-- Estrutura da tabela `encomenda`
--

CREATE TABLE `encomenda` (
  `id_encomenda` int(10) NOT NULL,
  `vtotal` float NOT NULL,
  `iva` float NOT NULL,
  `vfinal` float NOT NULL,
  `num_entrega` int(10) NOT NULL,
  `id_cliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `encomenda`
--

INSERT INTO `encomenda` (`id_encomenda`, `vtotal`, `iva`, `vfinal`, `num_entrega`, `id_cliente`) VALUES
(1, 25, 0.23, 27, 1, 1),
(2, 30, 0.23, 33, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `encomenda_pizza`
--

CREATE TABLE `encomenda_pizza` (
  `num_pizza` int(10) NOT NULL,
  `id_encomenda` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `encomenda_pizza`
--

INSERT INTO `encomenda_pizza` (`num_pizza`, `id_encomenda`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `num_entrega` int(10) NOT NULL,
  `data` date NOT NULL,
  `hora` varchar(20) DEFAULT NULL,
  `cod_funcionario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `entrega`
--

INSERT INTO `entrega` (`num_entrega`, `data`, `hora`, `cod_funcionario`) VALUES
(1, '2021-06-10', '20:04', 1),
(2, '2021-06-19', '13:04', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `num_fornecedor` int(10) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `nporta` int(10) NOT NULL,
  `codpostal` varchar(10) DEFAULT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`num_fornecedor`, `nome`, `rua`, `nporta`, `codpostal`, `telefone`) VALUES
(1, 'Carnes lda', 'Rua do Fornecedor', 55, '4775-100', '965783452'),
(2, 'Laticinios', 'Rua do Fornecedor2', 22, '4775-300', '961111222');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cod_funcionario` int(10) NOT NULL,
  `nif` int(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `rua` varchar(20) DEFAULT NULL,
  `nporta` varchar(20) DEFAULT NULL,
  `codpostal` varchar(10) DEFAULT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `salario` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`cod_funcionario`, `nif`, `nome`, `rua`, `nporta`, `codpostal`, `telefone`, `email`, `salario`) VALUES
(1, 2147483647, 'Rafael', 'Rua do Rafael', '13', '4775-266', '961549203', 'rafael@sapo.pt', 500),
(2, 2147483647, 'António', 'Rua do S. Antonio', '3', '4775-300', '961900876', 'antonio@hotmail.pt', 100);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id_ingrediente` int(10) NOT NULL,
  `preco` varchar(20) NOT NULL,
  `qtd` int(10) NOT NULL,
  `nome` varchar(10) NOT NULL,
  `validade` date NOT NULL,
  `num_fornecedor` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ingrediente`
--

INSERT INTO `ingrediente` (`id_ingrediente`, `preco`, `qtd`, `nome`, `validade`, `num_fornecedor`) VALUES
(1, '0.20', 30, 'Fiambre', '2021-12-02', 1),
(2, '0.23', 22, 'Queijo', '2021-08-22', 2),
(3, '0.05', 55, 'Massa', '2021-12-31', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingrediente_pizza`
--

CREATE TABLE `ingrediente_pizza` (
  `id_ingrediente` int(10) NOT NULL,
  `num_pizza` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ingrediente_pizza`
--

INSERT INTO `ingrediente_pizza` (`id_ingrediente`, `num_pizza`) VALUES
(3, 1),
(1, 1),
(3, 1),
(3, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pizza`
--

CREATE TABLE `pizza` (
  `num_pizza` int(10) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `precocusto` varchar(20) NOT NULL,
  `precovenda` varchar(20) NOT NULL,
  `qtde` int(10) NOT NULL,
  `validade` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pizza`
--

INSERT INTO `pizza` (`num_pizza`, `nome`, `precocusto`, `precovenda`, `qtde`, `validade`) VALUES
(0, 'Carbonara', '4', '16.99', 30, '2021-06-24'),
(1, 'Calabresa', '3', '15', 10, '2021-06-17'),
(2, '4 estações', '3.40', '10', 20, '2021-06-19'),
(3, 'Bacon & Fiambre', '5', '19', 11, '2021-06-21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(10) NOT NULL,
  `hinicio` varchar(20) NOT NULL,
  `hfim` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `turno`
--

INSERT INTO `turno` (`id_turno`, `hinicio`, `hfim`) VALUES
(1, '10:00', '17:00'),
(2, '17:00', '23:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turno_funcionario`
--

CREATE TABLE `turno_funcionario` (
  `id_turno` int(10) NOT NULL,
  `cod_funcionario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `turno_funcionario`
--

INSERT INTO `turno_funcionario` (`id_turno`, `cod_funcionario`) VALUES
(1, 1),
(2, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `backend_user`
--
ALTER TABLE `backend_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `codpostal` (`codpostal`);

--
-- Índices para tabela `codpostal`
--
ALTER TABLE `codpostal`
  ADD PRIMARY KEY (`codpostal`);

--
-- Índices para tabela `encomenda`
--
ALTER TABLE `encomenda`
  ADD PRIMARY KEY (`id_encomenda`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `num_entrega` (`num_entrega`);

--
-- Índices para tabela `encomenda_pizza`
--
ALTER TABLE `encomenda_pizza`
  ADD PRIMARY KEY (`id_encomenda`),
  ADD KEY `num_pizza` (`num_pizza`);

--
-- Índices para tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`num_entrega`),
  ADD KEY `cod_funcionario` (`cod_funcionario`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`num_fornecedor`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cod_funcionario`),
  ADD KEY `codpostal` (`codpostal`);

--
-- Índices para tabela `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id_ingrediente`),
  ADD KEY `num_fornecedor` (`num_fornecedor`);

--
-- Índices para tabela `ingrediente_pizza`
--
ALTER TABLE `ingrediente_pizza`
  ADD KEY `id_ingrediente` (`id_ingrediente`),
  ADD KEY `num_pizza` (`num_pizza`);

--
-- Índices para tabela `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`num_pizza`);

--
-- Índices para tabela `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`);

--
-- Índices para tabela `turno_funcionario`
--
ALTER TABLE `turno_funcionario`
  ADD KEY `cod_funcionario` (`cod_funcionario`),
  ADD KEY `id_turno` (`id_turno`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `backend_user`
--
ALTER TABLE `backend_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`codpostal`) REFERENCES `codpostal` (`codpostal`);

--
-- Limitadores para a tabela `encomenda`
--
ALTER TABLE `encomenda`
  ADD CONSTRAINT `encomenda_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `encomenda_ibfk_2` FOREIGN KEY (`num_entrega`) REFERENCES `entrega` (`num_entrega`);

--
-- Limitadores para a tabela `encomenda_pizza`
--
ALTER TABLE `encomenda_pizza`
  ADD CONSTRAINT `encomenda_pizza_ibfk_1` FOREIGN KEY (`id_encomenda`) REFERENCES `encomenda` (`id_encomenda`),
  ADD CONSTRAINT `encomenda_pizza_ibfk_2` FOREIGN KEY (`num_pizza`) REFERENCES `pizza` (`num_pizza`);

--
-- Limitadores para a tabela `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`cod_funcionario`) REFERENCES `funcionario` (`cod_funcionario`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`codpostal`) REFERENCES `codpostal` (`codpostal`);

--
-- Limitadores para a tabela `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD CONSTRAINT `ingrediente_ibfk_1` FOREIGN KEY (`num_fornecedor`) REFERENCES `fornecedor` (`num_fornecedor`);

--
-- Limitadores para a tabela `ingrediente_pizza`
--
ALTER TABLE `ingrediente_pizza`
  ADD CONSTRAINT `ingrediente_pizza_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`),
  ADD CONSTRAINT `ingrediente_pizza_ibfk_2` FOREIGN KEY (`num_pizza`) REFERENCES `pizza` (`num_pizza`);

--
-- Limitadores para a tabela `turno_funcionario`
--
ALTER TABLE `turno_funcionario`
  ADD CONSTRAINT `turno_funcionario_ibfk_1` FOREIGN KEY (`cod_funcionario`) REFERENCES `funcionario` (`cod_funcionario`),
  ADD CONSTRAINT `turno_funcionario_ibfk_2` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
