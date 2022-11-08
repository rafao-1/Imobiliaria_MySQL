drop database if exists Imobiliaria;
create database imobiliaria;

create table Imobiliaria.Condominio(
	idCondominio int,
    sigla varchar(45) not null,
    nome varchar(45),
    nomeSindico varchar(45),
    telefone varchar(45),
    enderecoLogradouro varchar(45),
    enderecoNome varchar(45),
    enderecoNum varchar(45),
    primary key(idCondominio)
);

create table Imobiliaria.Cliente(
	idCliente int,
    cpf int not null,
    nome varchar(45),
    primary key(idCliente)
);

create table Imobiliaria.Contrato(
	idContrato int,
    numContrato int not null,
    dtInicio date,
    dtTermino date,
    valor decimal,
    idCliente int,
    primary key(idContrato),
    foreign key(idCliente) references Imobiliaria.Cliente(idCliente)
);
    
create table Imobiliaria.Loja(
	idLoja int,
    numero int,
    metragem decimal(6,2),
    descricao varchar(120),
    idCondominio int,
    idContrato int,
    primary key(idLoja,idCondominio),
	foreign key(idCondominio) references Condominio(idCondominio),
    foreign key(idContrato) references Imobiliaria.Contrato(idContrato)
);

create table Imobiliaria.Boleto(
	idBoleto int,
    dtPagamento datetime,
    mesReferencia varchar(10),
    valorPago decimal(6,2),
    numCodigoBarra int,
    idContrato int,
    primary key(idBoleto),
    foreign key(idContrato) references Contrato(idContrato)
);
	