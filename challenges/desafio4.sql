 SELECT
    n.nome_users AS 'pessoa_usuaria',
    IF(MAX(YEAR(h.data_reproducao)) >= 2021, 'Ativa', 'Inativa') AS 'status_pessoa_usuaria'
 FROM users AS n
 INNER JOIN reproducao AS h ON h.id_users = n.id_users 
 GROUP BY n.nome_users
 ORDER BY n.nome_users