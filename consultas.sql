use db_ecommerce;

show tables;

desc cliente;
-- id_cliente nome sobrenome cpf
select  * from cliente;
desc pedido;
-- id_pedido id_cliente id_entrega
desc relacao_produto_pedido;
-- id_produto id_pedido
-- produto
desc produto;
-- id_produto nome_produto valor categoria
desc entrega;
-- id_entrega
select  * from pedido;

select 
	concat(c.nome, ' ',c.sobrenome) as nome_completo, 
    cpf,
    pr.nome_produto,
    quantidade,
    status_entrega,
	codigo_rastreio as codigo
from cliente c
inner join pedido p on p.id_cliente = c.id_cliente
inner join relacao_produto_pedido rpp on rpp.id_pedido = p.id_pedido
inner join produto pr on pr.id_produto = rpp.id_produto
inner join entrega e on e.id_entrega = p.id_entrega
-- where e.status_entrega = 'entregue'
order by c.id_cliente, p.id_pedido;

SELECT 
    pr.nome_produto, 
    pr.valor, 
    pr.categoria,
    f.razao_social as fornecedor, 
    f.cnpj,
    ep.id_estoque,
    e.secao as local_estoque
FROM produto pr
JOIN produto_fornecedor pf ON pr.id_produto = pf.id_produto
JOIN fornecedor f ON pf.id_fornecedor = f.id_fornecedor
JOIN estoque_produto ep ON pr.id_produto = ep.id_produto
JOIN estoque e ON ep.id_estoque = e.id_estoque
ORDER BY pr.nome_produto;

SELECT 
    pr.id_produto,
    pr.nome_produto, 
    pr.valor, 
    pr.categoria,
    pr.descricao,
    pr.avaliacao,
    f.razao_social as fornecedor,
    f.cnpj,
    e.secao as local_estoque,
    vt.razao_social as vendedor_terceiro,
    pv.quantidade as quantidade_vendedor
FROM produto pr
LEFT JOIN produto_fornecedor pf ON pr.id_produto = pf.id_produto
LEFT JOIN fornecedor f ON pf.id_fornecedor = f.id_fornecedor
LEFT JOIN estoque_produto ep ON pr.id_produto = ep.id_produto
LEFT JOIN estoque e ON ep.id_estoque = e.id_estoque
LEFT JOIN produtos_vendedor pv ON pr.id_produto = pv.id_produto
LEFT JOIN vendedor_terceiro vt ON pv.id_terceiro_vendedor = vt.id_terceiro_vendedor
ORDER BY pr.nome_produto;

SELECT 
    pr.nome_produto, 
    pr.valor, 
    pr.categoria,
    f.razao_social as fornecedor,
    e.secao as estoque
FROM produto pr
JOIN produto_fornecedor pf ON pr.id_produto = pf.id_produto
JOIN fornecedor f ON pf.id_fornecedor = f.id_fornecedor
JOIN estoque_produto ep ON pr.id_produto = ep.id_produto
JOIN estoque e ON ep.id_estoque = e.id_estoque
WHERE pr.categoria = 'eletronico'  -- Filtro por categoria
AND pr.valor > 1000  -- Filtro por valor
ORDER BY pr.valor DESC;
