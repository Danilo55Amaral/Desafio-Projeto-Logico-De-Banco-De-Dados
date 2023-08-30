-- Acessando o Banco de Dados 
USE ecommerce_refinado;

-- Inserindo dados em todas as tabelas 

INSERT INTO clients (Fnome, Minit, LName, CPF, CNPJ, Adress, clientType) 
                    VALUES('Naruto', 'A', 'Uzumaki', '12345678904', NULL, 'Rua 5, 12', 'PF'),
                            ('Sakura', 'C', 'Uchiha', '98987652109', NULL, 'Rua 5, 13', 'PF'),
                            ('Tesla', NULL, 'Indústria Automotiva', NULL, '12334567890236', 'Vale do Silicio, 222', 'PJ'),
                            ('Facebook', NULL, 'Big Tech', NULL, '98763434343866', 'Vale do Silicio, 55', 'PJ'),
                            ('Bill Gates', 'B', 'Gates', '45678555506', NULL, 'Rua 5, 14', 'PF'),
                            ('Kushina', 'K', 'Uzumaki', '65234343706', NULL, 'Rua 5, 11', 'PF'),
                            ('Microssoft', NULL, 'Big Tech', NULL, '34534343445645', 'Vale do Silicio, 333', 'PJ'),
                            ('Oracle', NULL, 'Big Tech', NULL, '54321123456878', 'Vale do Silicio, 444', 'PJ'),
                            ('Elon Musk', 'E', 'Musk', '78912366554', NULL, 'Vale do Solicio, 654', 'PF'),
                            ('Julia', 'J', 'Santos', '87657778885', NULL, 'Rua 5, 56', 'PF'),
                            ('Meta', NULL, 'Big Tech', NULL, '76598877676543', 'Vale do Silicio, 555', 'PJ'),
                            ('Itau', NULL, 'Banco', NULL, '98765455553456', 'Recife, 1005', 'PJ'),
                            ('Obama', 'B', 'Obama', '67891454011', NULL, 'Rua 5, 20', 'PF'),
                            ('Eduarda', 'D', 'Silva', '54377777601', NULL, 'Rua 5, 10', 'PF'),
                            ('SpaceX', NULL, 'Tecnologia Espacial', NULL, '87556621987654', 'Estados Unidos, 222', 'PJ');


INSERT INTO product (Pname, classfication_kids, category, rating, size) 
                    VALUES('Carro', false, 'eletrônico', 8.5, 'Grande'),
                            ('Pijama', true, 'vestuário', 4.8, 'M'),
                            ('Homem de ferro', true, 'brinquedos', 8.2, NULL),
                            ('Pavê', false, 'Alimentos', 8.0, NULL),
                            ('PC Gamer', false, 'eletrônico', 6.7, 'Médio'),
                            ('Fantasia de onça', true, 'vestuário', 8.1, 'P'),
                            ('Robô Doidão', true, 'brinquedos', 8.5, NULL),
                            ('Chocolate ao leite', false, 'Alimentos', 6.5, NULL),
                            ('Tradutor universal', false, 'eletrônico', 8.3, NULL),
                            ('Capa da invisibilidade', true, 'vestuário', 6.9, 'G'),
                            ('Ossos de Dinossauros', true, 'brinquedos', 8.0, NULL),
                            ('Torta de Chocolate', false, 'Alimentos', 8.2, NULL),
                            ('Xbox Serie X', false, 'eletrônico', 8.1, NULL),
                            ('Camiseta', true, 'vestuário', 8.4, 'M'),
                            ('Optmus Primer tamanho Real', true, 'brinquedos', 6.8, NULL);


INSERT INTO payments (idPayment, idClient, typePayment, limitAvaliable) 
                        VALUES(1, 1, 'Boleto', 2000.00),
                                (2, 1, 'cartão', 4000.00),
                                (3, 2, 'Dois cartões', 3000.00),
                                (4, 3, 'cartão', 10000.00),
                                (5, 4, 'Boleto', 6000.00),
                                (6, 5, 'cartão', 5000.00),
                                (7, 5, 'Boleto', 7000.00),
                                (8, 6, 'Dois cartões', 4000.00),
                                (9, 7, 'cartão', 8000.00),
                                (10, 8, 'Boleto', 3000.00),
                                (11, 9, 'Boleto', 4200.00),
                                (12, 9, 'cartão', 2800.00),
                                (13, 10, 'Dois cartões', 4700.00),
                                (14, 11, 'cartão', 6200.00),
                                (15, 12, 'Boleto', 2800.00);


INSERT INTO request (idClient, status, description, freightage, paymentCash, idPayment) 
                    VALUES(1, 'confirmado', 'Pedido de carro', 30.50, false, 2),
                            (1, 'Processando', 'Pedido de pijama', 24.00, true, 1),
                            (2, 'cancelado', 'Pedido de Homem de ferro', 16.00, false, 3),
                            (3, 'confirmado', 'Pedido de Pavê', 40.00, true, 4),
                            (4, 'confirmado', 'Pedido de PC Gamer', 28.50, false, 5),
                            (4, 'cancelado', 'Pedido de Fantasia de onça', 20.00, false, 6),
                            (5, 'Processando', 'Pedido de Robô Doidão', 35.00, true, 7),
                            (5, 'confirmado', 'Pedido de Chocolate ao leite', 42.00, true, 8),
                            (6, 'Processando', 'Pedido de Tradutor Universal', 10.50, false, 9),
                            (6, 'confirmado', 'Pedido de Capa da invisibilidade', 28.00, true, 10),
                            (7, 'Processando', 'Pedido de ossos de dinossauros', 24.00, false, 11),
                            (8, 'Processando', 'Pedido de torta de chocolate', 40.50, true, 12),
                            (9, 'confirmado', 'Pedido de Xbox serie X', 32.00, false, 13),
                            (9, 'cancelado', 'Pedido de camiseta', 22.00, false, 14),
                            (10, 'Processando', 'Optmus Primer tamanho Real', 26.00, true, 15);


INSERT INTO request_payments (idRequest, idPayment, idClient) 
                            VALUES(1, 2, 1),
                                    (2, 1, 1),
                                    (3, 3, 2),
                                    (4, 4, 3),
                                    (4, 5, 4),
                                    (5, 6, 5),
                                    (6, 7, 5),
                                    (7, 8, 6),
                                    (8, 9, 7),
                                    (9, 10, 8),
                                    (10, 11, 9),
                                    (11, 12, 9),
                                    (12, 13, 10),
                                    (13, 14, 11),
                                    (14, 15, 12);


INSERT INTO productStorage (idProductStarage, location, quantity)  
                            VALUES(1, 'Prateleira A', 100),
                                    (2, 'Estoque B', 200),
                                    (3, 'Caixa 1', 50),
                                    (4, 'Estoque C', 1000),
                                    (5, 'Prateleira X', 300),
                                    (6, 'Estoque Y', 200),
                                    (7, 'Caixa 2', 120),
                                    (8, 'Estoque Z', 600),
                                    (9, 'Prateleira B', 160),
                                    (10, 'Estoque D', 220),
                                    (11, 'Caixa 3', 80),
                                    (12, 'Estoque E', 450),
                                    (13, 'Prateleira C', 85),
                                    (14, 'Estoque F', 160),
                                    (15, 'Caixa 4', 60);


INSERT INTO Supplier (idSupplier, CNPJ, socialName, contact) 
                        VALUES(1, '12345654341234', 'Fornecedor Eletrônicos', '987334341'),
                                (2, '98765678909876', 'Fornecedor Brinquedos', '122345689'),
                                (3, '87654334448765', 'Fornecedor Alimentos', '543767899'),
                                (4, '56789234565678', 'Fornecedor Vestuário', '678989894'),
                                (5, '34567889893456', 'Fornecedor Tecnologia', '894445556');


INSERT INTO seller (idSeller, CNPJ, CPF, socialName, AbsName, contact, Adress) 
                    VALUES(1, NULL, '123456569', 'Vendedor 1', 'Vendedor Absoluto', '987777721', 'Rua 5, 55'),
                            (2, '987654355555876', NULL, 'Facebook', 'Vendedor B', '123458889', 'Vale do Silicio, 555'),
                            (3, NULL, '543223239', 'Vendedor 2', 'Vendedor Sênior', '678934344', 'Rua 6, 656'),
                            (4, '34567855553457', NULL, 'Tesla', 'Vendedor 5', '890165656', 'Vale do Silicio, 222'),
                            (5, NULL, '876781234', 'Vendedor 3', 'Vendedor Top', '901244447', 'Narnia, 22'),
                            (6, '56789078909878', NULL, 'Google', 'Vendedor Topado', '890556656', 'Vale do Silicio, 56'),
                            (7, NULL, '890455556', 'Vendedor um', 'Vendedor Novo', '901233337', 'Rua Universitária, 79'),
                            (8, '45678654344567', NULL, 'SpaceX', 'Dono', '890155566', 'Estados Unidos, 55'),
                            (9, NULL, '901267677', 'Vendedor Omega', 'Vendedor Forte', '901277777', 'Rua dos Malhados, 888'),
                            (10, '34567896665556', NULL, 'Frutas Online', 'Vendedor Full', '890445556', 'Recife, 89'),
                            (11, NULL, '234545540', 'Vendedor Desenrolado', 'Vendedor Experiente', '901255566', 'Rua dos Formados, 78'),
                            (12, '56789012777880', NULL, 'Reino do Trigo', 'Vendedor Pão', '895556656', 'Rua do Pão Doce, 3030'),
                            (13, NULL, '123443330', 'Vendedor Magico', 'Vendedor Bruxo', '901444557', 'Rua dos magos, 67'),
                            (14, '67890123555669', NULL, 'Game Mania', 'Vendedor Nerd', '890166677', 'Rua dos Games, 12'),
                            (15, NULL, '458877712', 'Vendedor Bot', 'Vendedor Robô', '901555667', 'Rua das máquinas, 322');


INSERT INTO product_seller (idproduct, idSeller, quantity) 
                            VALUES(1, 1, 40),
                                    (2, 1, 60),
                                    (3, 1, 40),
                                    (3, 2, 200),
                                    (4, 2, 400),
                                    (5, 3, 100),
                                    (6, 3, 270),
                                    (6, 4, 60),
                                    (7, 4, 120),
                                    (8, 5, 80),
                                    (9, 5, 120),
                                    (10, 6, 45),
                                    (11, 6, 65),
                                    (11, 7, 125),
                                    (12, 7, 180);


INSERT INTO product_request (idProduct, idRequest, quantity, status) 
                            VALUES(1, 1, 2, 'confirmado'),
                                    (2, 1, 1, 'cancelado'),
                                    (3, 2, 3, 'Processando'),
                                    (4, 3, 5, 'confirmado'),
                                    (1, 4, 1, 'confirmado'),
                                    (2, 4, 2, 'confirmado'),
                                    (4, 4, 3, 'confirmado'),
                                    (5, 5, 2, 'Processando'),
                                    (6, 5, 1, 'confirmado'),
                                    (7, 6, 3, 'Processando'),
                                    (8, 6, 1, 'confirmado'),
                                    (9, 7, 2, 'Processando'),
                                    (10, 8, 4, 'confirmado'),
                                    (11, 9, 1, 'confirmado'),
                                    (12, 10, 2, 'Processando');


INSERT INTO storage_location (idProduct, idStorage, location)  
                            VALUES(1, 1, 'Compartimento A'),
                                    (2, 2, 'Compartimento B'),
                                    (3, 3, 'Compartimento c'),
                                    (4, 4, 'Compartimento D'),
                                    (5, 5, 'Compartimento E'),
                                    (6, 6, 'Compartimento F'),
                                    (7, 7, 'Compartimento G'),
                                    (8, 8, 'Compartimento H'),
                                    (9, 9, 'Compartimento I'),
                                    (10, 10, 'Compartimento G'),
                                    (11, 11, 'Compartimento L'),
                                    (12, 12, 'Compartimento M'),
                                    (13, 13, 'Compartimento N'),
                                    (14, 14, 'Compartimento O'),
                                    (15, 15, 'Compartimento P');


INSERT INTO productSupplier (idSupplier, idProduct, quantity) 
                            VALUES(1, 1, 200),
                                    (1, 2, 100),
                                    (2, 3, 400),
                                    (2, 4, 1000),
                                    (3, 5, 300),
                                    (3, 6, 140),
                                    (4, 7, 120),
                                    (4, 8, 600),
                                    (5, 9, 160),
                                    (5, 10, 240),
                                    (1, 11, 80),
                                    (2, 12, 500),
                                    (3, 13, 90),
                                    (4, 14, 180),
                                    (5, 15, 60);


INSERT INTO delivery (idDelivery, trackingCode, idRequest, status) 
                    VALUES(1, 'EDF565', 1, 'processando'),
                            (2, 'RTG565', 2, 'Em trânsito'),
                            (3, 'TYG676', 4, 'Entregue'),
                            (4, 'RFG567', 5, 'processando'),
                            (5, 'YHN789', 6, 'Em trânsito'),
                            (6, 'RFG567', 7, 'Entregue'),
                            (7, 'EDC123', 8, 'processando'),
                            (8, 'TGH567', 9, 'Em trânsito'),
                            (9, 'RFG567', 10, 'Entregue'),
                            (10, 'ERF456', 11, 'processando'),
                            (11, 'YHJ678', 12, 'Em trânsito'),
                            (12, 'RFD342', 13, 'Entregue'),
                            (13, 'TGF456', 14, 'processando'),
                            (14, 'YHG567', 15, 'Em trânsito');