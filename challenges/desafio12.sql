SELECT
ar.nome_artista as 'artista',
CASE
	WHEN COUNT(fv.id_music) >= 5 THEN 'A'
    WHEN COUNT(fv.id_music) >= 3 AND COUNT(fv.id_music) < 5 THEN 'B'
    WHEN COUNT(fv.id_music) >= 1 AND COUNT(fv.id_music) < 3 THEN 'C'
    ELSE '-'
    END AS 'ranking'
FROM artistas AS ar
INNER JOIN albuns AS al ON al.id_artista = ar.id_artista
INNER JOIN cancoes AS c ON c.id_album = al.id_album
LEFT JOIN favorites AS fv ON c.id_cancao = fv.id_music
GROUP BY ar.nome_artista
ORDER BY COUNT(fv.id_music) DESC, artista;