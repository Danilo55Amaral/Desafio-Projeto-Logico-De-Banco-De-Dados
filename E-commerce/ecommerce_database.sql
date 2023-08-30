-- criação do banco de dados para o cenário de E-commerce

CREATE DATABASE ecommerce;
USE ecommerce;

-- Criando tabela clientes
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fnome VARCHAR(15) NOT NULL,
    Minit CHAR(3),
    LName VARCHAR(20) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Adress VARCHAR(50) NOT NULL,
    CONSTRAINT unique_cpf_client UNIQUE(CPF)
);

-- Criando tabela produto / Size é a dimensão do produto.
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(30) NOT NULL,
    classfication_kids BOOL,
    category ENUM('eletrônico','vestuário','brinquedos','Alimentos') NOT NULL,
    rating FLOAT DEFAULT 0,
    size VARCHAR(10)
);

-- Criando tabela de pagamento
CREATE TABLE payments(
	idClient INT,
    idPayment INT,
    typePayment ENUM('Boleto','cartão','Dois cartões'),
    limitAvaliable FLOAT,
    PRIMARY KEY(idClient, idPayment)
); 

-- Criando tabela pedido
CREATE TABLE request(
	idRequest INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    status ENUM('Processando','cancelado','confirmado') DEFAULT 'Processando',
    description VARCHAR(255),
    freightage FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    idPayment INT,
    CONSTRAINT fk_request_client FOREIGN KEY (idClient) REFERENCES clients(idClient),
    CONSTRAINT fk_request_Payment FOREIGN KEY (idPayment, idClient) REFERENCES payments(idPayment, idClient)
);

-- criando a tabela estoque 
CREATE TABLE productStorage(
	idProductStorage INT PRIMARY KEY,
	location VARCHAR(255),
    quantity INT DEFAULT 0
);

-- criando a tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT PRIMARY KEY,
	SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE(CNPJ)
);

-- criando a tabela vendedor
CREATE TABLE seller(
	idSeller INT PRIMARY KEY,
	socialName VARCHAR(255) NOT NULL,
    AbsName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(9),
    Adress VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_CNPJ_seller UNIQUE(CNPJ),
    CONSTRAINT unique_CPF_seller UNIQUE(CPF)
);

-- Relacionamento produto / vendedor
CREATE TABLE product_seller(
	idSeller INT,
    idproduct INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY(idSeller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY(idSeller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY(idProduct) REFERENCES product(idProduct)
);

-- Relacionamento Produto / Pedido
CREATE TABLE product_request(
	idProduct INT,
    idRequest INT,
    quantity INT,
    status ENUM('Processando', 'cancelado', 'confirmado') DEFAULT 'Processando',
    PRIMARY KEY (idProduct, idRequest),
    CONSTRAINT fk_product_request FOREIGN KEY(idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_request_product FOREIGN KEY(idRequest) REFERENCES request(idRequest)
);

-- Criando tabela de estoque
CREATE TABLE storage_location(
	idProduct INT,
    idStorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idProduct, idStorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY(idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_product FOREIGN KEY(idStorage) REFERENCES productStorage(idProductStorage)
);

-- Relacionamento produto / fornecedor
CREATE TABLE productSupplier(
	idSupplier INT,
    idProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idSupplier, idProduct),
    CONSTRAINT fk_supplier_supplier FOREIGN KEY(idSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

-- Verificando as tabelas criadas
SHOW TABLES;