-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para sql server - remoto - produção */

create database acquatec;

use acquatec;

create table medida_presenca(
	id int primary key auto_increment,
    is_present int,
    date_moviment datetime,
	id_sensor int
);

create table sensor(
	id int primary key auto_increment,
	nome_sensor varchar(45),
	eixo_x varchar(45),
	eixo_y varchar(45),
	raio int
);

insert into sensor (nome_sensor, eixo_x, eixo_y, raio) values
('Local 1', 115, 70, 150),
('Local 2', 115, 123, 150),
('Local 3', 118, 175, 150),
('Local 4', 120, 224, 150),
('Local 5', 119, 271, 150),
('Local 6', 350, 140, 150),
('Local 7', 520, 100, 150),
('Local 8', 690, 100, 150),
('Local 9', 765, 242, 150),
('Local 10', 140, 140, 150),
('Local 11', 140, 140, 150),
('Local 12', 140, 140, 150),
('Local 13', 140, 140, 150),

X E Y NA ORDEM CRESCENTE
x:  y:, 
x: , y:,
x: , y:,
x: , y:,
x: , y:,
x: , y:,
x: , y:,
x: , y:,
x: , y:,
{x: 765, y:340
{x: 550, y:390
{x: 105, y:380
{x: 320, y:400

RADIUS NA ORDEM CRESCENTE
 45,};
 40,};
 50,};
 50,};
 50,};
105,};
105,};
105,};
 95,};
 95,};
160,};
120,};
105,};
select * from medida_presenca;

select count(*) from medida_presenca where is_present = 1;

select count(*) as total, id_sensor as sensor from medida_presenca where is_present = 1 
	 and CAST(date_moviment as time) between '00:00' and '01:35' 
		group by id_sensor;