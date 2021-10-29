create database sprint2;
use sprint2;

-- Criação da tabela de cadastro da empresa --
create table cadastroEmpresa(
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar(60) not null,
    CNPJ varchar(20) not null,
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
) auto_increment = 100;

-- Criação de uma chave estrangeira ligando a tabela estacao com a tabela linha
alter table estacao add foreign key (fkLinha) references linha (idLinha);

desc estacao;


-- Por uma questão de segurança criamos a tabela catraca para sabermos onde ela está caso não esteja funcionando corretamente --
create table catraca(
idCatraca int primary key auto_increment,
fkEstacao int,
statusCatraca varchar(30),
check (statusCatraca = 'ativa' or statusCatraca = 'inativa' )
) auto_increment = 1000;

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
alter table passagem add foreign key (fkEstacao) references estacao(idEstacao);



-- Criação de uma tabela dos locais da estação, para um futuro mapa térmico --
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
	(100, 'ativa'),
	(101, 'ativa'),
	(102, 'ativa'),
	(103, 'ativa'),
	(104, 'ativa'),
	(105, 'ativa'),
	(106, 'ativa'),
	(107, 'ativa'),
	(108, 'ativa'),
	(109, 'ativa'),
	(110, 'ativa'),
	(111, 'ativa'),
	(112, 'ativa'),
	(113, 'ativa'),
	(114, 'ativa'),
	(115, 'ativa'),
	(116, 'ativa'),
	(117, 'ativa'),
	(118, 'ativa'),
	(119, 'ativa'),
	(120, 'ativa'),
	(121, 'ativa'),
	(122, 'ativa'),
	(123, 'ativa'),
	(124, 'ativa'),
	(125, 'ativa'),
	(126, 'ativa'),
	(127, 'ativa'),
	(128, 'ativa'),
	(129, 'ativa'),
	(130, 'ativa'),
	(131, 'ativa'),
	(132, 'ativa'),
	(133, 'ativa'),
	(134, 'ativa'),
	(135, 'ativa'),
	(136, 'ativa'),
	(137, 'ativa'),
	(138, 'ativa'),
	(139, 'ativa'),
	(140, 'ativa'),
	(141, 'ativa'),  
	(142, 'ativa');  
  
select * from catraca;



insert into passagem (fkCatraca, fkLinha, fkEstacao) values
	(1000, 1, 100),
    (1001, 2, 101),
    (1002, 3, 102),
    (1003, 4, 103),
    (1004, 5, 104),
    (1005, 15, 105),
    (1006, 2, 106),
    (1007, 1, 107),
    (1008, 1, 108),
    (1009, 15, 109),
    (1010, 4, 110),
    (1011, 3, 100),
    (1012, 5, 101),
    (1013, 2, 102),
    (1014, 1, 103),
    (1015, 2, 104),
    (1016, 3, 105),
    (1017, 4, 106),
    (1018, 5, 107),
    (1019, 15, 108),
    (1020, 1, 109),
    (1021, 2, 110),
    (1022, 3, 100),
    (1023, 4, 102),
    (1024, 5, 103),
    (1025, 15, 104),
    (1026, 1, 105),
    (1027, 2, 106),
    (1028, 3, 107),
    (1029, 4, 108),
    (1030, 15, 109),
    (1031, 15, 110),
    (1032, 15, 100),
    (1033, 15, 101),
    (1034, 3, 102),
    (1035, 3, 103),
    (1036, 3, 104),
    (1037, 3, 105),
    (1038, 3, 105),
    (1039, 3, 104),
    (1040, 3, 104),
    (1041, 3, 101),
    (1042, 3, 102),
    (1000, 3, 102),
    (1001, 4, 103),
    (1002, 4, 109),
    (1003, 2, 109),
    (1004, 1, 108),
    (1005, 5, 106);

    
    
select * from passagem;



-- Exibindo as tabelas com suas correspondentes
select * from cadastroEmpresa join loginEmpresa on fkCadastro = idEmpresa; 

select * from estacao join linha on fkLinha = idLinha;

select * from catraca join estacao on fkEstacao = idEstacao;

select * from passagem join catraca on fkCatraca = idCatraca;


-- Exibindo o volume de pessoas em cada linha

select sum(registro) as 'volume de pessoas', nomeLinha as Linha from passagem join linha on fkLinha = idLinha  where nomeLinha = 'Azul';

select sum(registro) as 'volume de pessoas', nomeLinha as Linha from passagem join linha on fkLinha = idLinha where nomeLinha = 'Verde';

select sum(registro) as 'volume de pessoas', nomeLinha as Linha from passagem join linha on fkLinha = idLinha where nomeLinha = 'Vermelha';

select sum(registro) as 'volume de pessoas', nomeLinha as Linha from passagem join linha on fkLinha = idLinha where nomeLinha = 'Amarela';

select sum(registro) as 'volume de pessoas', nomeLinha as Linha from passagem join linha on fkLinha = idLinha where nomeLinha = 'Lilás';

select sum(registro) as 'volume de pessoas', nomeLinha as Linha from passagem join linha on fkLinha = idLinha where nomeLinha = 'Prata';



-- Exibindo o volume de pessoas em cada estação


select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '100';

select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '101';

select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '102';

select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '103';

select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '104';

select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '105';

select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '106';

select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '107';

select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '108';

select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '109';
    
select sum(registro) as 'volume de pesssoas', nomeEstacao as Estação from passagem 
	join estacao on fkEstacao = idEstacao where fkEstacao = '110';

