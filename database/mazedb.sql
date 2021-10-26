create database sprint2;
use sprint2;

-- Criação da tabela de cadastro da empresa --
create table cadastroEmpresa(
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar(60) not null,
    CNPJ varchar(25) not null,
    emailEmpresa varchar(60) not null,
    senhaEmpresa varchar(40) not null
);

describe cadastroEmpresa;

-- Criação da tabela de login da empresa --
create table loginEmpresa (
	idLoginEmpresa int primary key auto_increment,
    emailEmpresa varchar(60) not null,
    senhaEmpresa varchar(40)  not null,
    fkCadastro int
);

describe loginEmpresa;

-- Criação de uma chave estrangeira ligando a tabela de login com a tabela de cadastro --
alter table loginEmpresa add foreign key (fkCadastro)
	references cadastroEmpresa(idEmpresa);
    
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
check (registro = 1),
tempoPassagem datetime default current_timestamp, 
fkCatraca int,
fkLinha int,
fkEstacao int
);

desc passagem;

-- Criação de uma chave estrangeira ligando a tabela passagem com a catraca que foi utilizada
alter table passagem add foreign key (fkCatraca) references catraca(idCatraca);

-- Criação de uma chave estrangeira ligando a tabela passagem com a linha na qual foi registrada
alter table passagem add foreign key (fkLinha) references linha(idLinha);

-- Criação de uma chave estrangeira ligando a tabela passsagem com a estação na qual foi registrada
alter table passagem add foreign key (fkLinha) references estacao(idEstacao);

-- Criação de uma tabela dos locais da estação, para um possível mapa térmico --
create table Locais (
	idLocais int primary key auto_increment,
	nomeLocal varchar(150),
    fkLinha int,
    fkLogin int,
    fkEstacao int);
    
alter table Locais add foreign key (fkEstacao) references estacao(idEstacao);
alter table Locais add foreign key (fkLinha) references linha(idLinha);
alter table Locais add foreign key (fkLogin) references loginEmpresa(idLoginEmpresa);

desc Locais;

show tables;


insert into cadastroEmpresa (nomeEmpresa, CNPJ, emailEmpresa, senhaEmpresa) values
('Empresa1', '59.933.311/0001-56', 'empresa1@empresa1.com', 'senhaempresa1'),
('Empresa2', '02.773.554/0001-57', 'empresa2@empresa2.com', 'senhaempresa2'),
('Empresa3', '18.970.865/0001-46', 'empresa3@empresa3.com', 'senhaempresa3'),
('Empresa4', '38.656.605/0001-08', 'empresa4@empresa4.com', 'senhaempresa4'),
('Empresa5', '74.647.472/0001-77', 'empresa5@empresa5.com', 'senhaempresa5');

select * from cadastroEmpresa;


insert into loginEmpresa (emailEmpresa, senhaEmpresa, fkCadastro) values
('empresa1@empresa1.com', 'senhaempresa1', 1),
('empresa2@empresa2.com', 'senhaempresa2', 2),
('empresa3@empresa3.com', 'senhaempresa3', 3),
('empresa4@empresa4.com', 'senhaempresa4', 4),
('empresa5@empresa5.com', 'senhaempresa5', 5);

select * from loginEmpresa;


insert into linha values 
(1, 1, 'Azul'),
(2, 2, 'Verde'),
(3, 3, 'Vermelha'),
(4, 4, 'Amarela'),
(5, 5, 'Lilás'),
(15, 15, 'Prata');

select * from linha;


insert into estacao(nomeEstacao, fkLinha) values 
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


insert into estacao(nomeEstacao, fkLinha) values 
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


insert into estacao(nomeEstacao, fkLinha) values 
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


insert into estacao(nomeEstacao, fkLinha) values
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


insert into estacao(nomeEstacao, fkLinha) values
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


insert into estacao(nomeEstacao, fkLinha) values
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


insert into catraca (fkEstacao,statusCatraca) values
	(1, 'ativa'),
	(2, 'ativa'),
	(3, 'ativa'),
	(4, 'ativa'),
	(5, 'ativa'),
	(15, 'ativa'),
	(3, 'ativa'),
	(5, 'ativa'),
	(15, 'ativa'),
	(1, 'ativa'),
	(1, 'ativa'),
	(2, 'ativa'),
	(3, 'ativa'),
	(4, 'ativa'),
	(4, 'ativa'),
	(4, 'ativa'),
	(4, 'ativa'),
	(4, 'ativa'),
	(4, 'ativa'),
	(4, 'ativa'),
	(4, 'ativa'),
	(4, 'ativa'),
	(4, 'ativa'),
	(1, 'ativa'),
	(1, 'ativa'),
	(2, 'ativa'),
	(2, 'ativa'),
	(2, 'ativa'),
	(2, 'ativa'),
	(3, 'ativa'),
	(3, 'ativa'),
	(3, 'ativa'),
	(3, 'ativa'),
	(5, 'ativa'),
	(5, 'ativa'),
	(5, 'ativa'),
	(5, 'ativa'),
	(5, 'ativa'),
	(15, 'ativa'),
	(15, 'ativa'),
	(15, 'ativa'),
	(15, 'ativa'),  
	(15, 'ativa');  
  
select * from catraca;


insert into passagem (fkCatraca, fkLinha, fkEstacao) values
	(1, 1, 5),
    (2, 2, 43),
    (3, 3, 7),
    (4, 4, 21),
    (5, 5, 14),
    (6, 15, 24),
    (7, 2, 52),
    (8, 1, 67),
    (9, 1, 35),
    (10, 15, 2),
    (11, 4, 61),
    (12, 3, 61),
    (13, 5, 61),
    (14, 2, 15),
    (15, 1, 5),
    (1, 2, 81),
    (2, 3, 18),
    (3, 4, 78),
    (4, 5, 73),
    (5, 15, 98),
    (6, 1, 15),
    (7, 2, 37),
    (8, 3, 19),
    (9, 4, 83),
    (10, 5, 7),
    (11, 15, 71),
    (12, 1, 91),
    (13, 2, 62),
    (14, 3, 10),
    (15, 4, 50),
    (1, 15, 71),
    (2, 15, 71),
    (3, 15, 71),
    (4, 15, 71),
    (5, 3, 61),
    (6, 3, 61),
    (7, 3, 61),
    (8, 3, 61),
    (9, 3, 61);
    
    

select * from passagem;

select * from estacao join linha on fkLinha = idLinha;

select * from catraca join estacao on fkEstacao = fkLinha;

select * from passagem join catraca on fkCatraca = idCatraca;

select sum(registro), nomeLinha from passagem join linha on fkLinha = idLinha  where nomeLinha = 'Azul';

select sum(registro), nomeLinha from passagem join linha on fkLinha = idLinha where nomeLinha = 'Verde';

select sum(registro), nomeLinha from passagem join linha on fkLinha = idLinha where nomeLinha = 'Vermelha';

select sum(registro), nomeLinha from passagem join linha on fkLinha = idLinha where nomeLinha = 'Amarela';

select sum(registro), nomeLinha from passagem join linha on fkLinha = idLinha where nomeLinha = 'Lilás';

select sum(registro), nomeLinha from passagem join linha on fkLinha = idLinha where nomeLinha = 'Prata';
