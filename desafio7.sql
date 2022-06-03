SELECT
	ar.nome AS artista,
    al.titulo AS album,
    COUNT(sa.artista_id) AS seguidores
FROM
	SpotifyClone.artistas ar
INNER JOIN SpotifyClone.albuns al
ON ar.id = al.artista_id
INNER JOIN SpotifyClone.seguindo_artista AS sa
ON sa.artista_id = ar.id
GROUP BY ar.nome, al.titulo
ORDER BY seguidores DESC, artista ASC, album ASC;