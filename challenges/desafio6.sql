SELECT
	MIN(sub.valor_plano) AS faturamento_minimo,
    MAX(sub.valor_plano) AS faturamento_maximo,
    ROUND(SUM(sub.valor_plano) / COUNT(usr.pessoa_usuaria_id), 2) AS faturamento_medio,
    SUM(sub.valor_plano) AS faturamento_total
FROM
	subscription_plan_table AS sub
INNER JOIN
	user_table AS usr ON usr.plano = sub.plan_id;