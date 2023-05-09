CREATE DATABASE projetoIndividual;

CREATE TABLE nbaTime(
idNbaTime int primary key auto_increment,
nome varchar(45)
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
    
INSERT INTO usuario VALUES
	(null, 'Davidnms', 'davidnicolas@sptech.school', 'teste123', 2),
    (null, 'RenataSs', 'renatasantos@hotmail.com', 'teste321', 1),
    (null, 'MatheusOli', 'matheusoliveira@gmail.com', 'teste132', 2),
    (null, 'JoaoSilv', 'joaosilva@outlook.com', 'teste213', 3);
    
SELECT * FROM nbaTime;
SELECT * FROM usuario;
SELECT * FROM usuario JOIN nbaTime ON fkNbaTime = idNbaTime;
SELECT 
u.nomeUsuario as 'Nome de usuario',
nba.nome as 'Time que torce' FROM usuario as u JOIN nbaTime as nba ON fkNbaTime = idNbaTime;