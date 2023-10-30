SELECT
	CASE
		WHEN usr.idade <= 30 THEN 'Até 30 anos'
        WHEN usr.idade BETWEEN 30 AND 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
	END AS faixa_etaria,
    COUNT(DISTINCT usr.pessoa_usuaria_id) AS total_pessoas_usuarias,
    COUNT(fav.cancao_id) AS total_favoritadas
FROM
	user_table AS usr
LEFT JOIN
	favorite_songs_table AS fav ON fav.pessoa_usuaria_id = usr.pessoa_usuaria_id
GROUP BY faixa_etaria
ORDER BY 
    CASE
        WHEN faixa_etaria = 'Até 30 anos' THEN 0
        WHEN faixa_etaria = 'Entre 31 anos e 60 anos' THEN 1
        ELSE 2
    END, faixa_etaria ASC;