SELECT
  COUNT(playback_history_table.historico_de_reproducoes) AS musicas_no_historico
FROM
  playback_history_table
WHERE  playback_history_table.pessoa_usuaria_id= 1;