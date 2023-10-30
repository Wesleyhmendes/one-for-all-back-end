CREATE TABLE SpotifyClone.`favorite_songs_table`
(
    `pessoa_usuaria_id`	INT,
    `cancao_id`	INT,
    FOREIGN KEY (`pessoa_usuaria_id`) REFERENCES `user_table` (`pessoa_usuaria_id`),
    FOREIGN KEY (`cancao_id`) REFERENCES `song_table` (`cancao_id`),
    PRIMARY KEY (pessoa_usuaria_id, cancao_id)
);

INSERT INTO SpotifyClone.`favorite_songs_table` (pessoa_usuaria_id, cancao_id) VALUES
	(1, 3),
	(1, 6),
	(1, 10),
	(2, 4),
	(3, 1),
	(3, 3),
	(4, 7),
	(4, 4),
	(5, 10),
	(5, 2),
	(8, 4),
	(9, 7),
	(10, 3);