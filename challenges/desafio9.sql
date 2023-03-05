SELECT
	COUNT(mus.id_cancao) AS "musicas_no_historico"
FROM reproducao as mus
INNER JOIN users as us ON us.id_users = mus.id_users
WHERE us.nome_users = "Barbara Liskov";