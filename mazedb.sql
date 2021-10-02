create database sprint2;
use sprint2;


-- Criação da tabela de cadastro do usuário --
create table usuario(
	idUsuario int primary key auto_increment,
    nomeUsuario varchar(100) not null,
    CPF char(11) not null not null,
    emailUsuario varchar(60) not null,
    senhaUsuario varchar(40) not null
);

describe usuario;

-- Criação da tabela de cadastro da empresa --
create table empresa(
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar(60) not null,
    CNPJ char(14) not null,
    emailEmpresa varchar(60) not null,
    senhaEmpresa varchar(40) not null
);

describe empresa;


-- Criação da tabela das linhas parceiras
create table linha(
idLinha int primary key,
numeroLinha int not null,
nomeLinha varchar(30) not null
);

describe linha;


-- Criação da tabela das estações que estão nas linhas
create table estacao(
idEstacao int primary key auto_increment,
nomeEstacao varchar(30) not null,
fkLinha int
);

-- Criação de uma chave estrangeira ligando a tabela estacao com a tabela linha
alter table estacao add foreign key (fkLinha) references linha (idLinha);

desc estacao;


-- Por uma questão de segurança criamos a tabela catraca para sabermos onde ela está caso não esteja funcionando corretamente --
create table catraca(
idCatraca int primary key auto_increment,
fkEstacao int,
statusCatraca varchar(30),
check (statusCatraca = 'ativa' or statusCatraca = 'inativa' )
);

-- Criação de uma chave estrangeira ligando a tabela catraca com a estação na qual ela está
alter table catraca add foreign  key (fkEstacao) references estacao (idEstacao);

desc catraca; 


-- Criação da tabela passagem, que será o dado registrado pelo sensor
create table passagem(
idPassagem int primary key auto_increment,
registro int default(1),
tempoPassagem datetime default current_timestamp, 
fkCatraca int
);

desc passagem;

-- Criação de uma chave estrangeira ligando a tabela passagem com a catraca que foi utilizada
alter table passagem add foreign key (fkCatraca) references catraca(idCatraca);


show tables;


insert into usuario (nomeUsuario, CPF, emailUsuario, senhaUsuario) values
('usuario1', '89339642902', 'usuario1@gmail.com', 'senhausuario1'),
('usuario2', '95264626103', 'usuario2@gmail.com', 'senhausuario2'),
('usuario3', '21459996984', 'usuario3@gmail.com', 'senhausuario3');

select * from usuario;


insert into empresa (nomeEmpresa, CNPJ, emailEmpresa, senhaEmpresa) values
('empresa1', '3472423000105', 'empresa1@empresa.com.br', 'senhaempresa1'),
('empresa2', '78865872000100', 'empresa2@empresa.com.br', 'senhaempresa2'),
('empresa3', '16842193000168', 'empresa3@empresa.com.br', 'senhaempresa3');

select * from empresa;


insert into linha values 
(1, 1, 'Azul'),
(2, 2, 'Verde'),
(3, 3, 'Vermelha'),
(4, 4, 'Amarela'),
(5, 5, 'Lilás'),
(15, 15, 'Prata');

select * from linha;


insert into estacao(nomeEstacao, linhaEstacao) values 
('Tucuruvi', 1),
('Parada Inglesa', 1),
('Jardim São Paulo', 1),
('Santana', 1),
('Carandiru', 1),
('Portuguesa-Tietê', 1),
('Armênia', 1),
('Tiradentes', 1),
('Luz', 1),
('São Bento', 1),
('Sé', 1),
('Liberdade', 1),
('São Joaquim', 1),
('Vergueiro', 1),
('Paraíso', 1),
('Ana Rosa', 1),
('Vila Mariana', 1),
('Santa Cruz', 1),
('Praça da Árvore', 1),
('Saúde', 1),
('São Judas', 1),
('Conceição', 1),
('Jabaquara', 1);


insert into estacao(nomeEstacao, linhaEstacao) values 
('Vila Madalena', 2), 
('Sumaré', 2), 
('Clínicas', 2), 
('Consolação', 2), 
('Trianon-MASP', 2), 
('Brigadeiro', 2), 
('Paraíso', 2), 
('Ana Rosa', 2), 
('Chácara Klabin', 2), 
('Santos-Imigrantes', 2), 
('Alto do Ipiranga', 2), 
('Sacomã', 2), 
('Tamanduateí', 2),
('Vila Prudente', 2); 


insert into estacao(nomeEstacao, linhaEstacao) values 
('Barra funda', 3),
('Marechal Deodoro', 3),
('Santa Cecília', 3),
('República', 3),
('Anhangabaú', 3),
('Sé', 3),
('Pedro II', 3),
('Brás', 3),
('Bresser - Mooca', 3),
('Belém', 3),
('Tatuapé', 3),
('Carrão', 3),
('Penha', 3),
('Vila Matilde', 3),
('Guilhermina - Esperança', 3),
('Patriarca', 3),
('Artur Alvim', 3),
('Corinthians - Itaquera', 3);


insert into estacao(nomeEstacao, linhaEstacao) values
('Luz', 4),
('República', 4),
('Higienoólis-Mackenzie', 4),
('Paulista', 4),
('Oscar Freire', 4),
('Fradique Coutinho', 4),
('Faria Lima', 4),
('Pinheiros', 4),
('Butantã', 4),
('São Paulo-Morumbi', 4),
('Vila Sônia', 4);


insert into estacao(nomeEstacao, linhaEstacao) values
('Capão Redondo', 5),
('Campo Limpo', 5),
('Vila das Belezas', 5),
('Giovanni Gronchi', 5),
('Santo Amaro', 5),
('Largo Treze', 5),
('Adolgo Pinheiro', 5),
('Alto da Boa Vista', 5),
('Borba Gato', 5),
('Brooklin', 5),
('Campo Belo', 5),
('Eucaliptos', 5),
('Moema', 5),
('AACD-Servidor', 5),
('Hospital São Paulo', 5),
('Santa Cruz', 5),
('Chácara Klabin', 5);


insert into estacao(nomeEstacao, linhaEstacao) values
('Vila Prudente', 15),
('Oratório', 15),
('São Lucas', 15),
('Camilo Haddad', 15),
('Vila Tólstói', 15),
('Vila União', 15),
('Jardim Planalto', 15),
('Sapopemba', 15),
('Fazenda da Juta', 15),
('São Mateus', 15),
('Iguatemi', 15),
('Jequiriçá', 15),
('Jacu-Pêssego', 15),
('Érico Semer', 15),
('Márcio Beck', 15),
('Cidade Tiradentes', 15),
('Hospital C. Tiradentes', 15);

select * from estacao;


insert into catraca (estacaoCatraca,statusCatraca) values
	(1, 'ativa'),
	(2, 'ativa'),
	(3, 'ativa');
select * from catraca;


insert into passagem (catraca) values
	(1),
    (2),
    (3);

select * from passagem;

select * from estacao join linha on fkLinha = idLinha;

select * from catraca join estacao on fkEstacao = idEstacao;

select * from passagem join catraca on fkCatraca = idCatraca;
