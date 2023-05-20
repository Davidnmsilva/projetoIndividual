CREATE DATABASE projetoIndividual;

USE projetoIndividual;

CREATE TABLE nbaTime(
idNbaTime int primary key auto_increment,
nome varchar(45),
conferencia varchar(45), constraint chkConferencia check (conferencia in ("Leste", "Oeste"))
);

CREATE TABLE usuario(
idUsuario int primary key auto_increment,
nomeUsuario varchar(45) not null,
email varchar(60) not null,
senha varchar(30) not null,
fkNbaTime int,
foreign key (fkNbaTime) references nbaTime (idNbaTime)
);

INSERT INTO nbaTime VALUES
	(null, 'Atlanta Hawks'),
    (null, 'Boston Celtics'),
    (null, 'Los Angeles Lakers');
    
SELECT * FROM nbaTime;
SELECT * FROM usuario;
SELECT * FROM usuario JOIN nbaTime ON fkNbaTime = idNbaTime;
SELECT 
u.nomeUsuario as 'Nome de usuario',
nba.nome as 'Time que torce' FROM usuario as u JOIN nbaTime as nba ON fkNbaTime = idNbaTime;