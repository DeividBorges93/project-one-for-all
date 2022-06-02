SELECT
  u.nome AS usuario,
  COUNT(hr.cancao_id) AS qtde_musicas_ouvidas,
  ROUND(SUM(c.duracao_segundos) / 60, 2) AS total_minutos
FROM SpotifyClone.usuarios u
LEFT JOIN SpotifyClone.historico_reproducoes hr
ON u.id = hr.usuario_id
LEFT JOIN SpotifyClone.cancoes c
ON c.id = hr.cancao_id
GROUP BY u.nome
ORDER BY u.nome;
