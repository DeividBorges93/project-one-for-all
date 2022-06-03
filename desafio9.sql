SELECT
	COUNT(hr.usuario_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico_reproducoes hr
LEFT JOIN SpotifyClone.usuarios u
ON u.id = hr.usuario_id
WHERE hr.usuario_id = 3;