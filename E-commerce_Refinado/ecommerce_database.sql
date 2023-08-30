CREATE DATABASE ecommerce_refinado;
USE ecommerce_refinado;

-- Criando tabela clients
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fnome VARCHAR(15) NOT NULL,
    Minit CHAR(3),
    LName VARCHAR(30) NOT NULL,
	CPF CHAR(11),
    CNPJ CHAR(15),
    Adress VARCHAR(50) NOT NULL,
    clientType ENUM('PF', 'PJ') NOT NULL,
    CONSTRAINT unique_cpf_client UNIQUE (CPF),
    CONSTRAINT unique_CNPJ_client UNIQUE (CNPJ)
);

-- criando tabela product
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(30) NOT NULL,
    classfication_kids BOOL,
    category ENUM('eletrônico', 'vestuário', 'brinquedos', 'Alimentos') NOT NULL,
    rating FLOAT DEFAULT 0,
    size VARCHAR(10)
);

-- criando tabela payments
CREATE TABLE payments(
	idPayment INT,
    idClient INT,
    typePayment ENUM('Boleto', 'cartão', 'Dois cartões'),
    limitAvaliable FLOAT,
    PRIMARY KEY(idPayment, idClient)
);

-- criando tabela request
CREATE TABLE request(
	idRequest INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    status ENUM('Processando', 'cancelado', 'confirmado') DEFAULT 'Processando',
    description VARCHAR(255),
    freightage FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT false,
    idPayment INT,
    CONSTRAINT fk_request_client FOREIGN KEY(idClient) REFERENCES clients(idClient)
);

-- relacionamento pedido/pagemento
CREATE TABLE request_payments (
  idRequest INT NOT NULL,
  idPayment INT NOT NULL,
  idClient INT NOT NULL,
  PRIMARY KEY(idRequest, idPayment, idClient),
  CONSTRAINT fk_request_payments FOREIGN KEY(idRequest) REFERENCES request(idRequest),
  CONSTRAINT fk_request_payments_payment FOREIGN KEY(idPayment , idClient) REFERENCES payments(idPayment, idClient)
);

-- criando tabela productStorage
CREATE TABLE productStorage(
	idProductStarage INT PRIMARY KEY,
    location VARCHAR(255),
    quantity INT DEFAULT 0
);

-- criando tabela Supplier
CREATE TABLE Supplier(
	idSupplier INT PRIMARY KEY,
    CNPJ CHAR(15) NOT NULL,
    socialName VARCHAR(255) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE(CNPJ)
);
-- criando tabela seller
CREATE TABLE seller(
	idSeller INT PRIMARY KEY,
    CNPJ CHAR(15),
    CPF CHAR(9),
    socialName VARCHAR(255) NOT NULL,
    AbsName VARCHAR(255),
    contact CHAR(11) NOT NULL,
    Adress VARCHAR(255),
    CONSTRAINT unique_CPF_seller UNIQUE(CPF),
    CONSTRAINT unique_CNPJ_seller UNIQUE(CNPJ)
);

-- criar relacionamento product_seller
CREATE TABLE product_seller(
	idproduct INT,
    idSeller INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY(idProduct, idSeller),
    CONSTRAINT fk_product_seller FOREIGN KEY(idSeller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY(idProduct) REFERENCES product(idProduct)
);

-- relacionamento product_request
CREATE TABLE product_request(
	idProduct INT,
    idRequest INT,
    quantity INT,
    status ENUM('Processando', 'cancelado', 'confirmado') DEFAULT 'Processando',
    PRIMARY KEY(idProduct, idRequest),
    CONSTRAINT fk_product_request FOREIGN KEY(idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_request_product FOREIGN KEY(idRequest) REFERENCES request(idRequest)
);

-- criando tabela storage_location
CREATE TABLE storage_location(
	idProduct INT,
    idStorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY(idProduct, idStorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY(idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_product FOREIGN KEY(idStorage) REFERENCES productStorage(idProductStarage)
);

-- relacionameto productSupplier
CREATE TABLE productSupplier(
	idSupplier INT,
    idProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idSupplier, idProduct),
    CONSTRAINT fk_supplier_supplier FOREIGN KEY(idSupplier) REFERENCES Supplier(idSupplier),
    CONSTRAINT fk_product_supplier FOREIGN KEY(idProduct) REFERENCES product(idProduct)
);

-- criando tabela delivery
CREATE TABLE delivery(
	idDelivery INT,
    trackingCode VARCHAR(20),
    idRequest INT,
    status ENUM('processando', 'Em trânsito', 'Entregue', 'devolvido'),
    CONSTRAINT fk_delivery_request FOREIGN KEY(idRequest) REFERENCES request(idRequest)
);