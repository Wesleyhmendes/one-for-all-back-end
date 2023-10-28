SELECT
  art.artista AS artista,
  alb.album AS album
FROM
  artist_table AS art
INNER JOIN
  album_table AS alb ON alb.artist_id = art.artist_id
HAVING art.artista = 'Elis Regina'
ORDER BY alb.album ASC;
