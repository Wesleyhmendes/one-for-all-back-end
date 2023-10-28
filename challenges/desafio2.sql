SELECT 
		COUNT(DISTINCT s.cancao_id) AS cancoes,
    COUNT(DISTINCT ar.artist_id) AS artistas,
    COUNT(DISTINCT al.album) AS albuns
FROM 
    song_table AS s 
LEFT JOIN
	artist_table AS ar
		ON s.album_id = ar.artist_id
LEFT JOIN
	album_table AS al
		ON s.album_id = al.album_id;