-- Inserindo Dados na tabela clients
INSERT INTO clients(Fnome, Minit, LName, CPF, Adress)
                    VALUES('Naruto', 'A', 'Uzumaki', '12345678909', 'Konoha, 55'),
                          ('Kushina', 'B', 'Uzumaki', '09876543212', 'Konoha, 56'),
                          ('Minato', 'C', 'Namikaze', '12312312312', 'Konoha, 79'),
                          ('Madara', 'D', 'Uchiha', '09809909809', 'Konoha, 31'),
                          ('Sasuke', 'E', 'Uchiha', '12323232323', 'Vila, 65');

--  Inserindo dados na tabela product
INSERT INTO product (Pname, classfication_kids, category, rating, size)
                    VALUES('PC Gamer', false, 'eletrônico', 8.5, 'Grande'),
                        ('Calça', true, 'vestuário', 4.8, 'M'),
                        ('Bola', true, 'brinquedos', 2.2, 'Pequeno'),
                        ('Notebook', false, 'eletrônico', 2.1, 'Médio'),
                        ('Homem de Ferro', true, 'brinquedos', 1.9, 'Único');

-- Inserindo dados na tabela payments
INSERT INTO payments (idPayment, idClient, typePayment, limitAvaliable)
                        VALUES(1, 5, 'Boleto', 200),
                            (2, 2, 'cartão', 1000),
                            (3, 3, 'Dois cartões', 900),
                            (4, 4, 'Boleto', 400),
                            (5, 5, 'cartão', 850);

-- Inserindo dados na tabela request
INSERT INTO request (idClient, status, description, freightage, paymentCash, idPayment)
                    VALUES(1, 'Processando', 'Pedido 1', 16.5, true, 1),
                        (2, 'confirmado', 'Pedido 2', 12.2, false, 2),
                        (3, 'cancelado', 'Pedido 3', 30.2, false, 3),
                        (4, 'confirmado', 'Pedido 4', 20.0, true, 4),
                        (5, 'Processando', 'Pedido 5', 40.0, false, 5);

-- Inserindo dados na tabela productStorage
INSERT INTO productStorage (idProductStarage, location, quantity)
                            VALUES(1, 'Estoque 1', 200),
                                (2, 'Estoque 2', 100),
                                (3, 'Estoque 3', 400),
                                (4, 'Estoque 4', 175),
                                (5, 'Estoque 5', 600);

-- Inserindo dados na tabela Supplier
INSERT INTO Supplier (idSupplier, CNPJ, socialName, contact)
                        VALUES(1, '11116666611111', 'Fornecedor 1.', '11115555511'),
                            (2, '22228888822222', 'Fornecedor 2', '22222777772'),
                            (3, '33333444443333', 'Fornecedor 3', '33333999993'),
                            (4, '44888884444444', 'Fornecedor 4', '44444222224'),
                            (5, '55555522222555', 'Fornecedor 5', '55555444445');

-- Inserindo dados na tabela seller
INSERT INTO seller (idSeller, CNPJ, CPF, socialName, AbsName, contact, Adress)
                    VALUES(1, '113333111', '144441111', 'Vendedor 1', 'Vendedor A', '11119999911', 'Rua 01, 769'),
                        (2, '222777722', '222666622', 'Vendedor 2', 'Vendedor B', '22222333332', 'Rua 02, 345'),
                        (3, '333222233', '333888833', 'Vendedor 3', 'Vendedor C', '33333222223', 'Rua 03, 543'),
                        (4, '444777744', '444222244', 'Vendedor 4', 'Vendedor D', '44444555554', 'Rua 04, 454'),
                        (5, '555888855', '555111155', 'Vendedor 5', 'Vendedor E', '55555999995', 'Rua 05, 676');

-- Inserindo dados na tabela product_seller
INSERT INTO product_seller (idproduct, idSeller, quantity)
                            VALUES(1, 1, 10),
                                (2, 1, 5),
                                (3, 2, 8),
                                (4, 2, 15),
                                (5, 3, 3);

-- Inserindo dados na tabela product_request
INSERT INTO product_request (idProduct, idRequest, quantity, status)
                            VALUES(1, 1, 2, 'confirmado'),
                                (2, 1, 1, 'cancelado'),
                                (3, 2, 3, 'confirmado'),
                                (4, 2, 1, 'Processando'),
                                (5, 3, 5, 'confirmado');

-- Inserindo dados na tabela storage_location
INSERT INTO storage_location (idProduct, idStorage, location)
                            VALUES(1, 1, 'Estoque 1, Compartimento 01'),
                                (2, 2, 'Estoque 2, Compartimento 02'),
                                (3, 3, 'Estoque 3, Compartimento 03'),
                                (4, 4, 'Estoque 4, Compartimento 04'),
                                (5, 5, 'Estoque 5, Compartimento 05');

-- Inserindo dados tabela productSupplier
INSERT INTO productSupplier (idSupplier, idProduct, quantity)
                            VALUES(1, 1, 100),
                                (2, 1, 200),
                                (3, 2, 60),
                                (4, 3, 170),
                                (5, 3, 80);