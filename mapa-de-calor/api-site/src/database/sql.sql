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
	eixo_y varhcar(45),
	raio int
);

insert into sensor (nome_sensor, eixo_x, eixo_y, raio) values
('Local 1', 140, 150, 150),
('Local 2', 150, 160, 150),
('Local 3', 160, 170, 150),
('Local 4', 180, 190, 150),
('Local 5', 190, 110, 150),
('Local 6', 140, 140, 150);

select * from medida_presenca;

select count(*) from medida_presenca where is_present = 1;

select count(*) as total, id_sensor as sensor from medida_presenca where is_present = 1 
	 and CAST(date_moviment as time) between '00:00' and '01:35' 
		group by id_sensor;