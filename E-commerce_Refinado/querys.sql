-- Acessando o Banco de Dados
USE ecommerce_refinado;

-- Consultando todas as colunas e linhas da tabela clientes
SELECT * FROM clients;

-- Consulta utilizada para contar o número total de linhas da tabela clientes
SELECT COUNT(*) FROM clients;

-- Nome e cpf dos clientes cadastrados como pessoa física
SELECT Fnome, CPF FROM clients WHERE clientType = 'PF';

-- Nome e categoria de todos os produtos cadastrados.
SELECT Pname, category FROM product;

-- Nome e classificação de todos os produtos cadastrados
SELECT Pname, rating FROM product;

-- Consultando pedidos com os respectivos clientes e pagamentos
SELECT  CONCAT(Fnome,' ',Minit,' ',LName) AS Client, r.description, r.status, p.typePayment, p.valor 
		FROM clients c, request r, payments p 	
             c.idClient = r.idClient AND
             p.idPayment = r.idPayment;

-- Consultando nomes dos clientes que estão com pedidos confirmados
SELECT Fnome, LName FROM clients WHERE idClient 
    IN (
        SELECT idClient
        FROM request
        WHERE status = 'confirmado'
    );

-- Consultando nomes e cpfs dos clientes com pedidos confirmados
SELECT Fnome, LName, CPF FROM clients WHERE idClient 
    IN (
        SELECT idClient
        FROM request
        WHERE status = 'confirmado'
    );
     
-- Consultando nome e uma contagem de pedidos de clientes que possuem mais de 3  pedidos confirmados
SELECT concat(c.Fnome,' ', c.LName)AS clientName, COUNT(r.idRequest) AS NumPedidos
        FROM clients c
        JOIN request r ON c.idClient = r.idClient
        WHERE r.status = 'confirmado'
        GROUP BY c.idClient
        HAVING COUNT(r.idRequest) > 3;

-- A consulta retornará informações sobre os produtos, classificados por classificação (do maior para o menor) 
-- e, em caso de empate na classificação, pelo nome do produto (em ordem alfabética).
SELECT idProduct, Pname, rating FROM product ORDER BY rating DESC, Pname;

-- Somando os produtos em estoque de acordo com a categoria
SELECT category, SUM(quantity) AS total_quantity FROM productSupplier
            INNER JOIN product ON productSupplier.idProduct = product.idProduct
            GROUP BY category;