-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26-Out-2018 às 01:28
-- Versão do servidor: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurantedobigode`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `idEndereco` int(11) NOT NULL,
  `rua/quadra` varchar(150) DEFAULT NULL,
  `conjunto` varchar(3) DEFAULT NULL,
  `numero` decimal(3,0) DEFAULT NULL,
  `idEnderecoPessoa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoques`
--

CREATE TABLE `estoques` (
  `idEstoque` int(11) NOT NULL,
  `quantidade` decimal(3,0) DEFAULT NULL,
  `idEstoqueProduto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `idFuncionario` int(11) NOT NULL,
  `matricula` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mesa`
--

CREATE TABLE `mesa` (
  `cod_mesa` int(11) NOT NULL,
  `qtd_lugares` int(11) NOT NULL,
  `disponivel` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `mesa`
--

INSERT INTO `mesa` (`cod_mesa`, `qtd_lugares`, `disponivel`) VALUES
(1, 4, 0),
(2, 4, 0),
(3, 6, 0),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `idPagamento` int(11) NOT NULL,
  `tipo_pagamento` varchar(45) DEFAULT NULL,
  `valor_pago` double(4,2) DEFAULT NULL,
  `idPagamentoVenda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedidos` int(11) NOT NULL,
  `valor_total` double(4,2) DEFAULT NULL,
  `quantidade` decimal(2,0) DEFAULT NULL,
  `idPedidoCliente` int(11) DEFAULT NULL,
  `idPedidoProduto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `idPessoa` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `cpf` decimal(14,0) DEFAULT NULL,
  `telefone` decimal(12,0) DEFAULT NULL,
  `idPessoaCliente` int(11) DEFAULT NULL,
  `idPessoaFuncionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `idProduto` int(11) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `valor_produto` double(4,2) DEFAULT NULL,
  `peso` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `data` date NOT NULL,
  `horario` time NOT NULL,
  `qtd_pessoas` int(11) NOT NULL,
  `qtd_mesas` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `data`, `horario`, `qtd_pessoas`, `qtd_mesas`, `id_usuario`) VALUES
(1, '2018-09-27', '15:00:00', 6, 2, 1),
(10, '0000-00-00', '09:00:00', 10, 4, 51),
(17, '2018-10-23', '09:00:00', 5, 2, 63),
(18, '2018-10-05', '18:00:00', 12, 5, 64),
(19, '2018-10-28', '18:00:00', 9, 4, 65),
(20, '2018-10-05', '15:00:00', 1, 2, 2),
(21, '2018-10-04', '09:00:00', 1, 1, 66),
(22, '2018-10-28', '18:00:00', 12, 5, 67),
(23, '2018-10-28', '18:00:00', 10, 4, 68),
(24, '2018-10-28', '18:00:00', 10, 4, 69),
(25, '2018-10-28', '18:00:00', 5, 2, 70),
(26, '2018-10-28', '18:00:00', 5, 2, 71),
(27, '2018-10-28', '18:00:00', 5, 2, 72),
(28, '2018-10-28', '18:00:00', 11, 5, 73),
(29, '2018-10-28', '18:00:00', 11, 5, 74),
(30, '2018-10-28', '16:00:00', 1, 1, 75),
(31, '2018-10-28', '16:00:00', 12, 5, 76),
(32, '2018-10-28', '16:00:00', 12, 5, 77),
(33, '2018-10-28', '16:00:00', 1, 1, 78),
(34, '2018-10-28', '16:00:00', 6, 2, 79),
(35, '2018-10-04', '16:00:00', 12, 5, 80),
(36, '2018-10-04', '16:00:00', 12, 5, 81),
(37, '2018-10-04', '16:00:00', 12, 5, 82),
(38, '2018-10-16', '15:00:00', 1, 1, 83),
(39, '2018-10-16', '15:00:00', 12, 5, 84),
(40, '2018-10-16', '15:00:00', 12, 5, 85),
(41, '2018-10-25', '09:00:00', 1, 1, 86),
(42, '2018-10-25', '09:00:00', 1, 1, 87),
(43, '2018-10-25', '09:00:00', 4, 1, 88),
(44, '2018-10-25', '09:00:00', 4, 1, 89),
(45, '2018-10-25', '09:00:00', 4, 1, 90),
(46, '2018-10-25', '09:00:00', 4, 1, 91),
(47, '2018-10-25', '09:00:00', 10, 4, 92),
(48, '2018-10-25', '09:00:00', 10, 4, 93);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `telefone`) VALUES
(1, 'Teste Inicial', 'teste@teste.com', '+5561986532611'),
(2, 'Meu nome Teste 2', 'meuteste2@teste.com', '+556145678945'),
(39, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(64, 'Nickael Bruzzi', 'qaznickael@protonmail.com', '6140028922'),
(65, 'alguem', 'qaznickael@protonmail.com', '665765765'),
(66, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(67, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(68, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(69, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(70, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(71, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(72, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(73, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(74, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(75, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(76, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(77, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(78, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(79, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(80, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(81, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(82, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(83, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(84, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(85, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(86, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(87, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(88, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(89, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(90, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(91, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(92, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739'),
(93, 'Igor Lisboa Assis', 'igorlisboa34@gmail.com', '6181440739');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `idVenda` int(11) NOT NULL,
  `valor_unidade` double(4,2) DEFAULT NULL,
  `valor_total` double(4,2) DEFAULT NULL,
  `idVendaFuncionario` int(11) DEFAULT NULL,
  `idVendaPedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `idCliente_UNIQUE` (`idCliente`);

--
-- Indexes for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`idEndereco`),
  ADD UNIQUE KEY `idEndereco_UNIQUE` (`idEndereco`),
  ADD KEY `idEnderecoPessoa_idx` (`idEnderecoPessoa`);

--
-- Indexes for table `estoques`
--
ALTER TABLE `estoques`
  ADD PRIMARY KEY (`idEstoque`),
  ADD UNIQUE KEY `idEstoque_UNIQUE` (`idEstoque`),
  ADD KEY `idEstoqueProduto_idx` (`idEstoqueProduto`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`idFuncionario`),
  ADD UNIQUE KEY `idFuncionario_UNIQUE` (`idFuncionario`);

--
-- Indexes for table `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`cod_mesa`);

--
-- Indexes for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`idPagamento`),
  ADD UNIQUE KEY `idPagamento_UNIQUE` (`idPagamento`),
  ADD KEY `idPagamentoVenda_idx` (`idPagamentoVenda`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedidos`),
  ADD UNIQUE KEY `idPedidos_UNIQUE` (`idPedidos`),
  ADD KEY `idPedidoCliente_idx` (`idPedidoCliente`),
  ADD KEY `idPedidoProduto_idx` (`idPedidoProduto`);

--
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`idPessoa`),
  ADD UNIQUE KEY `idPessoa_UNIQUE` (`idPessoa`),
  ADD KEY `idPessoaCliente_idx` (`idPessoaCliente`),
  ADD KEY `idPessoaFuncionario_idx` (`idPessoaFuncionario`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idProduto`),
  ADD UNIQUE KEY `idProduto_UNIQUE` (`idProduto`);

--
-- Indexes for table `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`idVenda`),
  ADD UNIQUE KEY `idVenda_UNIQUE` (`idVenda`),
  ADD KEY `idVendaFuncionario_idx` (`idVendaFuncionario`),
  ADD KEY `idVendaPedido_idx` (`idVendaPedido`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `idEndereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estoques`
--
ALTER TABLE `estoques`
  MODIFY `idEstoque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `idFuncionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mesa`
--
ALTER TABLE `mesa`
  MODIFY `cod_mesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `idPagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedidos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `idPessoa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `vendas`
--
ALTER TABLE `vendas`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `idEnderecoPessoa` FOREIGN KEY (`idEnderecoPessoa`) REFERENCES `pessoas` (`idPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `estoques`
--
ALTER TABLE `estoques`
  ADD CONSTRAINT `idEstoqueProduto` FOREIGN KEY (`idEstoqueProduto`) REFERENCES `produtos` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `idPagamentoVenda` FOREIGN KEY (`idPagamentoVenda`) REFERENCES `vendas` (`idVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `idPedidoCliente` FOREIGN KEY (`idPedidoCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idPedidoProduto` FOREIGN KEY (`idPedidoProduto`) REFERENCES `produtos` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pessoas`
--
ALTER TABLE `pessoas`
  ADD CONSTRAINT `idPessoaCliente` FOREIGN KEY (`idPessoaCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idPessoaFuncionario` FOREIGN KEY (`idPessoaFuncionario`) REFERENCES `funcionarios` (`idFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `idVendaFuncionario` FOREIGN KEY (`idVendaFuncionario`) REFERENCES `funcionarios` (`idFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idVendaPedido` FOREIGN KEY (`idVendaPedido`) REFERENCES `pedidos` (`idPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
