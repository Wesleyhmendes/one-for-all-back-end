SELECT
  sng.cancoes AS cancao,
  COUNT(hist.historico_de_reproducoes) AS reproducoes
FROM
  song_table AS sng
INNER JOIN
  playback_history_table AS hist ON hist.historico_de_reproducoes = sng.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
