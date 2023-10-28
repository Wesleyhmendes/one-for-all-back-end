SELECT
    usr.nome_pessoa_usuaria AS pessoa_usuaria,
    CASE
        WHEN SUM(CASE WHEN YEAR(hist.data_reproducao) >= 2021 THEN 1 ELSE 0 END) > 0 THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    user_table AS usr
LEFT JOIN playback_history_table AS hist ON usr.pessoa_usuaria_id = hist.pessoa_usuaria_id
GROUP BY usr.nome_pessoa_usuaria
ORDER BY usr.nome_pessoa_usuaria;