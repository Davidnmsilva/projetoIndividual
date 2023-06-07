DROP DATABASE IF exists projetoindividual;
CREATE DATABASE projetoIndividual;

USE projetoIndividual;

CREATE TABLE nbaTime(
idTime int primary key auto_increment,
nome varchar(45),
conferencia varchar(45), constraint chkConferencia CHECK(conferencia in('Leste', 'Oeste')),
offRtg decimal(4,1),
defRtg decimal(4,1),
ptsG decimal(4,1),
oppPtsG decimal(4,1),
pace decimal(4,1),
unique key nome(nome)
);

CREATE TABLE usuario(
idUsuario int primary key auto_increment,
nome varchar(45) not null,
email varchar(60) not null,
senha varchar(30) not null,
fkTime int,
foreign key (fkTime) references nbaTime (idTime),
unique key email(email)
);


CREATE TABLE estatisticas(
idEstatistica int primary key auto_increment,
rebotes DECIMAL(4,2),
assistencias DECIMAL(4,2),
roubadas DECIMAL(4,2),
tocos DECIMAL(4,2),
turnovers DECIMAL(4,2),
faltas DECIMAL(4,2),
pontos DECIMAL(4,2)
);

CREATE TABLE jogador(
idJogador int primary key auto_increment,
nome varchar(45),
posicao varchar(2),
fkTime INT,
FOREIGN KEY (fkTime) REFERENCES nbaTime(idTime),
fkEstatistica INT,
FOREIGN KEY (fkEstatistica) REFERENCES estatisticas(idEstatistica)
);

CREATE TABLE mural (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(400),
	fkUsuario INT,
	FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
);

INSERT INTO nbaTime VALUES
	(null, 'Atlanta Hawks', 'Leste', 116.6, 116.3, 118.4, 118.1, 100.7),
    (null, 'Boston Celtics', 'Leste', 118.0, 111.5, 117.9, 111.4, 098.5),
    (null, 'Brooklyn Nets', 'Leste', 115.0, 114.1, 113.4, 112.5, 098.3),
    (null, 'Charlotte Hornets', 'Leste', 109.2, 115.3, 111.0, 117.2, 100.8),
    (null, 'Chicago Bulls', 'Leste', 113.5, 112.2, 113.1, 111.8, 098.5),
    (null, 'Cleveland Cavaliers', 'Leste', 116.1, 110.6, 112.3, 106.9, 95.7),
    (null, 'Dallas Mavericks', 'Oeste', 116.8, 116.7, 114.2, 114.1, 96.6),
    (null, 'Denver Nuggets', 'Oeste', 117.6, 114.2, 115.8, 112.5, 98.1),
    (null, 'Detroit Pistons', 'Leste', 110.7, 118.9, 110.3, 118.5, 99.0),
    (null, 'Golden State Warriors', 'Oeste', 116.1, 114.4, 118.9, 117.1, 101.6),
    (null, 'Houston Rockets', 'Oeste', 111.4, 119.3, 110.7, 118.6, 99.0),
    (null, 'Indiana Pacers', 'Leste', 114.6, 117.7, 116.3, 119.5, 101.1),
    (null, 'Los Angeles Clippers', 'Oeste', 115.0, 114.5, 113.6, 113.1, 98.0),
    (null, 'Los Angeles Lakers', 'Oeste', 114.5, 113.9, 117.2, 116.6, 101.3),
    (null, 'Memphis Grizzlies', 'Oeste', 115.1, 111.2, 116.9, 113.0, 101.1),
    (null, 'Miami Heat', 'Leste', 113.0, 113.3, 109.5, 109.8, 96.3),
    (null, 'Milwaukee Bucks', 'Leste', 115.4, 111.9, 116.9, 113.3, 100.5),
    (null, 'Minnesota Timberwolves', 'Oeste', 113.7, 113.8, 115.8, 115.8, 101.0),
    (null, 'New York Knicks', 'Leste', 117.8, 114.8, 116.0, 113.1, 97.1),
    (null, 'New Orleans Pelicans', 'Oeste', 114.4, 112.5, 114.4, 112.5, 99.1),
    (null, 'Oklahoma City Thunder', 'Oeste', 115.2, 114.2, 117.5, 116.4, 101.1),
    (null, 'Orlando Magic', 'Leste', 111.6, 114.2, 111.4, 114.0, 99.3),
    (null, 'Philadelphia 76ers', 'Leste', 117.7, 113.3, 115.2, 110.9, 96.9),
    (null, 'Phoenix Suns', 'Oeste', 115.1, 113.0, 113.6, 111.6, 98.2),
    (null, 'Portland Trail Blazers', 'Oeste', 115.1, 113.0, 113.6, 111.6, 98.2),
    (null, 'Sacramento Kings', 'Oeste', 119.4, 116.8, 120.7, 118.1, 100.3),
    (null, 'San Antonio Spurs', 'Oeste', 110.2, 120.0, 113.0, 123.1, 101.6),
    (null, 'Toronto Raptors', 'Leste', 115.5, 114.0, 112.9, 111.4, 97.1),
    (null, 'Utah Jazz', 'Oeste', 115.8, 116.7, 117.1, 118.0, 100.5),
    (null, 'Washington Wizards', 'Leste', 114.4, 115.6, 113.2, 114.4, 98.6);
    
-- Atlanta Hawks
INSERT INTO estatisticas VALUES
	(null, 5.3, 6.1, 1.5, 0.3, 2.2, 1.4, 20.5),
    (null, 3.0, 10.2, 1.1,	0.1, 4.1, 1.4, 26.2),
    (null, 3.1, 2.8,	0.8, 0.3, 1.2, 1.6,	14.0),
    (null, 4.2,	1.4, 0.5, 0.3,	1.2, 3.0, 15.4),
    (null, 6.5, 1.2, 0.6, 1.0, 1.1, 3.1, 13.1);
    
INSERT INTO jogador VALUES
	(null, "Trae Young", "PG", 1, 1),
    (null, "Dejounte Murray", "SG", 1, 2),
    (null, "Bogdan Bogdanovic", "SF", 1, 3),
    (null, "DeAndre Hunter", "PF", 1, 4),
    (null, "John Collins", "C", 1, 5);
   
-- Boston Celtics
INSERT INTO estatisticas VALUES
	(null,  3.1, 6.3, 1.5,	0.4, 2.3, 2.8, 11.5),
    (null, 6.9, 3.5, 1.1,	0.4, 2.9, 2.6, 26.6),
    (null, 8.8, 4.6, 1.1, 0.7, 2.9, 2.2, 30.1),
    (null, 6.2, 3.0, 0.5, 1.0, 0.6, 1.9, 9.8),
    (null, 8.3,	1.4, 0.6, 1.4, 1.0,	1.9, 8.0);

INSERT INTO jogador VALUES
	(null, "Marcus Smart", "PG", 2, 6),
    (null, "Jaylen Brown", "SG", 2, 7),
    (null, "Jayson Tatum", "SF", 2, 8),
    (null, "Al Horford", "PF", 2, 9),
    (null, "Robert Williams", "C", 2, 10);
    
-- Brooklyn Nets
INSERT INTO estatisticas VALUES
	(null,  4.1,	9.1,	1.1,	0.3,	2.1,	2.4,	16.5),
    (null, 4.5,	2.7,	1.0,	0.6,	1.8,	1.6,	26.1),
    (null, 5.1,	3.7,	0.9,	0.6,	1.5,	3.1,	8.8),
    (null, 4.8,	2.1,	1.4,	0.3,	1.1,	2.2,	16.6),
    (null, 9.2,	1.9,	0.9,	2.5,	1.3,	2.8,	12.6);

INSERT INTO jogador VALUES
	(null, "Spencer Dinwiddie", "PG", 3, 11),
	(null, "Mikal Bridges", "SG", 3, 12),
    (null, "Royce O'Neal", "SF", 3, 13),
    (null, "Cameron Johnson", "PF", 3, 14),
    (null, "Nic Claxton", "C", 3, 15);
    
-- Charlotte Hornets
INSERT INTO estatisticas VALUES
	(null,  4.1,	5.1,	1.2,	0.3,	2.1,	1.9,	21.1),
    (null, 6.4,	8.4,	1.3,	0.3,	3.6,	3.3,	23.3),
    (null, 4.9,	2.4,	0.9,	1.1,	1.5,	2.6,	15.7),
    (null, 4.3,	4.1,	0.8,	0.2,	2.0,	1.4,	14.7),
    (null, 5.2,	1.1,	1.4,	0.4,	1.3,	2.9,	20.3);
    
INSERT INTO jogador VALUES
    (null, "Terry Rozier", "PG", 4, 16),
	(null, "Lamelo Ball", "SG", 4, 17),
    (null, "P.J. Washington", "SF", 4, 18),
    (null, "Gordon Hayward", "PF", 4, 19),
    (null, "Kelly Oubre Jr.", "C", 4, 20);
    
-- Chicago Bulls
INSERT INTO estatisticas VALUES
	(null, 2.9,	2.9,	1.5,	0.7,	1.1,	2.4,	5.6),
    (null, 4.6,	5.1,	1.1,	0.5,	2.1,	2.5,	24.5),
    (null, 4.5,	4.2,	0.9,	0.2,	2.5,	2.1,	24.8),
    (null, 4.0,	1.2,	0.9,	0.9,	1.2,	1.8,	10.2),
    (null, 11.0,	3.2,	0.7,	0.7,	1.7,	2.2,	17.6);

INSERT INTO jogador VALUES
    (null, "Alex Caruso", "PG", 5, 21),
	(null, "Demar DeRozan", "SG", 5, 22),
    (null, "Zach LaVine", "SF", 5, 23),
    (null, "Patrick Williams", "PF", 5, 24),
    (null, "Nikola Vucevic", "C", 5, 25);
    
-- Cleveland Cavaliers
INSERT INTO estatisticas VALUES
	(null, 2.7,	7.8,	1.2,	0.1,	2.9,	2.1,	21.6),
    (null, 4.3,	4.4,	1.5,	0.4,	2.6,	2.5,	28.3),
    (null, 2.5,	1.1,	0.7,	0.4,	0.6,	2.1,	6.4),
    (null, 9.0,	2.8,	0.8,	1.5,	1.8,	2.8,	16.2),
    (null, 9.8,	1.7,	0.8,	1.2,	1.4,	2.3,	14.3);

INSERT INTO jogador VALUES
	(null, "Darius Garland", "PG", 6, 26),
	(null, "Donovan Mitchell", "SG", 6, 27),
    (null, "Isaac Okoro", "SF", 6, 28),
    (null, "Evan Mobley", "PF", 6, 29),
    (null, "Jarret Allen", "C", 6, 30);
    
-- Dallas Mavericks
INSERT INTO estatisticas VALUES
	(null, 5.0,	6.0,	1.3,	0.6,	1.9,	2.8,	27.0),
    (null, 8.6,	8.0,	1.4,	0.5,	3.6,	2.5,	32.4),
    (null, 3.5,	1.8,	0.7,	0.2,	0.8,	1.7,	14.4),
    (null, 3.6,	1.4,	0.7,	0.2,	0.5,	2.1,	7.2),
    (null, 4.1,	0.9,	0.6,	0.3,	0.9,	2.8,	6.7);

INSERT INTO jogador VALUES
	(null, "Kyrie Irving", "PG", 7, 31),
	(null, "Luka Doncic", "SG",  7, 32),
    (null, "Tim Hardaway Jr.", "SF"	, 7, 33),
    (null, "Reggie Bullock", "PF", 7, 34),
    (null, "Dwight Powell", "C", 7, 35);
    
-- Denver Nuggets
INSERT INTO estatisticas VALUES
	(null, 4.0,	6.2,	1.0,	0.2,	2.2,	1.6,	20.0),
    (null, 9.0,	2.8,	0.8,	1.5,	1.8,	2.8,	16.2),
    (null, 5.5,	1.0,	0.6,	0.5, 1.1,	1.9,	17.4),
    (null, 6.6,	3.0,	0.8,	0.8,	1.4,	1.9,	16.3),
    (null, 11.8,	9.8,	1.3,	0.7,	3.6,	2.5,	24.5);
    
    INSERT INTO jogador VALUES
    (null, "Jamal Murray", "PG", 8, 36),
    (null, "Kentavious Cladwll-Pope", "SG", 8, 37),
    (null, "Michael Porter Jr", "SF", 8, 38),
    (null, "Aaron Gordon", "PF", 8, 39),
    (null, "Nikola Jokic", "C", 8, 40);
    
-- Detroit Pistons
INSERT INTO estatisticas VALUES
	(null, 5.5,	5.6,	1.2,	0.7,	3.7,	3.1,	17.4),	
    (null, 3.9,	5.2,	0.8,	0.2,	3.2,	3.3,	16.3),
    (null, 3.8,	2.6,	0.6,	0.1,	2.3,	1.9,	21.6),
    (null, 8.1,	1.4,	0.4,	0.7,	1.4,	2.7,	11.3),
    (null, 8.1,	0.7,	0.2,	0.8,	1.5,	2.9,	12.7);

INSERT INTO jogador VALUES
    (null, "Cade Cunningham", "PG", 9, 41),
    (null, "Jaden Ivey", "SG", 9, 42),
    (null, "Bojan Bogdanovic", "SF", 9, 43),
    (null, "Isaiah Stewart", "PF", 9, 44),
    (null, "James Wiseman", "C", 9, 45);

-- Golden State Warriors 
INSERT INTO estatisticas VALUES
	(null, 6.1,	6.3,	0.9,	0.4,	3.2,	2.1,	29.4),
    (null, 4.1,	2.4,	0.7,	0.4,	1.8,	1.9,	21.9),
    (null, 5.0,	2.3,	1.2,	0.8,	1.3,	2.9,	17.1),
    (null, 7.2,	6.8,	1.0,	0.8,	2.8,	3.1,	8.5),
    (null, 9.3,	2.5,	0.6,	0.6,	0.5,	2.7,	7.0);

    INSERT INTO jogador VALUES
	(null, "Stephen Curry", "PG", 10, 46),
    (null, "Klay Thompson", "SG", 10, 47),
    (null, "Andrew Wiggins", "SF", 10, 48),
    (null, "Draymond Green", "PF", 10, 49),
    (null, "Kevon Looney", "C", 10, 50);
    
-- Houston Rockets 
INSERT INTO estatisticas VALUES
	(null, 5.3,	5.7,	1.4,	0.3,	3.2,	2.6,	19.2),
    (null, 3.7,	3.7,	0.8,	0.2,	2.6,	1.7,	22.1),
    (null, 7.2,	1.3,	0.5,	0.9,	1.3,	2.9,	12.8),
    (null, 5.5,	1.5,	0.5,	0.4,	1.1,	1.8,	12.7),
    (null, 9.0, 3.9,	0.9,	0.9,	2.6,	3.4,	14.8);
    
INSERT INTO jogador VALUES
	(null, "Kevin Porter Jr.", "PG", 11, 51),
    (null, "Jalen Green", "SG", 11, 52),
    (null, "Jabari Smith Jr.", "SF", 11, 53),
    (null, "Kenyon Martin Jr.", "PF", 11, 54),
    (null, "Alperen Sengun", "C", 11, 55);
    
-- Indiana Pacers
INSERT INTO estatisticas VALUES
	(null, 3.7,	10.4,	1.6,	0.4,	2.5,	1.2,	20.7),
    (null, 5.0,	2.8,	1.2,	0.3,	1.7,	2.0,	16.8),
    (null, 4.1,	1.5,	0.6,	0.2,	1.9,	2.1,	16.7),
    (null, 4.7,	2.1,	0.5,	0.3,	1.3,	1.7,	13.0),
    (null, 7.5,	1.4,	0.6,	2.3,	1.7,	3.5,	18.0);
    
INSERT INTO jogador VALUES
	(null, "Tyrese Haliburton", "PG", 12, 56),
    (null, "Buddy Hield", "SG", 12, 57),
    (null, "Bennedict Mathurin", "SF", 12, 58),
    (null, "Jordan Nwora", "PF", 12, 59),
    (null, "Myles Turner", "C", 12, 60);

-- Los Angeles Clippers
INSERT INTO estatisticas VALUES
	(null, 4.9,	7.6,	1.1,	0.5,	3.4,	2.0,	15.8),
    (null, 6.1,	5.1,	1.5,	0.4,	3.1,	2.8,	23.8),
    (null, 6.5,	3.9,	1.4,	0.5,	1.7,	1.6,	23.8),
    (null, 4.0,	1.8,	0.6,	0.3,	0.9,	2.1,	11.2),
    (null, 9.9,	1.0,	0.4,	1.3,	1.5,	2.9,	10.8);

    INSERT INTO jogador VALUES
    (null, "Russell Westbrook", "PG", 13, 61),
	(null, "Paul George", "SG", 13, 62),
    (null, "Kawhi Leonard", "SF", 13, 63),
    (null, "Marcus Morris", "PF", 13, 64),
    (null, "Ivica Zubac", "C", 13, 65);
    
-- Los Angeles Lakers
INSERT INTO estatisticas VALUES
	(null, 2.5,	4.5,	0.8,	0.2,	1.7,	2.2,	12.6),
    (null, 2.9,	6.1,	0.6,	0.5,	2.3,	1.4,	17.4),
    (null, 3.0,	3.4,	0.5,	0.3,	1.5,	1.7,	13.0),
    (null, 8.3,	6.8,	0.9,	0.6,	3.2,	1.6,	28.9),
    (null, 12.5,	2.6,	1.1,	2.0,	2.2,	2.6,	25.9);

    INSERT INTO jogador VALUES
    (null, "Dennis Schröder", "PG", 14, 66),
    (null, "D'Angelo Russell", "SG", 14, 67),
	(null, "Austin Reaves", "SF", 14, 68),
	(null, "LeBron James", "PF", 14, 69),
    (null, "Anthony Davis", "C", 14, 70);

-- Memphis Grizzlies
INSERT INTO estatisticas VALUES
	(null, 5.9,	8.1,	1.1,	0.3,	3.4,	1.6,	26.2),
    (null, 5.0,	4.4,	1.0,	0.4,	2.2,	2.6,	21.5),
    (null, 3.3,	2.6,	0.9,	0.2,	1.4,	3.3,	14.3),
    (null, 6.8,	1.0,	1.0,	3.0,	1.7,	3.6,	18.6),
    (null, 11.5,	2.3,	0.9,	1.1,	1.9,	2.3,	8.6);
    
    INSERT INTO jogador VALUES
    (null, "Ja Morant", "PG", 15, 71),
    (null, "Desmond Bane", "SG", 15, 72),
    (null, "Dillon Brooks", "SF", 15 , 73),
	(null, "Jaren Jackson Jr.", "PF", 15, 74),
    (null, "Steven Adams", "C", 15, 75);

-- Miami Heat
INSERT INTO estatisticas VALUES
	(null, 4.1,	5.1,	1.0,	0.4,	1.9,	2.6,	11.2),
    (null, 5.4,	4.2,	0.8,	0.2,	2.4,	1.5,	20.1),
    (null, 4.8,	1.6,	1.0,	0.4,	1.1,	2.0,	9.6),
    (null, 5.9,	5.3,	1.8,	0.3,	1.6,	1.3,	22.9),
    (null, 9.2,	3.2,	1.2,	0.8,	2.5,	2.8,	20.4);

    INSERT INTO jogador VALUES
	(null, "Kyle Lowry", "PG", 16, 76),
    (null, "Tyler Herro", "SG", 16, 77),
    (null, "Caleb Martin", "SF", 16, 78),
    (null, "Jimmy Butler", "PF", 16, 79),
    (null, "Bam Adebayo", "C", 16, 80);

-- Milwaukee Bucks
INSERT INTO estatisticas VALUES
	(null, 5.1,	7.4,	1.2,	0.4,	2.9,	1.7,	19.3),
    (null, 3.3,	2.3,	0.9,	0.2,	1.0,	1.6,	10.4),
    (null, 9.6,	1.5,	0.4,	0.2,	1.2,	1.6,	14.1),
    (null, 11.8,	5.7,	0.8,	0.8,	3.9,	3.1,	31.1),
    (null, 6.7,	1.3,	0.5,	2.5,	1.4,	2.6,	15.9);
    
    INSERT INTO jogador VALUES
    (null, "Jrue Holiday", "PG", 17, 81),
    (null, "Grayson Allen", "SG", 17, 82),
    (null, "Bobby Portis", "SF", 17, 83),
	(null, "Giannis Antetokounmpo", "PF", 17, 84),
    (null, "Brook Lopez", "C", 17, 85);

-- Minnesota Timberwolves
INSERT INTO estatisticas VALUES
	(null, 3.1,	5.0,	1.2,	0.2,	1.2,	1.9,	14.0),
    (null, 3.9,	1.9,	0.9,	1.0,	1.4,	3.4,	12.1),
    (null, 5.8,	4.4,	1.6,	0.7,	3.3,	2.4,	24.6),
    (null, 8.1,	4.8,	0.7,	0.6,	3.0,	3.8,	20.8),
    (null, 11.6,	1.2,	0.8,	1.4,	1.7,	3.0,	13.4);
    
    INSERT INTO jogador VALUES
    (null, "Mike Conley", "PG", 18, 86),
    (null, "Jaden McDaniels", "SG", 18, 87),
    (null, "Anthony Edwards", "SF", 18, 88),
	(null, "Karl-Anthony Towns", "PF", 18, 89),
    (null, "Rudy Gobert", "C", 18, 90);

-- New York Knicks
INSERT INTO estatisticas VALUES
	(null, 3.5,	6.2,	0.9,	0.2,	2.1,	2.2,	24.0),
    (null, 7.0,	3.6,	1.4,	0.5,	1.5,	2.5,	10.2),
    (null, 5.0,	2.8,	0.4,	0.2,	2.2,	2.5,	19.6),
    (null, 10.0,	4.1,	0.6,	0.3,	2.8,	3.0,	25.1),
    (null, 9.4,	0.9,	0.9,	1.8,	0.7,	2.7,	7.4);
    
    INSERT INTO jogador VALUES
    (null, "Jalen Brunson", "PG", 19, 91),
    (null, "Josh Hart", "SG", 19, 92),
    (null, "RJ Barrett", "SF", 19, 93),
	(null, "Julius Randle", "PF", 19, 94),
    (null, "Mitchell Robinson", "C", 19, 95);
    
-- New Orleans Pelicans
INSERT INTO estatisticas VALUES
	(null, 4.4,	5.7,	0.9,	0.5,	2.4,	2.0,	20.9),
    (null, 3.6,	1.4,	1.1,	0.5,	0.8,	2.0,	14.5),
    (null, 5.5,	5.8,	0.7,	0.4,	3.3,	2.6,	24.7),
    (null, 4.1,	2.5,	1.6,	0.6,	1.3,	3.2,	9.8),
    (null, 7.0,	4.6,	1.1,	0.6,	3.4,	2.2,	26.0);

INSERT INTO jogador VALUES
    (null, "CJ McCollum", "PG", 20, 96),
    (null, "Trey Murphy III", "SG", 20, 97),
    (null, "Brandom Ingram", "SF", 20, 98),
	(null, "Herbert Jones", "PF", 20, 99),
    (null, "Zion Williamson", "C", 20, 100);
    
-- Oklahoma City Thunder
INSERT INTO estatisticas VALUES
	(null, 4.8,	5.5,	1.6,	1.0,	2.8,	2.8,	31.4),
    (null, 7.9,	6.2,	0.8,	0.4,	2.8,	1.9,	16.6),
    (null, 4.6,	2.1,	1.0,	0.3,	1.2,	3.3,	13.7),
    (null, 4.5,	3.3,	1.4,	0.5,	1.6,	2.5,	14.1),
    (null, 4.9,	2.0,	0.8,	0.3,	0.6,	2.1,	8.0);

INSERT INTO jogador VALUES
    (null, "Shai Gilgeous-Alexander", "PG", 21, 101),
    (null, "Josh Giddey", "SG", 21, 102),
    (null, "Luguentz Dort", "SF", 21, 103),
	(null, "Jalen Williams", "PF", 21, 104),
    (null, "Kenrich Williams", "C", 21, 105);

-- Orlando Magic
INSERT INTO estatisticas VALUES
	(null, 3.9,	5.7,	1.5,	0.4,	2.3,	2.2,	14.0),
    (null, 4.8,	3.9,	0.6,	0.5,	1.5,	2.6,	13.0),
    (null, 6.9,	3.7,	0.8,	0.5,	2.8,	2.2,	20.0),
    (null, 4.1,	3.5,	1.0,	0.2,	2.1,	2.3,	18.6),
    (null, 8.7,	2.3,	0.5,	0.6,	1.9,	2.8,	15.2);
    
INSERT INTO jogador VALUES
    (null, "Markelle Fultz", "PG", 22, 106),
    (null, "Cole Anthony", "SG", 22, 107),
    (null, "Paolo Banchero", "SF", 22, 108),
	(null, "Franz Wagner", "PF", 22, 109),
    (null, "Wendell Carter Jr.", "C", 22, 110);

-- Philadelphia 76ers
INSERT INTO estatisticas VALUES
	(null, 2.9,	3.5,	0.8,	0.1,	1.3,	2.2,	20.3),
    (null, 6.1,	10.7, 1.2,	0.5,	3.4,	1.9,	21.0),
    (null, 5.7,	2.5,	0.9,	0.5,	1.2,	2.0,	14.7),
    (null, 3.9,	0.8,	0.5,	0.2,	0.6,	2.4,	3.5),
    (null, 10.2,	4.2,	1.0,	1.7,	3.4,	3.1,	33.1);

    INSERT INTO jogador VALUES
    (null, "Tyrese Maxey", "PG", 20, 111),
    (null, "James Harden", "SG", 20, 112),
    (null, "Tobias Harris", "SF", 20, 113),
	(null, "P.J. Tucker", "PF", 20, 114),
    (null, "Joel Embiid", "C", 20, 115);

-- Phoenix Suns
INSERT INTO estatisticas VALUES
	(null, 6.4,	3.5,	0.3,	1.3,	2.5,	0.9,	26.0),
    (null, 4.5,	5.5,	1.0,	0.3,	2.7,	3.0,	27.8),
    (null, 5.4,	1.5,	0.6,	0.8,	0.9,	2.3,	7.4),
    (null, 6.4,	3.5,	0.3,	1.3,	2.5,	0.9,	26.0),
    (null, 10.0,	1.7,	0.6,	0.8,	1.8,	2.8,	18.0);

    INSERT INTO jogador VALUES
    (null, "Chris Paul", "PG", 21, 116),
    (null, "Devin Booker", "SG", 21, 117),
    (null, "Torrey Craig", "SF", 21, 118),
	(null, "Kevin Durant", "PF", 21, 119),
    (null, "Deandre Ayton", "C", 21, 120);
    
-- Portland Trail Blazers
INSERT INTO estatisticas VALUES
	(null, 4.8,	7.3,	0.9,	0.3,	3.3,	1.9,	32.2),
    (null, 2.6,	4.1,	0.7,	0.2,	2.1,	2.3,	21.1),
    (null, 3.0,	1.2,	0.5,	0.3,	1.0,	1.7,	9.9),
    (null, 4.5,	2.4,	0.8,	0.8,	1.8,	2.4,	20.5),
    (null, 9.1,	2.9,	0.8,	0.8,	2.3,	3.6,	13.3);
    
INSERT INTO jogador VALUES
    (null, "Damian Lillard", "PG", 121),
    (null, "Anfernee Simons", "SG", 122),
    (null, "Shaedon Sharpe", "SF", 123),
	(null, "Jerami Grant", "PF", 124),
    (null, "Jusuf Nurkic", "C", 125);
    
-- Sacramento Kings
INSERT INTO estatisticas VALUES
	(null, 4.2,	6.1,	1.1,	0.3,	2.5,	2.4,	25.0),
    (null, 3.3,	2.9,	1.1,	0.3,	1.3,	2.4,	15.2),
    (null, 4.5,	1.6,	0.7,	0.1,	1.0,	1.3,	15.0),
    (null, 4.6,	1.2,	0.8,	0.5,	0.8,	2.0,	12.2),
    (null, 12.3,	7.3,	0.8,	0.5,	2.9,	3.5,	19.1);

    INSERT INTO jogador VALUES
    (null, "De'Aaron Fox", "PG", 22, 126),
    (null, "Kevin Huerter", "SG", 22, 127),
    (null, "Harrison Barnes", "SF", 22, 128),
	(null, "Keegan Murray", "PF", 22, 129),
    (null, "Domantas Sabonis", "C", 22, 130);
    

-- San Antonio Spurs
INSERT INTO estatisticas VALUES
	(null, 3.6,	6.6,	1.3,	0.1,	1.6,	1.4,	12.9),
    (null, 3.9,	3.6,	1.1,	0.4,	1.5,	1.5,	18.5),
    (null, 5.0,	2.9,	0.7,	0.2,	2.1,	2.0,	22.0),
    (null, 5.3,	2.5,	0.8,	0.4,	1.7,	2.5,	11.0),
    (null, 6.4,	2.9,	0.6,	0.8,	2.0,	3.2,	11.6);
    
INSERT INTO jogador VALUES
    (null, "Tre Jones", "PG", 27, 131),
    (null, "Devin Vassell", "SG", 27, 132),
    (null, "Keldon Johnson", "SF", 27, 133),
	(null, "Jeremy Sochan", "PF", 27, 134),
    (null, "Zach Collins", "C", 27, 135);

-- Toronto Raptors
INSERT INTO estatisticas VALUES
	(null, 4.1,	7.2,	1.8,	0.6,	2.0,	2.8,	19.3),
    (null, 5.0,	2.0,	1.9,	0.7,	2.0,	3.0,	16.8),
    (null, 6.6,	4.8,	1.1,	0.8,	2.0,	2.2,	15.3),
    (null, 7.8,	5.8,	0.9,	0.5,	2.4,	3.2,	24.2),
    (null, 9.1,	2.2,	1.2,	1.3,	1.1,	3.0,	13.1);
    
INSERT INTO jogador VALUES
    (null, "Fred VanVleet", "PG", 28, 136),
    (null, "OG Anunoby", "SG", 28, 137),
    (null, "Scottie Barnes", "SF", 28, 138),
	(null, "Pascal Siakam", "PF", 28, 139),
    (null, "Jakob Poeltl", "C", 28, 140);

-- Utah Jazz
INSERT INTO estatisticas VALUES
	(null, 2.2,	2.9,	0.6,	0.1,	1.8,	2.3,	14.3),
    (null, 4.0,	4.4,	0.5,	0.2,	3.0,	2.0,	20.8),
    (null, 8.6,	1.9,	0.6,	0.6,	1.9,	2.1,	25.6),
    (null, 6.2,	3.7,	0.9,	0.5,	2.5,	3.4,	12.5),
    (null, 9.1,	2.2,	1.2,	1.3,	1.1,	3.0,	13.1);
    
INSERT INTO jogador VALUES
    (null, "Collin Sexton", "PG", 29, 141),
    (null, "Jordan Clarkson", "SG", 29, 142),
    (null, "Lauri Markkanen", "SF", 29, 143),
	(null, "Kelly Olynyk", "PF", 29, 144),
    (null, "Walker Kessler", "C", 29, 145);

-- Washington Wizards
INSERT INTO estatisticas VALUES
	(null, 3.4,	5.3,	0.7,	0.2,	1.0,	1.2,	10.3),
    (null, 3.9,	5.4,	0.9,	0.7,	2.9,	2.1,	23.2),
    (null, 7.2,	3.7,	0.6,	0.5,	3.0,	2.3,	21.2),
    (null, 8.4,	2.7,	0.9,	1.5,	2.1,	3.0,	23.2),
    (null, 5.6,	1.1,	0.4,	1.3,	1.1,	2.4,	9.0);
    
INSERT INTO jogador VALUES
    (null, "Monte Morris", "PG", 30, 146),
    (null, "Bradley Beal", "SG", 30, 147),
    (null, "Kyle Kuzma", "SF", 30, 148),
	(null, "Kristaps Porzingis", "PF", 30, 149),
    (null, "Daniel Gafford", "C", 30, 150);
    
SELECT * FROM nbaTime;
SELECT * FROM usuario;
SELECT * FROM usuario JOIN nbaTime ON fkTime = idTime;