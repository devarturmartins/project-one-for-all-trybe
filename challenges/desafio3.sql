SELECT
 n.nome_users AS 'pessoa_usuaria',
 COUNT(m.historico_reproducao) AS 'musicas_ouvidas',
 ROUND(SUM(d.duracao_segundos)/60, 2) AS 'total_minutos'
 FROM users AS n
 INNER JOIN reproducao AS m ON n.id_users = m.id_users
 INNER JOIN duracao AS d ON d.id_cancao = m.id_cancao
 GROUP BY n.nome_users
 ORDER BY n.nome_users
 ;