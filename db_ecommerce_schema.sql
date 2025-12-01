-- criando o banco de dados para o cenario de e-commerce --
create database db_ecommerce;
use db_ecommerce;

-- criando tabelas --
-- pagamento
CREATE TABLE pagamento (
  id_pagamento INT NOT NULL AUTO_INCREMENT,
  forma_pagamento ENUM("pix", "credito", "debito", "boleto"),
  PRIMARY KEY (`id_pagamento`)
);
-- cliente
create table cliente (
	id_cliente int auto_increment primary key,
    nome varchar(20),
    sobrenome varchar(45),
    data_nascimento date,
    cpf char(11) not null,
    endereco varchar(45),
    tipo_cliente enum("pessoa_fisica", "pessoa_juridica") default "pessoa_fisica",
    id_pagamento INT NOT NULL,
    constraint unique_cpf_cliente unique (cpf),
    constraint fk_pagamento foreign key (id_pagamento) references pagamento(id_pagamento)
);
-- entrega
CREATE TABLE entrega (
	id_entrega INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	status_entrega ENUM("processando", "a caminho", "entregue") default "processando",
	codigo_rastreio VARCHAR(45) NOT NULL
);
-- pedido
CREATE TABLE `pedido` (
	`id_pedido` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`status_pedido` ENUM("processando", "confirmado", "cancelado") NOT NULL DEFAULT 'processando',
	`descricao` VARCHAR(45) NOT NULL,
	`id_cliente` INT NOT NULL,
	`frete` FLOAT DEFAULT 10,
	`id_entrega` INT NOT NULL,
	constraint fk_pedido_cliente foreign key (id_cliente) references cliente(id_cliente),
	constraint fk_pedido_entrega foreign key (id_entrega) references entrega(id_entrega)
);
-- produto
-- size  = dimensão do produto
create table produto (
	id_produto int primary key auto_increment, 
    nome_produto varchar(45) not null,
	categoria enum('eletronico', 'vestuario', 'infantil', 'alimentos', 'móveis') not null, 
	descricao varchar(45), 
	valor decimal(10,2), 
    avaliacao int default 0,
    size varchar(10)
);
-- relação produto_pedido
CREATE TABLE IF NOT EXISTS `relacao_produto_pedido` (
  `id_produto` INT NOT NULL,
  `id_pedido` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `status` ENUM("disponivel", "sem estoque") NOT NULL DEFAULT 'disponivel',
  PRIMARY KEY (`id_produto`, `id_pedido`),
  CONSTRAINT `fk_produto_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido`(`id_pedido`),
  CONSTRAINT `fk_Pedido_has_Produto_Produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto`(`id_produto`)
);
-- terceiro vendedor
CREATE TABLE IF NOT EXISTS `vendedor_terceiro` (
	`id_terceiro_vendedor` INT NOT NULL AUTO_INCREMENT,
	`razao_social` VARCHAR(45) NOT NULL,
	`local` VARCHAR(45) NOT NULL,
	`nome_fantasia` VARCHAR(45) NULL,
	`endereco` VARCHAR(45) NULL,
	PRIMARY KEY (`id_terceiro_vendedor`),
	CONSTRAINT `razao_social_UNIQUE` UNIQUE (`razao_social`)
);
-- produto por venderdor
create table produtos_vendedor(
	id_terceiro_vendedor int not null,
    id_produto int not null,
    quantidade int,
    primary key (id_terceiro_vendedor, id_produto),
    constraint fk_id_terceiro_vendedor foreign key (id_terceiro_vendedor) references vendedor_terceiro(id_terceiro_vendedor),
    constraint fk_id_produto foreign key (id_produto) references produto(id_produto)
);
-- fornecedor 
create table fornecedor(
	id_fornecedor int not null primary key auto_increment,
    razao_social varchar(45),
    cnpj varchar(45),
    constraint razao_social_unique unique (razao_social)
);
-- disponibiliza produto
create table produto_fornecedor(
	id_fornecedor int not null,
    id_produto int not null,
    primary key (id_fornecedor, id_produto),
    constraint fk_id_fornecedor foreign key (id_fornecedor) references fornecedor(id_fornecedor),
    constraint fk_id_produto_fornecedor foreign key (id_produto) references produto(id_produto)
);
-- estoque
create table estoque(
	id_estoque int not null primary key auto_increment,
    secao varchar(45)
);
-- estoque_produto
create table estoque_produto(
	id_produto int not null,
    id_estoque int not null,
    primary key (id_produto, id_estoque),
    constraint fk_id_produto_estoque foreign key (id_produto) references produto(id_produto),
    constraint fk_id_estoque foreign key (id_estoque) references estoque(id_estoque)
);

