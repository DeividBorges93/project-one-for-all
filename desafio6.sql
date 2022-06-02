SELECT
	MIN(p.valor_plano) AS 'faturamento_minimo',
  MAX(p.valor_plano) AS 'faturamento_maximo',
  ROUND(AVG(p.valor_plano), 2) AS 'faturamento_medio',
  SUM(p.valor_plano) AS 'faturamento_total'
FROM SpotifyClone.planos p
LEFT JOIN SpotifyClone.usuarios u
ON p.id = u.id_plano;