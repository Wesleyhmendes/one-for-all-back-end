SELECT
    art.artista AS artista,
    CASE
        WHEN COUNT(fav.cancao_id) >= 5 THEN 'A'
        WHEN COUNT(fav.cancao_id) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(fav.cancao_id) BETWEEN 1 AND 2 THEN 'C'
        ELSE '-'
    END AS ranking
FROM 
	artist_table AS art
LEFT JOIN 
	album_table AS alb ON art.artist_id = alb.artist_id
LEFT JOIN 
	song_table AS song ON song.album_id = alb.album_id
LEFT JOIN 
	favorite_songs_table AS fav ON song.cancao_id = fav.cancao_id
GROUP BY artista
ORDER BY 
    CASE
        WHEN ranking = '-' THEN 1
        ELSE 0
    END, ranking ASC, artista ASC;