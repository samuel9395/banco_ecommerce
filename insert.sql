-- 1. PRIMEIRO: Inserir dados na tabela pagamento (não depende de ninguém)
INSERT INTO pagamento (forma_pagamento) VALUES
('pix'),
('credito'),
('debito'),
('boleto'),
('credito'),
('pix'),
('debito'),
('boleto');
-- 2. SEGUNDO: Inserir dados na tabela entrega (não depende de ninguém)
INSERT INTO entrega (status_entrega, codigo_rastreio) VALUES
('processando', 'BR123456789'),
('a caminho', 'BR987654321'),
('entregue', 'BR111222333'),
('processando', 'BR444555666'),
('a caminho', 'BR777888999'),
('entregue', 'BR000111222'),
('processando', 'BR333444555'),
('a caminho', 'BR666777888');
-- 3. TERCEIRO: Inserir dados na tabela cliente (depende apenas de pagamento)
INSERT INTO cliente (nome, sobrenome, data_nascimento, cpf, endereco, tipo_cliente, id_pagamento) VALUES
('João', 'Silva', '1990-05-15', '12345678901', 'Rua A, 100', 'pessoa_fisica', 1),
('Maria', 'Santos', '1985-08-20', '23456789012', 'Rua B, 200', 'pessoa_fisica', 2),
('Carlos', 'Oliveira', '1978-03-10', '34567890123', 'Rua C, 300', 'pessoa_fisica', 3),
('Ana', 'Costa', '1995-11-25', '45678901234', 'Rua D, 400', 'pessoa_fisica', 4),
('Empresa', 'Tech Ltda', NULL, '98765432000198', 'Av. Principal, 500', 'pessoa_juridica', 5),
('Pedro', 'Rocha', '1988-07-30', '56789012345', 'Rua E, 600', 'pessoa_fisica', 6),
('Julia', 'Fernandes', '1992-02-14', '67890123456', 'Rua F, 700', 'pessoa_fisica', 7),
('Roberto', 'Alves', '1975-12-05', '78901234567', 'Rua G, 800', 'pessoa_fisica', 8);
-- 4. QUARTO: Inserir dados na tabela produto (não depende de ninguém)
INSERT INTO produto (nome_produto, categoria, descricao, valor, avaliacao, size) VALUES
('Smartphone X', 'eletronico', 'Celular top de linha', 2999.99, 5, 'M'),
('Notebook Pro', 'eletronico', 'Notebook para trabalho', 4500.00, 4, 'L'),
('Camisa Social', 'vestuario', 'Camisa de algodão', 89.90, 4, 'G'),
('Bermuda Jeans', 'vestuario', 'Bermuda masculina', 129.90, 5, 'M'),
('Carrinho de Bebê', 'infantil', 'Carrinho com acessórios', 799.90, 4, 'XL'),
('Leite em Pó', 'alimentos', 'Leite para bebês', 45.90, 5, 'P'),
('Sofá 3 Lugares', 'móveis', 'Sofá retrátil', 1899.90, 4, 'XXL'),
('Mesa de Jantar', 'móveis', 'Mesa 6 lugares', 1200.00, 5, 'XL'),
('Fone Bluetooth', 'eletronico', 'Fone sem fio', 199.90, 4, 'P'),
('Vestido Floral', 'vestuario', 'Vestido feminino', 159.90, 5, 'M'),
('Brinquedo Educativo', 'infantil', 'Brinquedo pedagógico', 89.90, 4, 'M'),
('Café Gourmet', 'alimentos', 'Café especial 500g', 34.90, 5, 'P');
-- 5. QUINTO: Inserir dados na tabela pedido (depende de cliente e entrega)
INSERT INTO pedido (status_pedido, descricao, id_cliente, frete, id_entrega) VALUES
('confirmado', 'Pedido de eletrônicos', 1, 15.00, 1),
('processando', 'Roupas e acessórios', 2, 10.00, 2),
('confirmado', 'Móveis para casa', 3, 50.00, 3),
('confirmado', 'Produtos infantis', 4, 12.50, 4),
('cancelado', 'Eletrodomésticos', 5, 0.00, 5),
('processando', 'Alimentos diversos', 6, 8.00, 6),
('confirmado', 'Vestuário completo', 7, 10.00, 7),
('confirmado', 'Presentes', 8, 15.00, 8);
-- 6. SEXTO: Inserir dados na tabela relacao_produto_pedido (depende de produto e pedido)
INSERT INTO relacao_produto_pedido (id_produto, id_pedido, quantidade, status) VALUES
(1, 1, 1, 'disponivel'),
(2, 1, 1, 'disponivel'),
(3, 2, 2, 'disponivel'),
(4, 2, 1, 'disponivel'),
(7, 3, 1, 'disponivel'),
(8, 3, 1, 'disponivel'),
(5, 4, 1, 'disponivel'),
(6, 4, 3, 'disponivel'),
(9, 5, 2, 'sem estoque'),
(10, 6, 1, 'disponivel'),
(11, 7, 1, 'disponivel'),
(12, 8, 2, 'disponivel'),
(1, 6, 1, 'disponivel'),
(3, 7, 3, 'disponivel');
-- 7. SÉTIMO: Inserir dados na tabela vendedor_terceiro (não depende de ninguém)
INSERT INTO vendedor_terceiro (razao_social, local, nome_fantasia, endereco) VALUES
('Tech Import Ltda', 'São Paulo', 'Tech Import', 'Av. Paulista, 1000'),
('Moda Fashion ME', 'Rio de Janeiro', 'Fashion Store', 'Rua do Ouvidor, 50'),
('Casa & Decoração', 'Belo Horizonte', 'Casa Decor', 'Av. Afonso Pena, 2000'),
('Infantil Kids', 'Porto Alegre', 'Kids World', 'Rua da Praia, 300'),
('Super Alimentos', 'Curitiba', 'Alimentos Naturais', 'Rua XV de Novembro, 400'),
('Eletro Shop', 'Brasília', 'Eletro Center', 'SQS 102, Bloco A');
-- 8. OITAVO: Inserir dados na tabela produtos_vendedor (depende de vendedor_terceiro e produto)
INSERT INTO produtos_vendedor (id_terceiro_vendedor, id_produto, quantidade) VALUES
(1, 1, 10),
(1, 2, 5),
(1, 9, 20),
(2, 3, 30),
(2, 4, 25),
(2, 10, 15),
(3, 7, 8),
(3, 8, 6),
(4, 5, 12),
(4, 11, 40),
(5, 6, 100),
(5, 12, 200),
(6, 1, 15),
(6, 2, 10),
(6, 9, 25);
-- 9. NONO: Inserir dados na tabela fornecedor (não depende de ninguém)
INSERT INTO fornecedor (razao_social, cnpj) VALUES
('Fornecedor Eletrônicos SA', '12345678000191'),
('Têxtil Nacional Ltda', '23456789000192'),
('Indústria Móveis Brasil', '34567890000193'),
('Alimentos Premium ME', '45678901000194'),
('Importadora Infantil', '56789012000195'),
('Distribuidora Geral', '67890123000196');
-- 10. DÉCIMO: Inserir dados na tabela produto_fornecedor (depende de fornecedor e produto)
INSERT INTO produto_fornecedor (id_fornecedor, id_produto) VALUES
(1, 1),
(1, 2),
(1, 9),
(2, 3),
(2, 4),
(2, 10),
(3, 7),
(3, 8),
(4, 6),
(4, 12),
(5, 5),
(5, 11),
(6, 1),
(6, 3),
(6, 6),
(6, 7);
-- 11. DÉCIMO PRIMEIRO: Inserir dados na tabela estoque (não depende de ninguém)
INSERT INTO estoque (secao) VALUES
('Eletrônicos'),
('Vestuário'),
('Infantil'),
('Alimentos'),
('Móveis'),
('Promoções'),
('Novidades'),
('Atacado');
-- 12. DÉCIMO SEGUNDO: Inserir dados na tabela estoque_produto (depende de produto e estoque)
INSERT INTO estoque_produto (id_produto, id_estoque) VALUES
(1, 1),
(2, 1),
(9, 1),
(3, 2),
(4, 2),
(10, 2),
(5, 3),
(11, 3),
(6, 4),
(12, 4),
(7, 5),
(8, 5),
(1, 6),
(3, 6),
(6, 6),
(9, 7),
(10, 7),
(11, 7),
(6, 8),
(12, 8);
