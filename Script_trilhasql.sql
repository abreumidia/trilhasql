-- Aula 2 - Desafio 1: Mostrar apenas nome e preço dos produtos


-- Aula 2 - Desafio 2: Mostrar apenas nome, email e cidade dos clientes

SELECT *
FROM clientes


-- Aula 3 - Desafio 1: Renomear colunas para nomes mais amigáveis
-- Selecione nome, preco e estoque com aliases "Nome do Produto", "Preço (R$)" e "Quantidade em Estoque"




SELECT
nome AS "Nome do Produto",
preco AS "Preço (R$)",
estoque AS "Quantidade em Estoque"
FROM produtos


-- Aula 3 - Desafio 2: Criar um relatório de pedidos
-- Selecione data_pedido, valor_total e status com aliases "Data da Compra", "Valor Total (R$)" e "Status do Pedido"
SELECT 
data_pedido AS "Data da Compra",
valor_total AS "Valor Total (R$)",
status AS "Status do Pedido"
FROM pedidos

-- Aula 4 - Desafio 1: Listar todas as cidades únicas dos clientes

SELECT DISTINCT cidade
FROM clientes;


-- Aula 4 - Desafio 2: Listar todas as marcas únicas de produtos

SELECT DISTINCT marca
FROM produtos ;


-- Aula 5 - Desafio 1: Mostrar uma amostra de 5 produtos (todas as colunas)

SELECT *
FROM produtos
LIMIT 5;

-- Aula 5 - Desafio 2: Mostrar apenas 3 clientes, exibindo nome e email

SELECT nome, email
FROM clientes 
LIMIT 3;

-- Aula 6 - Desafio 1: Listar produtos ordenados por preço do mais barato ao mais caro

SELECT *
FROM produtos
ORDER BY preco ASC;

-- Aula 6 - Desafio 2: Listar os 10 últimos pagamentos

SELECT *
FROM pagamentos
ORDER BY data_pagamento DESC
LIMIT 10;


-- Aula 7 - Desafio 1: Mostrar apenas pedidos em separação
SELECT *
FROM pedidos 
WHERE status = 'em_separacao' ;

-- Aula 7 - Desafio 2: Mostrar as últimas 5 avaliações nota 1
SELECT *
FROM avaliacoes 
WHERE nota = 1
ORDER BY data_avaliacao DESC 
LIMIT 5;

-- Aula 8 - Desafio 1: Produtos com preço maior que R$ 500
SELECT *
FROM produtos 
WHERE preco > 500;

-- Aula 8 - Desafio 2: Produtos com estoque menor que 20 unidades

SELECT *
FROM produtos
WHERE estoque < 20;



-- Aula 9 - Desafio 1: Pedidos com status diferente de "Entregue"

SELECT *
FROM pedidos
WHERE status <> 'entregue'; 

-- Aula 9 - Desafio 2: Listar as avaliações sem comentários
SELECT * 
FROM avaliacoes 
WHERE comentario <> 

-- Aula 10 - Desafio 1: Produtos da marca "Samsung" com preço maior que R$ 1000
SELECT *
FROM produtos
WHERE marca = 'Samsung'
AND preco > 1000;


-- Aula 10 - Desafio 2: Pedidos entregues que possuem data de entrega registrada

SELECT *
FROM pedidos 
WHERE status = 'entregue'
AND data_entrega_realizada IS NOT NULL


-- Aula 11 - Desafio 1: Produtos premium de marcas específicas
-- Encontre produtos que sejam: marca "Samsung" OU marca "Sony" E preço maior que 2000
-- Traga somente as colunas necessárias

SELECT nome, marca , preco
FROM produtos
WHERE marca = 'Samsung'
OR marca = 'Sony'
AND preco > 2000

-- Aula 11 - Desafio 2: Pagamentos problemáticos
-- Encontre pagamentos que sejam  Pix ou boleto e não tenham sido aprovados
-- Traga somente as colunas necessárias

SELECT pagamento_id, metodo, status
FROM pagamentos
WHERE metodo = 'pix'
OR metodo = 'pagamento'
AND status <> 'aprovado'













-- Desafio Final 1: Catálogo de Produtos Premium
-- Liste nome, marca e preço dos produtos com preço maior que R$ 2000
-- Ordene do mais caro para o mais barato
-- Renomeie as colunas para "Produto", "Fabricante" e "Valor (R$)"

SELECT
    nome AS "Produto",
    marca AS "Fabricante",
    preco AS "Valor R$"
FROM produtos
WHERE preco > 2000
ORDER BY preco ASC;

-- Desafio Final 2: Análise de Estoque Crítico
-- Encontre produtos com estoque menor que 50 unidades OU preço menor que R$ 200
-- Mostre nome, estoque e preço, ordenados por estoque (menor primeiro)
-- Limite a 10 resultados

SELECT nome, estoque, preco
FROM produtos
WHERE estoque < 50 OR preco < 200
ORDER BY estoque ASC
LIMIT 10;


-- Desafio Final 3: Clientes por Região
-- Liste todos os estados únicos onde há clientes cadastrados
-- Ordene em ordem alfabética
SELECT DISTINCT estado
FROM clientes
ORDER BY estado ASC;

-- Desafio Final 4: Relatório de Pedidos
-- Mostre os 15 pedidos mais recentes com status "entregue"
-- Exiba data_pedido (como "Data"), valor_total (como "Total") e status
-- Ordene pela data mais recente primeiro
SELECT data_pedido AS "Data", 
       valor_total AS "Total", 
       status
FROM pedidos
WHERE status = 'entregue'
ORDER BY data_pedido DESC
LIMIT 15;

-- Desafio Final 5: Produtos em Destaque (Desafio Avançado)
-- Encontre produtos que sejam:
-- (marca "Samsung" E preço > 1000) OU (marca "Sony" E estoque > 100)
-- Mostre nome, marca, preço e estoque
-- Ordene por preço decrescente
SELECT nome, marca, preco, estoque
FROM produtos
WHERE (marca = 'Samsung' AND preco > 1000)
   OR (marca = 'Sony' AND estoque > 100)
ORDER BY preco DESC;


-- Desafio Final 6: Análise de Avaliações
-- Liste as 10 piores avaliações (nota = 1 ou nota = 2)
-- Mostre nota (como "Estrelas") e comentario (como "Feedback")
-- Ordene pela nota (menor primeiro)
SELECT nota AS "Estrelas", 
       comentario AS "Feedback"
FROM avaliacoes
WHERE nota IN (1, 2)
ORDER BY nota ASC
LIMIT 10;

-- Desafio Final 7: Pagamentos Pendentes
-- Encontre pagamentos com status diferente de "aprovado"
-- Mostre metodo (como "Forma de Pagamento"), valor e status
-- Ordene pelo valor (maior primeiro), limitado a 20 resultados
SELECT metodo AS "Forma de Pagamento", 
       valor, 
       status
FROM pagamentos
WHERE status <> 'aprovado'
ORDER BY valor DESC
LIMIT 20;


-- Desafio Final 8: Relatório Completo (Boss Final!)
-- Crie uma consulta que mostre:
-- - Nome do produto (como "Produto")
-- - Marca (como "Fabricante")
-- - Preço (como "Preço (R$)")
-- - Estoque (como "Qtd Disponível")
-- Filtros: marca = "Samsung" OU marca = "LG" OU marca = "Sony"
--          E preço entre 1000 e 5000 (use >= e <=)
--          E estoque > 0
-- Ordenado por marca (A-Z), depois por preço (menor para maior)
-- Limitado aos 20 primeiros resultados
SELECT nome AS "Produto", 
       marca AS "Fabricante", 
       preco AS "Preço (R$)", 
       estoque AS "Qtd Disponível"
FROM produtos
WHERE (marca = 'Samsung' OR marca = 'LG' OR marca = 'Sony')
  AND preco >= 1000 
  AND preco <= 5000
  AND estoque > 0
ORDER BY marca ASC, preco ASC
LIMIT 20;




-- MÓDULO 3 - FILTROS AVANÇADOS

-- Aula 12 - Desafio 1: Mostrar todos os pedidos que NÃO foram cancelados


-- Aula 12 - Desafio 2: Mostrar todos os pagamentos que NÃO foram feitos via 'boleto'


SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

SELECT COUNT(*)
FROM produtos;