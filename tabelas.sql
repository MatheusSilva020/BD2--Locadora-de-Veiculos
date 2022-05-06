USE BD2_presentation

/*TABELAS:*/
create table pessoa
(
id int not null,
cpf char(11) not null,
telefone char(10) null,
endereco char(50) not null,
email char(25) not null,
nome char(35) not null,
primary key(id),
unique(id),
unique(cpf)
)

create table cliente
(
id int not null,
rg char(10) not null,
idade smallint not null,
cnh char(11) not null,
cartao char(25) not null,
primary key(id),
unique(rg),
unique(cnh),
foreign key (id) references pessoa(id)
)

create table atendente
(
id int not null,
cartTrab char(20) not null,
salario smallmoney not null,
primary key(id),
unique(cartTrab),
foreign key (id) references pessoa(id)
)

create table carro
(
placa char(10) not null,
marca char(15) not null,
modelo char(20) not null,
ano smallint not null,
km int not null,
combustivel int not null,
valor smallmoney not null,
manutencao bit not null,
seguro bit not null,
disponivel bit not null,
primary key(placa),
unique(placa),
)

create table Pjuridica
(
cnpj char(14) not null,
telefone char(10) null,
endereco char(50) not null,
email char(25) not null,
nome char(35) not null,
primary key(cnpj),
unique(cnpj),
)

create table mecanica
(
cnpj char(14) not null,
espec char(20) not null,
primary key(cnpj),
foreign key(cnpj) references Pjuridica(cnpj)
)

create table seguradora
(
cnpj char(14) not null,
cobertura char(20) not null,
primary key(cnpj),
foreign key(cnpj) references Pjuridica(cnpj)
)

create table estacionamento
(
cnpj char(14) not null,
avaliacao int not null,
primary key(cnpj),
foreign key(cnpj) references Pjuridica(cnpj)
)

create table concessionaria
(
cnpj char(14) not null,
marca char(20) not null,
primary key(cnpj),
foreign key(cnpj) references Pjuridica(cnpj)
)

create table NFcompra
(
codigo int not null,
valor smallmoney not null,
dataCompra smalldatetime not null,
cnpj_conc char(14) not null,
placa_carro char(10) not null,
primary key(codigo),
unique(codigo),
foreign key (cnpj_conc) references concessionaria(cnpj),
foreign key (placa_carro) references carro(placa),
)

create table NFvenda
(
codigo int not null,
valor smallmoney not null,
dataCompra smalldatetime not null,
cnpj_est char(14) null,
idCliente int null,
placa_carro char(10) not null,
primary key(codigo),
unique(codigo),
foreign key (cnpj_est) references estacionamento(cnpj),
foreign key (idCliente) references cliente,
)

create table aluguel
(
codigo int not null,
dataInicio datetime not null,
dataEntrega datetime null,
prazo datetime not null,
valor smallmoney not null,
taxas smallmoney null,
valorFinal smallmoney null,
statusAluguel bit not null,
placaCarro char(10) not null,
idCliente int not null,
idAtendente int not null,
primary key(codigo),
unique(codigo),
foreign key (placaCarro) references carro,
foreign key (idCliente) references cliente,
foreign key (idAtendente) references atendente,
)

create table reparo
(
codigo int not null,
dataInicio smalldatetime not null,
dataEntrega smalldatetime null,
valor smallmoney not null,
info char(30) null,
statusReparo bit not null,
placaCarro char(10) not null,
cnpj_mec char(14) not null,
cnpj_seg char(14) not null,
primary key(codigo),
unique(codigo),
foreign key (placaCarro) references carro,
foreign key (cnpj_mec) references mecanica,
foreign key (cnpj_seg) references seguradora
)

/*criando index para aluguel do atendente e cliente e carros + reparo:*/
create index ix_alguel_cli on aluguel(idCliente)
create index ix_alguel_aten on aluguel(idAtendente)
create index ix_alguel_car on aluguel(placaCarro)
create index ix_reparo_car on reparo(placaCarro)

