SELECT
  ar.nome_artista AS "artista",
  al.nome_album AS "album",
  COUNT(seg.id_users) AS "pessoas_seguidoras"
FROM artistas AS ar
INNER JOIN albuns AS al ON al.id_artista = ar.id_artista
INNER JOIN artistas_seguidos AS seg ON ar.id_artista = seg.id_artista
GROUP BY ar.nome_artista, al.nome_album
ORDER BY pessoas_seguidoras DESC, ar.nome_artista, al.nome_album;