CREATE DATABASE projetoIndividual;

USE projetoIndividual;

CREATE TABLE nbaTime(
idTime int primary key auto_increment,
nome varchar(45),
conferencia varchar(45), constraint chkConferencia CHECK(conferencia in('Leste', 'Oeste')),
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

INSERT INTO nbaTime VALUES
	(null, 'Atlanta Hawks', 'Leste'),
    (null, 'Boston Celtics', 'Leste'),
    (null, 'Brooklyn Nets', 'Leste'),
    (null, 'Charlotte Hornets', 'Leste'),
    (null, 'Chicago Bulls', 'Leste'),
    (null, 'Cleveland Cavaliers', 'Leste'),
    (null, 'Dallas Mavericks', 'Oeste'),
    (null, 'Denver Nuggets', 'Oeste'),
    (null, 'Detroit Pistons', 'Leste'),
    (null, 'Golden State Warriors', 'Oeste'),
    (null, 'Houston Rockets', 'Oeste'),
    (null, 'Indiana Pacers', 'Leste'),
    (null, 'Los Angeles Clippers', 'Oeste'),
    (null, 'Los Angeles Lakers', 'Oeste'),
    (null, 'Memphis Grizzlies', 'Oeste'),
    (null, 'Miami Heat', 'Leste'),
    (null, 'Milwaukee Bucks', 'Leste'),
    (null, 'Minnesota Timberwolves', 'Oeste'),
    (null, 'New York Knicks', 'Leste'),
    (null, 'New Orleans Pelicans', 'Oeste'),
    (null, 'Oklahoma City Thunder', 'Oeste'),
    (null, 'Orlando Magic', 'Leste'),
    (null, 'Philadelphia 76ers', 'Leste'),
    (null, 'Phoenix Suns', 'Oeste'),
    (null, 'Portland Trail Blazers', 'Oeste'),
    (null, 'Sacramento Kings', 'Oeste'),
    (null, 'San Antonio Spurs', 'Oeste'),
    (null, 'Toronto Raptors', 'Leste'),
    (null, 'Utah Jazz', 'Oeste'),
    (null, 'Washington Wizards', 'Leste');
    
-- Atlanta Hawks
INSERT INTO jogador VALUES
	(null, "Trae Young", "PG", 5.3,	6.1,	1.5,	0.3,	2.2,	1.4,	20.5, 1),
    (null, "Dejounte Murray", "SG", 3.0,	10.2,	1.1,	0.1,	4.1,	1.4,	26.2, 1),
    (null, "Bogdan Bogdanovic", "SF", 3.1,	2.8,	0.8,	0.3,	1.2,	1.6,	14.0, 1),
    (null, "DeAndre Hunter", "PF", 4.2,	1.4,	0.5,	0.3,	1.2,	3.0,	15.4, 1),
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
    
    
-- Cleveland Cavaliers
INSERT INTO jogador VALUES
	(null, "Darius Garland", "PG", 2.7,	7.8,	1.2,	0.1,	2.9,	2.1,	21.6 ,6),
	(null, "Donovan Mitchell", "SG", 4.3,	4.4,	1.5,	0.4,	2.6,	2.5,	28.3, 6),
    (null, "Isaac Okoro", "SF", 2.5,	1.1,	0.7,	0.4,	0.6,	2.1,	6.4 ,6),
    (null, "Evan Mobley", "PF",	9.0,	2.8,	0.8,	1.5,	1.8,	2.8,	16.2, 6),
    (null, "Jarret Allen", "C", 9.8,	1.7,	0.8,	1.2,	1.4,	2.3,	14.3, 6);
    
-- Denver Nuggets
    INSERT INTO jogador VALUES
    (null, "Jamal Murray", "PG", 4.0,	6.2,	1.0,	0.2,	2.2,	1.6,	20.0, 8),
    (null, "Kentavious Cladwll-Pope", "SG",	9.0,	2.8,	0.8,	1.5,	1.8,	2.8,	16.2, 8),
    (null, "Michael Porter Jr", "SF", 5.5,	1.0,	0.6,	0.5, 1.1,	1.9,	17.4, 8),
    (null, "Aaron Gordon", "PF", 6.6,	3.0,	0.8,	0.8,	1.4,	1.9,	16.3, 8),
    (null, "Nikola Jokic", "C", 11.8,	9.8,	1.3,	0.7,	3.6,	2.5,	24.5, 8);

-- Golden State Warriors 
    INSERT INTO jogador VALUES
	(null, "Stephen Curry", "PG", 6.1,	6.3,	0.9,	0.4,	3.2,	2.1,	29.4, 10),
    (null, "Klay Thompson", "SG", 4.1,	2.4,	0.7,	0.4,	1.8,	1.9,	21.9, 10),
    (null, "Andrew Wiggins", "SF", 5.0,	2.3,	1.2,	0.8,	1.3,	2.9,	17.1, 10),
    (null, "Draymond Green", "PF", 7.2,	6.8,	1.0,	0.8,	2.8,	3.1,	8.5, 10),
    (null, "Kevon Looney", "C",	9.3,	2.5,	0.6,	0.6,	0.5,	2.7,	7.0, 10);

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

-- Philadelphia 76ers
    INSERT INTO jogador VALUES
    (null, "Tyrese Maxey", "PG", 3.5,	6.2,	0.9,	0.2,	2.1,	2.2,	24.0, 20),
    (null, "James Harden", "SG", 7.0,	3.6,	1.4,	0.5,	1.5,	2.5,	10.2, 20),
    (null, "Tobias Harris", "SF", 5.0,	2.8,	0.4,	0.2,	2.2,	2.5,	19.6, 20),
	(null, "P.J. Tucker", "PF", 3.9,	0.8,	0.5,	0.2,	0.6,	2.4,	3.5, 20),
    (null, "Joel Embiid", "C", 9.4,	0.9,	0.9,	1.8,	0.7,	2.7,	7.4, 20);

-- Phoenix Suns
    INSERT INTO jogador VALUES
    (null, "Chris Paul", "PG", 6.4,	3.5,	0.3,	1.3,	2.5,	0.9,	26.0, 21),
    (null, "Devin Booker", "SG", 4.5,	5.5,	1.0,	0.3,	2.7,	3.0,	27.8, 21),
    (null, "Torrey Craig", "SF", 5.4,	1.5,	0.6,	0.8,	0.9,	2.3,	7.4, 21),
	(null, "Kevin Durant", "PF", 6.4,	3.5,	0.3,	1.3,	2.5,	0.9,	26.0, 21),
    (null, "Deandre Ayton", "C", 10.0,	1.7,	0.6,	0.8,	1.8,	2.8,	18.0, 21);
    

-- Sacramento Kings
    INSERT INTO jogador VALUES
    (null, "De'Aaron Fox", "PG", 4.2,	6.1,	1.1,	0.3,	2.5,	2.4,	25.0, 22),
    (null, "Kevin Huerter", "SG", 3.3,	2.9,	1.1,	0.3,	1.3,	2.4,	15.2, 22),
    (null, "Harrison Barnes", "SF", 4.5,	1.6,	0.7,	0.1,	1.0,	1.3,	15.0, 22),
	(null, "Keegan Murray", "PF",	4.6,	1.2,	0.8,	0.5,	0.8,	2.0,	12.2, 22),
    (null, "Domantas Sabonis", "C", 12.3,	7.3,	0.8,	0.5,	2.9,	3.5,	19.1, 22);
    
SELECT * FROM nbaTime;
SELECT * FROM usuario;
SELECT * FROM usuario JOIN nbaTime ON fkTime = idTime;
SELECT 
u.nome as 'Nome de usuario',
nba.nome as 'Time que torce' FROM usuario as u JOIN nbaTime as nba ON fkTime = idTime;
SELECT
j.nome AS "Nome do Jogador",
j.posicao AS "Posição do Jogador",
j.pontos AS "Pontuação do Jogador"
FROM jogador AS j JOIN nbaTime AS n ON fkTime = idTime WHERE n.nome = "Boston Celtics";