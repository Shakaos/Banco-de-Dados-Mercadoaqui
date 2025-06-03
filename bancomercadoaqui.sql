-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/06/2025 às 21:23
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mercadoaqui`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `comparacoes`
--

CREATE TABLE `comparacoes` (
  `id` int(11) NOT NULL,
  `lista_id` int(11) NOT NULL,
  `mercado_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `criado_em` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_comparacoes`
--

CREATE TABLE `historico_comparacoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `lista_id` int(11) NOT NULL,
  `mercado_mais_barato` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `data_hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_lista`
--

CREATE TABLE `itens_lista` (
  `id` int(11) NOT NULL,
  `lista_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `listas`
--

CREATE TABLE `listas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `criado_em` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mercados`
--

CREATE TABLE `mercados` (
  `id` int(11) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mercados`
--

INSERT INTO `mercados` (`id`, `endereco`, `nome`) VALUES
(1, 'Rua A, 123', ''),
(2, 'Av. Brasil, 456', ''),
(3, 'Travessa das Flores, 789', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `precos`
--

CREATE TABLE `precos` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `mercado_id` int(11) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `precos`
--

INSERT INTO `precos` (`id`, `produto_id`, `mercado_id`, `preco`, `atualizado_em`) VALUES
(1, 1, 1, 29.90, '2025-06-03 16:17:00'),
(2, 1, 2, 30.49, '2025-06-03 16:17:00'),
(3, 1, 3, 28.70, '2025-06-03 16:17:00'),
(4, 2, 1, 8.50, '2025-06-03 16:17:00'),
(5, 2, 2, 7.90, '2025-06-03 16:17:00'),
(6, 2, 3, 9.10, '2025-06-03 16:17:00'),
(7, 3, 1, 5.49, '2025-06-03 16:17:00'),
(8, 3, 2, 6.00, '2025-06-03 16:17:00'),
(9, 3, 3, 5.80, '2025-06-03 16:17:00'),
(10, 4, 1, 7.89, '2025-06-03 16:17:00'),
(11, 4, 2, 8.10, '2025-06-03 16:17:00'),
(12, 4, 3, 7.75, '2025-06-03 16:17:00'),
(13, 5, 1, 6.90, '2025-06-03 16:17:00'),
(14, 5, 2, 7.20, '2025-06-03 16:17:00'),
(15, 5, 3, 6.50, '2025-06-03 16:17:00'),
(16, 6, 1, 3.40, '2025-06-03 16:17:00'),
(17, 6, 2, 3.60, '2025-06-03 16:17:00'),
(18, 6, 3, 3.30, '2025-06-03 16:17:00'),
(19, 7, 1, 6.99, '2025-06-03 16:17:00'),
(20, 7, 2, 7.20, '2025-06-03 16:17:00'),
(21, 7, 3, 6.80, '2025-06-03 16:17:00'),
(22, 8, 1, 5.90, '2025-06-03 16:17:00'),
(23, 8, 2, 6.00, '2025-06-03 16:17:00'),
(24, 8, 3, 5.80, '2025-06-03 16:17:00'),
(25, 9, 1, 4.99, '2025-06-03 16:17:00'),
(26, 9, 2, 5.10, '2025-06-03 16:17:00'),
(27, 9, 3, 4.89, '2025-06-03 16:17:00'),
(28, 10, 1, 3.49, '2025-06-03 16:17:00'),
(29, 10, 2, 3.60, '2025-06-03 16:17:00'),
(30, 10, 3, 3.30, '2025-06-03 16:17:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `categoria`, `tipo`) VALUES
(1, '', '', NULL),
(2, '', '', NULL),
(3, '', '', NULL),
(4, '', '', NULL),
(5, '', '', NULL),
(6, '', '', NULL),
(7, '', '', NULL),
(8, '', '', NULL),
(9, '', '', NULL),
(10, '', '', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL DEFAULT 'cliente',
  `criado_em` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `primeiro_acesso` tinyint(1) NOT NULL DEFAULT 0,
  `config_inicial_completa` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estrutura para tabela `configuracao_sistema`
--

CREATE TABLE `configuracao_sistema` (
  `id` int(11) NOT NULL,
  `chave` varchar(50) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `comparacoes`
--
ALTER TABLE `comparacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lista_id` (`lista_id`),
  ADD KEY `mercado_id` (`mercado_id`);

--
-- Índices de tabela `historico_comparacoes`
--
ALTER TABLE `historico_comparacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `lista_id` (`lista_id`),
  ADD KEY `mercado_mais_barato` (`mercado_mais_barato`);

--
-- Índices de tabela `itens_lista`
--
ALTER TABLE `itens_lista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lista_id` (`lista_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `listas`
--
ALTER TABLE `listas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `mercados`
--
ALTER TABLE `mercados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `precos`
--
ALTER TABLE `precos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_fbd4ae89cf3b2897eba7f13261e` (`produto_id`),
  ADD KEY `FK_f08eb80c2ad16291399c0a403c2` (`mercado_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_446adfc18b35418aac32ae0b7b` (`email`);

--
-- Índices de tabela `configuracao_sistema`
--
ALTER TABLE `configuracao_sistema`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_chave` (`chave`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comparacoes`
--
ALTER TABLE `comparacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historico_comparacoes`
--
ALTER TABLE `historico_comparacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itens_lista`
--
ALTER TABLE `itens_lista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `listas`
--
ALTER TABLE `listas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mercados`
--
ALTER TABLE `mercados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `precos`
--
ALTER TABLE `precos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `configuracao_sistema`
--
ALTER TABLE `configuracao_sistema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `comparacoes`
--
ALTER TABLE `comparacoes`
  ADD CONSTRAINT `comparacoes_ibfk_1` FOREIGN KEY (`lista_id`) REFERENCES `listas` (`id`),
  ADD CONSTRAINT `comparacoes_ibfk_2` FOREIGN KEY (`mercado_id`) REFERENCES `mercados` (`id`);

--
-- Restrições para tabelas `historico_comparacoes`
--
ALTER TABLE `historico_comparacoes`
  ADD CONSTRAINT `historico_comparacoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `historico_comparacoes_ibfk_2` FOREIGN KEY (`lista_id`) REFERENCES `listas` (`id`),
  ADD CONSTRAINT `historico_comparacoes_ibfk_3` FOREIGN KEY (`mercado_mais_barato`) REFERENCES `mercados` (`id`);

--
-- Restrições para tabelas `itens_lista`
--
ALTER TABLE `itens_lista`
  ADD CONSTRAINT `itens_lista_ibfk_1` FOREIGN KEY (`lista_id`) REFERENCES `listas` (`id`),
  ADD CONSTRAINT `itens_lista_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `listas`
--
ALTER TABLE `listas`
  ADD CONSTRAINT `listas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `precos`
--
ALTER TABLE `precos`
  ADD CONSTRAINT `FK_f08eb80c2ad16291399c0a403c2` FOREIGN KEY (`mercado_id`) REFERENCES `mercados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_fbd4ae89cf3b2897eba7f13261e` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Insert into configuracao_sistema for initial setup flag
--
INSERT INTO `configuracao_sistema` (`chave`, `valor`, `descricao`) VALUES
('configuracao_inicial_completa', '0', 'Flag indicando se a configuração inicial do sistema foi concluída');

--
-- Insert admin user with temp credentials that require initial setup
--
INSERT INTO `usuarios` (`id`, `senha`, `nome`, `email`, `tipo`, `criado_em`, `primeiro_acesso`, `config_inicial_completa`) VALUES
(1, '$2b$10$E6.UYoEamNlAfYNHY.VNzOBdhj2lZt3GJqX.UcJTdHTR8q5/y8yba', 'Administrador Temporário', 'setup@mercadoaqui.temp', 'admin', '2025-06-03 16:10:27.725814', 1, 0);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;