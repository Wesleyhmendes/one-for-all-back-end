SELECT 
	alb.album AS album,
    COUNT(fvt.pessoa_usuaria_id) AS favoritadas
FROM
    album_table AS alb
LEFT JOIN
	song_table AS sng ON alb.album_id = sng.album_id
LEFT JOIN
	favorite_songs_table AS fvt ON fvt.cancao_id = sng.cancao_id
GROUP BY alb.album
ORDER BY favoritadas DESC, album ASC
LIMIT 3;