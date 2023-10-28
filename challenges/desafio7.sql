SELECT
  art.artista AS artista,
  alb.album AS album,
  COUNT(DISTINCT flw.pessoa_usuaria_id) AS pessoas_seguidoras
FROM
  artist_table AS art
INNER JOIN
  album_table AS alb ON art.artist_id = alb.artist_id
INNER JOIN
  following_artists_table AS flw ON flw.artist_id = art.artist_id
GROUP BY art.artista, alb.album
ORDER BY pessoas_seguidoras DESC, art.artista ASC, alb.album ASC;
