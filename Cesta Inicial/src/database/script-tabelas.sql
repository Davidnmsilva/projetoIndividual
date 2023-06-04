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

CREATE TABLE jogador(
idJogador int primary key auto_increment,
nome varchar(45),
posicao varchar(2),
rebotes DECIMAL(4,2),
assistencias DECIMAL(4,2),
roubadas DECIMAL(4,2),
tocos DECIMAL(4,2),
turnovers DECIMAL(4,2),
faltas DECIMAL(4,2),
pontos DECIMAL(4,2),
fkTime INT,
FOREIGN KEY (fkTime) REFERENCES nbaTime(idTime)
);

CREATE TABLE aviso (
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
INSERT INTO jogador VALUES
	(null, "Trae Young", "PG", 5.3,	6.1, 1.5, 0.3, 2.2,	1.4, 20.5, 1),
    (null, "Dejounte Murray", "SG", 3.0, 10.2, 1.1,	0.1, 4.1, 1.4, 26.2, 1),
    (null, "Bogdan Bogdanovic", "SF", 3.1, 2.8,	0.8, 0.3, 1.2, 1.6,	14.0, 1),
    (null, "DeAndre Hunter", "PF", 4.2,	1.4, 0.5, 0.3,	1.2,	3.0,	15.4, 1),
    (null, "John Collins", "C", 6.5, 1.2,	0.6,	1.0,	1.1,	3.1,	13.1, 1);
   
-- Boston Celtics
INSERT INTO jogador VALUES
	(null, "Marcus Smart", "PG", 3.1, 6.3, 1.5,	0.4, 2.3, 2.8, 11.5, 2),
    (null, "Jaylen Brown", "SG", 6.9, 3.5, 1.1,	0.4, 2.9, 2.6, 26.6, 2),
    (null, "Jayson Tatum", "SF", 8.8, 4.6, 1.1, 0.7, 2.9, 2.2, 30.1, 2),
    (null, "Al Horford", "PF", 6.2, 3.0, 0.5, 1.0, 0.6, 1.9, 9.8, 2),
    (null, "Robert Williams", "C", 8.3,	1.4, 0.6, 1.4, 1.0,	1.9, 8.0, 2);
    
-- Brooklyn Nets
INSERT INTO jogador VALUES
	(null, "Spencer Dinwiddie", "PG", 4.1,	9.1,	1.1,	0.3,	2.1,	2.4,	16.5, 3),
	(null, "Mikal Bridges", "SG", 4.5,	2.7,	1.0,	0.6,	1.8,	1.6,	26.1, 3),
    (null, "Royce O'Neal", "SF", 5.1,	3.7,	0.9,	0.6,	1.5,	3.1,	8.8, 3),
    (null, "Cameron Johnson", "PF", 4.8,	2.1,	1.4,	0.3,	1.1,	2.2,	16.6, 3),
    (null, "Nic Claxton", "C", 9.2,	1.9,	0.9,	2.5,	1.3,	2.8,	12.6, 3);
    
-- Charlotte Hornets
INSERT INTO jogador VALUES
    (null, "Terry Rozier", "PG", 4.1,	5.1,	1.2,	0.3,	2.1,	1.9,	21.1, 4),
	(null, "Lamelo Ball", "SG", 6.4,	8.4,	1.3,	0.3,	3.6,	3.3,	23.3, 4),
    (null, "P.J. Washington", "SF", 4.9,	2.4,	0.9,	1.1,	1.5,	2.6,	15.7, 4),
    (null, "Gordon Hayward", "PF", 4.3,	4.1,	0.8,	0.2,	2.0,	1.4,	14.7, 4),
    (null, "Kelly Oubre Jr.", "C", 5.2,	1.1,	1.4,	0.4,	1.3,	2.9,	20.3, 4);

-- Chicago Bulls
INSERT INTO jogador VALUES
    (null, "Alex Caruso", "PG", 2.9,	2.9,	1.5,	0.7,	1.1,	2.4,	5.6, 5),
	(null, "Demar DeRozan", "SG", 4.6,	5.1,	1.1,	0.5,	2.1,	2.5,	24.5, 5),
    (null, "Zach LaVine", "SF", 4.5,	4.2,	0.9,	0.2,	2.5,	2.1,	24.8, 5),
    (null, "Patrick Williams", "PF", 4.0,	1.2,	0.9,	0.9,	1.2,	1.8,	10.2, 5),
    (null, "Nikola Vucevic", "C", 11.0,	3.2,	0.7,	0.7,	1.7,	2.2,	17.6, 5);
    
-- Cleveland Cavaliers
INSERT INTO jogador VALUES
	(null, "Darius Garland", "PG", 2.7,	7.8,	1.2,	0.1,	2.9,	2.1,	21.6 ,6),
	(null, "Donovan Mitchell", "SG", 4.3,	4.4,	1.5,	0.4,	2.6,	2.5,	28.3, 6),
    (null, "Isaac Okoro", "SF", 2.5,	1.1,	0.7,	0.4,	0.6,	2.1,	6.4 ,6),
    (null, "Evan Mobley", "PF",	9.0,	2.8,	0.8,	1.5,	1.8,	2.8,	16.2, 6),
    (null, "Jarret Allen", "C", 9.8,	1.7,	0.8,	1.2,	1.4,	2.3,	14.3, 6);

-- Dallas Mavericks
INSERT INTO jogador VALUES
	(null, "Kyrie Irving", "PG", 5.0,	6.0,	1.3,	0.6,	1.9,	2.8,	27.0, 7),
	(null, "Luka Doncic", "SG", 8.6,	8.0,	1.4,	0.5,	3.6,	2.5,	32.4, 7),
    (null, "Tim Hardaway Jr.", "SF",	3.5,	1.8,	0.7,	0.2,	0.8,	1.7,	14.4, 7),
    (null, "Reggie Bullock", "PF", 3.6,	1.4,	0.7,	0.2,	0.5,	2.1,	7.2, 7),
    (null, "Dwight Powell", "C", 4.1,	0.9,	0.6,	0.3,	0.9,	2.8,	6.7, 7);
    
-- Denver Nuggets
INSERT INTO jogador VALUES
    (null, "Jamal Murray", "PG", 4.0,	6.2,	1.0,	0.2,	2.2,	1.6,	20.0, 8),
    (null, "Kentavious Cladwll-Pope", "SG",	9.0,	2.8,	0.8,	1.5,	1.8,	2.8,	16.2, 8),
    (null, "Michael Porter Jr", "SF", 5.5,	1.0,	0.6,	0.5, 1.1,	1.9,	17.4, 8),
    (null, "Aaron Gordon", "PF", 6.6,	3.0,	0.8,	0.8,	1.4,	1.9,	16.3, 8),
    (null, "Nikola Jokic", "C", 11.8,	9.8,	1.3,	0.7,	3.6,	2.5,	24.5, 8);

-- Detroit Pistons
INSERT INTO jogador VALUES
    (null, "Cade Cunningham", "PG", 6.2,	6.0,	0.8,	0.6,	3.3,	2.8,	19.9, 9),
    (null, "Jaden Ivey", "SG",	3.9,	5.2,	0.8,	0.2,	3.2,	3.3,	16.3, 9),
    (null, "Bojan Bogdanovic", "SF", 3.8,	2.6,	0.6,	0.1,	2.3,	1.9,	21.6, 9),
    (null, "Isaiah Stewart", "PF", 8.1,	1.4,	0.4,	0.7,	1.4,	2.7,	11.3, 9),
    (null, "James Wiseman", "C", 8.1,	0.7,	0.2,	0.8,	1.5,	2.9,	12.7, 9);

-- Golden State Warriors 
INSERT INTO jogador VALUES
	(null, "Stephen Curry", "PG", 6.1,	6.3,	0.9,	0.4,	3.2,	2.1,	29.4, 10),
    (null, "Klay Thompson", "SG", 4.1,	2.4,	0.7,	0.4,	1.8,	1.9,	21.9, 10),
    (null, "Andrew Wiggins", "SF", 5.0,	2.3,	1.2,	0.8,	1.3,	2.9,	17.1, 10),
    (null, "Draymond Green", "PF", 7.2,	6.8,	1.0,	0.8,	2.8,	3.1,	8.5, 10),
    (null, "Kevon Looney", "C",	9.3,	2.5,	0.6,	0.6,	0.5,	2.7,	7.0, 10);

-- Houston Rockets 
INSERT INTO jogador VALUES
	(null, "Kevin Porter Jr.", "PG", 5.3,	5.7,	1.4,	0.3,	3.2,	2.6,	19.2, 11),
    (null, "Jalen Green", "SG", 3.7,	3.7,	0.8,	0.2,	2.6,	1.7,	22.1, 11),
    (null, "Jabari Smith Jr.", "SF", 7.2,	1.3,	0.5,	0.9,	1.3,	2.9,	12.8, 11),
    (null, "Kenyon Martin Jr.", "PF", 5.5,	1.5,	0.5,	0.4,	1.1,	1.8,	12.7, 11),
    (null, "Alperen Sengun", "C", 9.0, 3.9,	0.9,	0.9,	2.6,	3.4,	14.8, 11);

-- Indiana Pacers 
INSERT INTO jogador VALUES
	(null, "Tyrese Haliburton", "PG", 3.7,	10.4,	1.6,	0.4,	2.5,	1.2,	20.7, 12),
    (null, "Buddy Hield", "SG", 5.0,	2.8,	1.2,	0.3,	1.7,	2.0,	16.8, 12),
    (null, "Bennedict Mathurin", "SF", 4.1,	1.5,	0.6,	0.2,	1.9,	2.1,	16.7, 12),
    (null, "Jordan Nwora", "PF", 4.7,	2.1,	0.5,	0.3,	1.3,	1.7,	13.0, 12),
    (null, "Myles Turner", "C",	7.5,	1.4,	0.6,	2.3,	1.7,	3.5,	18.0, 12);

-- Los Angeles Clippers
INSERT INTO jogador VALUES
    (null, "Russell Westbrook", "PG",	4.9,	7.6,	1.1,	0.5,	3.4,	2.0,	15.8, 13),
	(null, "Paul George", "SG", 6.1,	5.1,	1.5,	0.4,	3.1,	2.8,	23.8, 13),
    (null, "Kawhi Leonard", "SF", 6.5,	3.9,	1.4,	0.5,	1.7,	1.6,	23.8, 13),
    (null, "Marcus Morris", "PF", 4.0,	1.8,	0.6,	0.3,	0.9,	2.1,	11.2, 13),
    (null, "Ivica Zubac", "C", 9.9,	1.0,	0.4,	1.3,	1.5,	2.9,	10.8, 13);
    
-- Los Angeles Lakers
INSERT INTO jogador VALUES
    (null, "Dennis Schröder", "PG", 2.5,	4.5,	0.8,	0.2,	1.7,	2.2,	12.6, 14),
    (null, "D'Angelo Russell", "SG", 2.9,	6.1,	0.6,	0.5,	2.3,	1.4,	17.4, 14),
	(null, "Austin Reaves", "SF", 3.0,	3.4,	0.5,	0.3,	1.5,	1.7,	13.0, 14),
	(null, "LeBron James", "PF", 8.3,	6.8,	0.9,	0.6,	3.2,	1.6,	28.9, 14),
    (null, "Anthony Davis", "C", 12.5,	2.6,	1.1,	2.0,	2.2,	2.6,	25.9, 14);

-- Memphis Grizzlies
INSERT INTO jogador VALUES
    (null, "Ja Morant", "PG", 5.9,	8.1,	1.1,	0.3,	3.4,	1.6,	26.2, 15),
    (null, "Desmond Bane", "SG", 5.0,	4.4,	1.0,	0.4,	2.2,	2.6,	21.5, 15),
    (null, "Dillon Brooks", "SF", 3.3,	2.6,	0.9,	0.2,	1.4,	3.3,	14.3, 15),
	(null, "Jaren Jackson Jr.", "PF", 6.8,	1.0,	1.0,	3.0,	1.7,	3.6,	18.6, 15),
    (null, "Steven Adams", "C", 11.5,	2.3,	0.9,	1.1,	1.9,	2.3,	8.6, 15);

-- Miami Heat
INSERT INTO jogador VALUES
	(null, "Kyle Lowry", "PG", 4.1,	5.1,	1.0,	0.4,	1.9,	2.6,	11.2, 16),
    (null, "Tyler Herro", "SG", 5.4,	4.2,	0.8,	0.2,	2.4,	1.5,	20.1, 16),
    (null, "Caleb Martin", "SF", 4.8,	1.6,	1.0,	0.4,	1.1,	2.0,	9.6, 16),
    (null, "Jimmy Butler", "PF", 5.9,	5.3,	1.8,	0.3,	1.6,	1.3,	22.9, 16),
    (null, "Bam Adebayo", "C", 9.2,	3.2,	1.2,	0.8,	2.5,	2.8,	20.4, 16);

-- Milwaukee Bucks
INSERT INTO jogador VALUES
    (null, "Jrue Holiday", "PG", 5.1,	7.4,	1.2,	0.4,	2.9,	1.7,	19.3, 17),
    (null, "Grayson Allen", "SG", 3.3,	2.3,	0.9,	0.2,	1.0,	1.6,	10.4, 17),
    (null, "Bobby Portis", "SF", 9.6,	1.5,	0.4,	0.2,	1.2,	1.6,	14.1, 17),
	(null, "Giannis Antetokounmpo", "PF", 11.8,	5.7,	0.8,	0.8,	3.9,	3.1,	31.1, 17),
    (null, "Brook Lopez", "C", 6.7,	1.3,	0.5,	2.5,	1.4,	2.6,	15.9, 17);

-- Minnesota Timberwolves
INSERT INTO jogador VALUES
    (null, "Mike Conley", "PG", 3.1,	5.0,	1.2,	0.2,	1.2,	1.9,	14.0, 18),
    (null, "Jaden McDaniels", "SG", 3.9,	1.9,	0.9,	1.0,	1.4,	3.4,	12.1, 18),
    (null, "Anthony Edwards", "SF", 5.8,	4.4,	1.6,	0.7,	3.3,	2.4,	24.6, 18),
	(null, "Karl-Anthony Towns", "PF", 8.1,	4.8,	0.7,	0.6,	3.0,	3.8,	20.8, 18),
    (null, "Rudy Gobert", "C", 11.6,	1.2,	0.8,	1.4,	1.7,	3.0,	13.4, 18);

-- New York Knicks
INSERT INTO jogador VALUES
    (null, "Jalen Brunson", "PG", 3.5,	6.2,	0.9,	0.2,	2.1,	2.2,	24.0, 19),
    (null, "Josh Hart", "SG", 7.0,	3.6,	1.4,	0.5,	1.5,	2.5,	10.2, 19),
    (null, "RJ Barrett", "SF", 5.0,	2.8,	0.4,	0.2,	2.2,	2.5,	19.6, 19),
	(null, "Julius Randle", "PF", 10.0,	4.1,	0.6,	0.3,	2.8,	3.0,	25.1, 19),
    (null, "Mitchell Robinson", "C", 9.4,	0.9,	0.9,	1.8,	0.7,	2.7,	7.4, 19);

-- New Orleans Pelicans
INSERT INTO jogador VALUES
    (null, "CJ McCollum", "PG", 4.4,	5.7,	0.9,	0.5,	2.4,	2.0,	20.9, 20),
    (null, "Trey Murphy III", "SG", 3.6,	1.4,	1.1,	0.5,	0.8,	2.0,	14.5, 20),
    (null, "Brandom Ingram", "SF", 5.5,	5.8,	0.7,	0.4,	3.3,	2.6,	24.7, 20),
	(null, "Herbert Jones", "PF", 4.1,	2.5,	1.6,	0.6,	1.3,	3.2,	9.8, 20),
    (null, "Zion Williamson", "C", 7.0,	4.6,	1.1,	0.6,	3.4,	2.2,	26.0, 20);

-- Oklahoma City Thunder
INSERT INTO jogador VALUES
    (null, "Shai Gilgeous-Alexander", "PG", 4.8,	5.5,	1.6,	1.0,	2.8,	2.8,	31.4, 21),
    (null, "Josh Giddey", "SG", 7.9,	6.2,	0.8,	0.4,	2.8,	1.9,	16.6, 21),
    (null, "Luguentz Dort", "SF", 4.6,	2.1,	1.0,	0.3,	1.2,	3.3,	13.7, 21),
	(null, "Jalen Williams", "PF", 4.5,	3.3,	1.4,	0.5,	1.6,	2.5,	14.1, 21),
    (null, "Kenrich Williams", "C", 4.9,	2.0,	0.8,	0.3,	0.6,	2.1,	8.0, 21);

-- Orlando Magic
INSERT INTO jogador VALUES
    (null, "Markelle Fultz", "PG", 3.9,	5.7,	1.5,	0.4,	2.3,	2.2,	14.0, 22),
    (null, "Cole Anthony", "SG", 4.8,	3.9,	0.6,	0.5,	1.5,	2.6,	13.0, 22),
    (null, "Paolo Banchero", "SF", 6.9,	3.7,	0.8,	0.5,	2.8,	2.2,	20.0, 22),
	(null, "Franz Wagner", "PF", 4.1,	3.5,	1.0,	0.2,	2.1,	2.3,	18.6, 22),
    (null, "Wendell Carter Jr.", "C", 8.7,	2.3,	0.5,	0.6,	1.9,	2.8,	15.2, 22);

-- Philadelphia 76ers
INSERT INTO jogador VALUES
    (null, "Tyrese Maxey", "PG", 3.5,	6.2,	0.9,	0.2,	2.1,	2.2,	24.0, 23),
    (null, "James Harden", "SG", 7.0,	3.6,	1.4,	0.5,	1.5,	2.5,	10.2, 23),
    (null, "Tobias Harris", "SF", 5.0,	2.8,	0.4,	0.2,	2.2,	2.5,	19.6, 23),
	(null, "P.J. Tucker", "PF", 3.9,	0.8,	0.5,	0.2,	0.6,	2.4,	3.5, 23),
    (null, "Joel Embiid", "C", 9.4,	0.9,	0.9,	1.8,	0.7,	2.7,	7.4, 23);

-- Phoenix Suns
INSERT INTO jogador VALUES
    (null, "Chris Paul", "PG", 6.4,	3.5,	0.3,	1.3,	2.5,	0.9,	26.0, 24),
    (null, "Devin Booker", "SG", 4.5,	5.5,	1.0,	0.3,	2.7,	3.0,	27.8, 24),
    (null, "Torrey Craig", "SF", 5.4,	1.5,	0.6,	0.8,	0.9,	2.3,	7.4, 24),
	(null, "Kevin Durant", "PF", 6.4,	3.5,	0.3,	1.3,	2.5,	0.9,	26.0, 24),
    (null, "Deandre Ayton", "C", 10.0,	1.7,	0.6,	0.8,	1.8,	2.8,	18.0, 24);

-- Portland Trail Blazers
INSERT INTO jogador VALUES
    (null, "Damian Lillard", "PG", 4.8,	7.3,	0.9,	0.3,	3.3,	1.9,	32.2, 25),
    (null, "Anfernee Simons", "SG", 2.6,	4.1,	0.7,	0.2,	2.,1	2.3,	21.1, 25),
    (null, "Shaedon Sharpe", "SF", 3.0,	1.2,	0.5,	0.3,	1.0,	1.7,	9.9, 25),
	(null, "Jerami Grant", "PF", 4.5,	2.4,	0.8,	0.8,	1.8,	2.4,	20.5, 25),
    (null, "Jusuf Nurkic", "C", 9.1,	2.9,	0.8,	0.8,	2.3,	3.6,	13.3, 25);
    

-- Sacramento Kings
INSERT INTO jogador VALUES
    (null, "De'Aaron Fox", "PG", 4.2,	6.1,	1.1,	0.3,	2.5,	2.4,	25.0, 26),
    (null, "Kevin Huerter", "SG", 3.3,	2.9,	1.1,	0.3,	1.3,	2.4,	15.2, 26),
    (null, "Harrison Barnes", "SF", 4.5,	1.6,	0.7,	0.1,	1.0,	1.3,	15.0, 26),
	(null, "Keegan Murray", "PF",	4.6,	1.2,	0.8,	0.5,	0.8,	2.0,	12.2, 26),
    (null, "Domantas Sabonis", "C", 12.3,	7.3,	0.8,	0.5,	2.9,	3.5,	19.1, 26);

-- San Antonio Spurs
INSERT INTO jogador VALUES
    (null, "Tre Jones", "PG", 3.6,	6.6,	1.3,	0.1,	1.6,	1.4,	12.9, 27),
    (null, "Devin Vassell", "SG", 3.9,	3.6,	1.1,	0.4,	1.5,	1.5,	18.5, 27),
    (null, "Keldon Johnson", "SF", 5.0,	2.9,	0.7,	0.2,	2.1,	2.0,	22.0, 27),
	(null, "Jeremy Sochan", "PF", 5.3,	2.5,	0.8,	0.4,	1.7,	2.5,	11.0, 27),
    (null, "Zach Collins", "C", 6.4,	2.9,	0.6,	0.8,	2.0,	3.2,	11.6, 27);

-- Toronto Raptors
INSERT INTO jogador VALUES
    (null, "Fred VanVleet", "PG", 4.1,	7.2,	1.8,	0.6,	2.0,	2.8,	19.3, 28),
    (null, "OG Anunoby", "SG", 5.0,	2.0,	1.9,	0.7,	2.0,	3.0,	16.8, 28),
    (null, "Scottie Barnes", "SF", 6.6,	4.8,	1.1,	0.8,	2.0,	2.2,	15.3, 28),
	(null, "Pascal Siakam", "PF", 7.8,	5.8,	0.9,	0.5,	2.4,	3.2,	24.2, 28),
    (null, "Jakob Poeltl", "C", 9.1,	2.2,	1.2,	1.3,	1.1,	3.0,	13.1, 28);

-- Utah Jazz
INSERT INTO jogador VALUES
    (null, "Collin Sexton", "PG", 2.2,	2.9,	0.6,	0.1,	1.8,	2.3,	14.3, 29),
    (null, "Jordan Clarkson", "SG", 4.0,	4.4,	0.5,	0.2,	3.0,	2.0,	20.8, 29),
    (null, "Lauri Markkanen", "SF", 8.6,	1.9,	0.6,	0.6,	1.9,	2.1,	25.6, 29),
	(null, "Kelly Olynyk", "PF", 6.2,	3.7,	0.9,	0.5,	2.5,	3.4,	12.5, 29),
    (null, "Walker Kessler", "C", 8.4,	0.9,	0.4,	2.3,	0.8,	2.3,	9.2, 29);

-- Washington Wizards
INSERT INTO jogador VALUES
    (null, "Monte Morris", "PG", 3.4,	5.3,	0.7,	0.2,	1.0,	1.2,	10.3, 30),
    (null, "Bradley Beal", "SG", 3.9,	5.4,	0.9,	0.7,	2.9,	2.1,	23.2, 30),
    (null, "Kyle Kuzma", "SF", 7.2,	3.7,	0.6,	0.5,	3.0,	2.3,	21.2, 30),
	(null, "Kristaps Porzingis", "PF", 8.4,	2.7,	0.9,	1.5,	2.1,	3.0,	23.2, 30),
    (null, "Daniel Gafford", "C", 5.6,	1.1,	0.4,	1.3,	1.1,	2.4,	9.0, 30);
