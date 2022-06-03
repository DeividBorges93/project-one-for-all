SELECT
	ar.nome AS artista,
    al.titulo AS album
FROM SpotifyClone.artistas ar
INNER JOIN SpotifyClone.albuns al
ON ar.id = al.artista_id
WHERE ar.nome = 'Walter Phoenix'
ORDER BY al.titulo;