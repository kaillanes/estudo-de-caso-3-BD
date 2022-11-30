-- -----------------------------------------------------
-- Schema restaurante
-- -----------------------------------------------------
DROP DATABASE restaurante;
CREATE DATABASE restaurante;
USE restaurante;

CREATE TABLE clientes(
   idcliente  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   nome_completo  VARCHAR(45) NOT NULL,
   email  VARCHAR(45) NOT NULL,
   telefone  VARCHAR(20) NOT NULL,
   data_nasc  VARCHAR(20) NOT NULL);

CREATE TABLE cardapios(
   idprato  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   nome_prato  VARCHAR(45) NOT NULL,
   valor_prato  VARCHAR(20) NOT NULL,
   descricao  VARCHAR(200) NOT NULL);

CREATE TABLE mesas(
   idmesa  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   n_lugares  INT NOT NULL,
   status_  VARCHAR(14) NOT NULL);

CREATE TABLE reservas(
   idreserva   INT  NOT NULL  PRIMARY KEY AUTO_INCREMENT ,
   horario  VARCHAR(20) NOT NULL,
   cliente_idcliente  INT ,
   mesa_idmesa  INT ,
	FOREIGN KEY ( cliente_idcliente )
    REFERENCES  clientes( idcliente ),
    FOREIGN KEY ( mesa_idmesa )
    REFERENCES  mesas( idmesa ));

CREATE TABLE pedidos(
   idpedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   reserva_idreserva  INT ,
   cardapio_idprato  INT ,
   horario  VARCHAR(20) NOT NULL,
    FOREIGN KEY ( reserva_idreserva )
    REFERENCES  reservas( idreserva ),
    FOREIGN KEY ( cardapio_idprato )
    REFERENCES  cardapios( idprato ));
   
   insert into clientes (nome_completo, email, telefone, data_nasc) 
   values ('Zonnya Welberry', 'zwelberry0@about.me', '(426) 2897648', '12/08/1998'),
('Sonni Ferber', 'sferber1@globo.com', '(634) 7711203', '18/03/1995'),
('Cammie Dudson', 'cdudson2@wix.com', '(719) 9762071', '28/11/2008'),
('Gregorio Fowles', 'gfowles3@jalbum.net', '(640) 9062618', '14/06/1997'),
('Theresina Vasilov', 'tvasilov4@ibm.com', '(935) 8555797', '30/12/2002'),
('Philippe Keen', 'pkeen5@vistaprint.com', '(463) 2108678', '24/01/2005'),
('Kirk Esler', 'kesler6@google.com.au', '(190) 8383436', '18/06/2009'),
('Linc Whitehorne', 'lwhitehorne7@alexa.com', '(839) 9032524', '19/10/2006'),
('Devin Sisley', 'dsisley8@cnn.com', '(725) 1434402', '05/10/1995'),
('Bonni Nunnerley', 'bnunnerley9@nbcnews.com', '(320) 9255822', '20/02/2007');

insert into cardapios (nome_prato, valor_prato, descricao)
values('Parmegiana', 'R$ 32,00','Bife frito empanado coberto com queijo e molho de tomate.'), 
('Feijoada', 'R$ 38,90','Feijoada com costelinha suína, carne-seca, bacon e linguiça defumada e acompanhamentos.'),
('Contra filé', 'R$ 25,00','Arroz, feijão, contra filé e acompanhamentos.'),
('Strogonoff de frango', 'R$ 19,00','Arroz, strogonoff de frango e batata palha.'),
('Filé de frango', 'R$ 20,90','Arroz, feijão, filé de frango, batata frita e salada.'),
('Picadinho', 'R$ 27,00','Arroz, feijão, picafinho de carne com batata e cenoura.'),
('Frango ao molho', 'R$ 19,00','Arroz, pure de batatas, frango ao molho e salada.'),
('Virada à paulista', 'R$ 28,90','Arroz, tutu de feijão, couve, bisteca, ovo e banana frita.'),
('Moqueca de tilápia', 'R$ 28,00','Arroz, tilápia ao molho, batata frita e salada'),
('Tilápia a milanesa', 'R$ 25,00','Arroz, feijão, tilápia a milanesa e salada');

insert into mesas (n_lugares, status_)
values(4, 'disponivel'),
(4, 'indisponivel'),
(2, 'indisponivel'),
(2, 'disponivel'),
(4, 'disponivel'),
(4, 'disponivel'),
(8, 'indisponivel'),
(4, 'disponivel'),
(8, 'disponivel'),
(4, 'indisponivel');
   
insert into reservas (horario)
values('11:30'),
('11:10'),
('10:25'),
('13:45'),
('13:00'),
('12:20'),
('12:20'),
('12:50'),
('12:45'),
('11:10');

insert into pedidos (horario)
values('12:36'),
('11:15'),
('12:14'),
('11:49'),
('13:33'),
('12:07'),
('13:00'),
('11:20'),
('12:30'),
('13:50');

update clientes
set data_nasc = '10/05/1998' 
where idcliente = 1;
update clientes
set data_nasc = '11/09/1999' 
where idcliente = 2;
update clientes
set data_nasc = '26/09/2004' 
where idcliente = 3;
update clientes
set data_nasc = '30/11/2002' 
where idcliente = 4;
update clientes
set data_nasc = '02/02/1995' 
where idcliente = 5;

delete from clientes where idcliente = 1;
delete from clientes where idcliente = 2;
delete from clientes where idcliente = 3;
delete from clientes where idcliente = 4;
delete from clientes where idcliente = 5;

update cardapios
set valor_prato = 'R$19,00'
where idprato = 1;
update cardapios
set valor_prato = 'R$26,00'
where idprato = 2;
update cardapios
set valor_prato = 'R$15,00'
where idprato = 3;
update cardapios
set valor_prato = 'R$25,50'
where idprato = 4;
update cardapios
set valor_prato = 'R$30,99'
where idprato = 5;

delete from cardapios where idprato = 1;
delete from cardapios where idprato = 2;
delete from cardapios where idprato = 3;
delete from cardapios where idprato = 4;
delete from cardapios where idprato = 5;

update mesas
set n_lugares = '6'
where idmesa = 1;
update mesas
set n_lugares = '2'
where idmesa = 2;
update mesas
set n_lugares = '2'
where idmesa = 3;
update mesas
set n_lugares = '8'
where idmesa = 4;
update mesas
set n_lugares = '4'
where idmesa = 5;

delete from mesas where idmesa = 1;
delete from mesas where idmesa = 2;
delete from mesas where idmesa = 3;
delete from mesas where idmesa = 4;
delete from mesas where idmesa = 5;

update reservas
set horario = '11:28'
where idreserva = 1; 
update reservas
set horario = '12:21'
where idreserva = 2; 
update reservas
set horario = '10:05'
where idreserva = 3; 
update reservas
set horario = '12:40'
where idreserva = 4; 
update reservas
set horario = '13:15'
where idreserva = 5; 

delete from reservas where idreserva = 1;
delete from reservas where idreserva = 2;
delete from reservas where idreserva = 3;
delete from reservas where idreserva = 4;
delete from reservas where idreserva = 5;

update pedidos
set horario = '12:30'
where idpedido = 1;
update pedidos
set horario = '12:25'
where idpedido = 2;
update pedidos
set horario = '11:45'
where idpedido = 3;
update pedidos
set horario = '11:50'
where idpedido = 4;
update pedidos
set horario = '12:30'
where idpedido = 5;

delete from pedidos where idpedido = 1;
delete from pedidos where idpedido = 2;
delete from pedidos where idpedido = 3;
delete from pedidos where idpedido = 4;
delete from pedidos where idpedido = 5;

select * from clientes order by idcliente asc;
select * from cardapios order by idprato asc;
select * from mesas order by idmesa asc;
select * from reservas order by idreserva asc;
select * from pedidos order by idpedido asc;

select * from clientes where idcliente = 9;
select * from cardapios where idprato = 9;
select * from mesas where idmesa = 9;
select * from reservas where idreserva = 9;
select * from pedidos where idpedido = 9;

select clientes.idcliente, reservas.idreserva 
from clientes inner join reservas on
clientes.idcliente = reservas.idreserva;