SELECT
    ar.nome_artista AS "artista",
    al.nome_album AS "album"
FROM artistas AS ar
INNER JOIN albuns AS al ON ar.id_artista = al.id_artista
WHERE ar.nome_artista = "Elis Regina"; 