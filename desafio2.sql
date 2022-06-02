SELECT
		COUNT(DISTINCT c.nome) AS cancoes,
		COUNT(DISTINCT ar.nome) AS artistas,
		COUNT(DISTINCT al.titulo) AS albuns
FROM
		SpotifyClone.cancoes c,
    SpotifyClone.artistas ar,
    SpotifyClone.albuns al;