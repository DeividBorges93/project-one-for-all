SELECT
	c.nome AS cancao,
    COUNT(hr.usuario_id) AS reproducoes
FROM SpotifyClone.cancoes c
LEFT JOIN SpotifyClone.historico_reproducoes hr
ON c.id = hr.cancao_id
GROUP BY c.nome
ORDER BY reproducoes DESC, c.nome LIMIT 2;