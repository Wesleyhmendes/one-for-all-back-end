SELECT
	usr.nome_pessoa_usuaria AS pessoa_usuaria,
    COUNT(hist.historico_de_reproducoes) AS musicas_ouvidas,
    ROUND(SUM(sng.duracao_segundos) / 60, 2) AS total_minutos
FROM
	user_table AS usr
LEFT JOIN
	playback_history_table AS hist ON hist.pessoa_usuaria_id = usr.pessoa_usuaria_id
LEFT JOIN
	song_table AS sng ON sng.cancao_id = hist.historico_de_reproducoes
GROUP BY nome_pessoa_usuaria
ORDER BY nome_pessoa_usuaria ASC;

