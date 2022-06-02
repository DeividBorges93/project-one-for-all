SELECT
  u.nome AS usuario,
  IF(YEAR(MAX(hr.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.usuarios u
LEFT JOIN SpotifyClone.historico_reproducoes hr
ON u.id = hr.usuario_id
GROUP BY u.nome
ORDER BY u.nome;