DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;


CREATE TABLE SpotifyClone.subscription_plan_table
(
	  plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plano	ENUM('gratuito', 'familiar', 'universitário', 'pessoal'),
    valor_plano	DECIMAL(10, 2)

);

INSERT INTO subscription_plan_table (plano, valor_plano) VALUES
	('gratuito', 0),
	('familiar', 7.99),
	('universitário', 5.99),
	('pessoal', 6.99);


CREATE TABLE SpotifyClone.user_table
(
    `pessoa_usuaria_id`	INT PRIMARY KEY AUTO_INCREMENT,
    `nome_pessoa_usuaria`	VARCHAR(512),
    `idade`	INT,
    `plano`	INT,
    `data_assinatura`	VARCHAR(512),
    FOREIGN KEY (`Plano`) REFERENCES `subscription_plan_table` (`plan_id`)
);


INSERT INTO SpotifyClone.user_table (`nome_pessoa_usuaria`, `idade`, `plano`, `data_assinatura`) VALUES
	('Barbara Liskov', 82, 1, '2019-10-20'),
	('Robert Cecil Martin', 58, '1', '2017-01-06'),
	('Ada Lovelace', 37, 2, '2017-12-30'),
	('Martin Fowler', 46, 2, '2017-01-17'),
	('Sandi Metz', 58, 2, '2018-04-29'),
	('Paulo Freire', 19, 3, '2018-02-14'),
	('Bell Hooks', 26, 3, '2018-01-05'),
	('Christopher Alexander', 85, 4, '2019-06-05'),
	('Judith Butler', 45, 4, '2020-05-13'),
	('Jorge Amado', 58, 4, '2017-02-17');



CREATE TABLE SpotifyClone.`artist_table` 
(
    `artist_id`	INT PRIMARY KEY AUTO_INCREMENT,
    `artista`	VARCHAR(512)
);

INSERT INTO SpotifyClone.`artist_table` (`artist_id`, `artista`) VALUES
	(1, 'Beyoncé'),
	(2, 'Queen'),
	(3, 'Elis Regina'),
	(4, 'Baco Exu do Blues'),
	(5, 'Blind Guardian'),
	(6, 'Nina Simone');


CREATE TABLE `album_table` 
(
    `album_id`	INT PRIMARY KEY AUTO_INCREMENT,
    `album`	VARCHAR(512),
    `artist_id`	INT,
    `ano_lancamento` YEAR,
     FOREIGN KEY (`artist_id`) REFERENCES `artist_table` (`artist_id`)
);

INSERT INTO SpotifyClone.`album_table` (`album_id`, `album`, `artist_id`, `ano_lancamento`) VALUES
	(1, 'Renaissance', 1, 2022),
	(2, 'Jazz', 2, 1978),
	(3, 'Hot Space', 2, 1982),
	(4, 'Falso Brilhante', 3, 1998),
	(5, 'Vento de Maio', 3, 2001),
	(6, 'QVVJFA?', 4, 2003),
	(7, 'Somewhere Far Beyond', 5, 2007),
	(8, 'I Put A Spell On You', 6, 2012);

CREATE TABLE `song_table` 
(
    `cancao_id`	INT PRIMARY KEY AUTO_INCREMENT,
    `cancoes`	VARCHAR(512),
    `duracao_segundos`	INT,
    `album_id`	INT,
    FOREIGN KEY (`album_id`) REFERENCES `album_table` (`album_id`)
);

INSERT INTO SpotifyClone.`song_table` (`cancao_id`, `cancoes`, `duracao_segundos`, `album_id`) VALUES
	(1, 'BREAK MY SOUL', 279, 1),
	(2, "VIRGO'S GROOVE", 369, 1),
	(3, 'ALIEN SUPERSTAR', 116, 1),
	(4, "Don't Stop Me Now", 203, 2),
	(5, 'Under Pressure', 152, 3),
	(6, 'Como Nossos Pais', 105, 4),
	(7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
	(8, 'Samba em Paris', 267, 6),
	(9, "The Bard's Song", 244, 7),
	(10, 'Feeling Good', 100, 8);



CREATE TABLE SpotifyClone.`playback_history_table`
(
    `pessoa_usuaria_id`	INT,
    `historico_de_reproducoes`	INT,
    `data_reproducao` DATETIME,
    FOREIGN KEY (`pessoa_usuaria_id`) REFERENCES `user_table` (`pessoa_usuaria_id`),
    FOREIGN KEY (`historico_de_reproducoes`) REFERENCES `song_table` (`cancao_id`),
    PRIMARY KEY (pessoa_usuaria_id, historico_de_reproducoes)
);

INSERT INTO SpotifyClone.`playback_history_table` (`pessoa_usuaria_id`, `historico_de_reproducoes`, `data_reproducao`) VALUES
	(1, 8, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 10, '2020-03-06 11:22:33'),
	(2, 10, '2022-08-05 08:05:17'),
	(2, 7, '2020-01-02 07:40:33'),
	(3, 10, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 3, '2015-12-13 08:30:22');



CREATE TABLE SpotifyClone.`following_artists_table` 
(
    `pessoa_usuaria_id`	INT,
    `artist_id`	INT,
    FOREIGN KEY (`pessoa_usuaria_id`) REFERENCES `user_table` (`pessoa_usuaria_id`),
    FOREIGN KEY (`artist_id`) REFERENCES `artist_table` (`artist_id`),
    PRIMARY KEY (pessoa_usuaria_id, artist_id)
);


INSERT INTO SpotifyClone.`following_artists_table` (`pessoa_usuaria_id`, `artist_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);
