SELECT
	c.nome AS nome,
    COUNT(hr.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes c
LEFT JOIN SpotifyClone.historico_reproducoes hr
ON c.id = hr.cancao_id
LEFT JOIN SpotifyClone.usuarios u
ON hr.usuario_id = u.id
WHERE u.id_plano IN (1, 4)
GROUP BY nome
ORDER by nome;