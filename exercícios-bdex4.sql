USE BDEX4_ESTOQUE;

#1. Exibir todas as informações da tabela `PRODUTOS`.
SELECT * FROM  PRODUTOS;

#2. Mostrar os nomes e preços dos produtos que custam mais de 50,00.
SELECT PRECO FROM PRODUTOS;

#3. Listar os nomes e cidades dos fornecedores.
SELECT NOME_FOR, CIDADE FROM FORNECEDORES;

#4. Exibir os detalhes dos pedidos de compra: ID do pedido, data, hora e nome do fornecedor.
SELECT 
	pc.ID_PEDIDO, pc.DATA_PEDIDO, pc.HORA_PEDIDO, forn.nome_for
FROM 
	PEDIDOS_COMPRA pc
JOIN
	fornecedores forn ON forn.id_fornecedor = pc.fornecedor;

#5. Listar o nome dos produtos e a quantidade disponível em cada armazém.
SELECT 
	pd.nome_pro, pa.quantidade, arm.nome_armazem
FROM 
	produtos pd
JOIN 
    produtos_armazens pa ON pd.id_produto = pa.produto
JOIN
	armazens arm ON pa.armazem = arm.id_armazem;

#6. Mostrar os nomes dos fornecedores que têm produtos no armazém de "São Paulo".
SELECT
	forn.nome_for
FROM
	fornecedores forn
JOIN
	produtos_fornecedores pf ON pf.fornecedor = forn.id_fornecedor
JOIN 
	produtos prod ON pf.produto = prod.id_produto
JOIN
	produtos_armazens pa ON pa.produto = prod.id_produto
JOIN
	armazens arm ON arm.id_armazem = pa.produto;

#7. Listar todos os armazéns, ordenados pelo nome do armazém de A a Z.

#8. Mostrar os nomes dos produtos que têm a palavra "Premium" na descrição.

#9. Exibir os detalhes dos produtos: ID do produto, nome, descrição, preço e nome dos fornecedores.

#10. Para cada pedido de compra, mostrar o ID do pedido e a quantidade total de produtos solicitados.

#11. Contar quantos produtos cada fornecedor oferece.

#12. Listar os nomes dos produtos e a quantidade disponível no armazém "Rio de Janeiro".

#13. Mostrar o nome dos fornecedores e a data e hora do último pedido de compra que eles receberam.

#14. Contar quantos pedidos de compra cada fornecedor recebeu.

#15. Para cada armazém, exibir o nome do armazém e a quantidade total de produtos armazenados nele.
