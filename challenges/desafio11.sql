SELECT
  al.nome_album AS 'album',
  COUNT(fv.id_users) AS 'favoritadas'
FROM favorites AS fv
INNER JOIN cancoes AS c ON fv.id_music = c.id_cancao
INNER JOIN albuns AS al ON al.id_album = c.id_album
GROUP BY al.nome_album
ORDER BY favoritadas DESC, al.nome_album
LIMIT 3;