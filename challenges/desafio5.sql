 SELECT
    c.nome_cancao AS 'cancao',
    COUNT(r.historico_reproducao) AS 'reproducoes'
 FROM cancoes AS c
 INNER JOIN reproducao AS r ON r.id_cancao = c.id_cancao
 GROUP BY c.nome_cancao
 ORDER BY COUNT(r.historico_reproducao) DESC, c.nome_cancao
 LIMIT 2;