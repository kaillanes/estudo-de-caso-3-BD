DROP TABLE pedidos;
DROP DATABASE kaillane;
CREATE DATABASE kaillane;

CREATE TABLE pedidos (
idpedidos int,
valor varchar (45),
data varchar (45) ,
forma_de_pagamento varchar (45)
);

CREATE TABLE Cliente(
nome_cliente VARCHAR (45),
email_cliente VARCHAR (45),
telefone_cliente int,
endereco_idendereco int,
reservas_idreservas int
);

CREATE TABLE reservas (
idreservas int,
horario varchar (45),
cliente varchar (45),
prato varchar (45),
mesa varchar (45));

CREATE TABLE forma_de_pagamento (
idforma_de_pagamento int,
cartao_credito varchar (45),
cartao_debito varchar(45),

CREATE TABLE prato (
idprato int,
nome varchar(45),
receita varchar (45),
descricao varchar (45),
pedidos_idpedido int
);

CREATE TABLE endereco (
idendereco int,
cep varchar (45),
cidade varchar(45),
estado varchar (45),
bairro varchar (45),
rua varchar (45),
complemento varchar (45)
prato_idprato int );
                                       
                                       

