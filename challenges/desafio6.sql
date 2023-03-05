SELECT 
    MIN(fat.valor_plano) AS "faturamento_minimo",
    MAX(fat.valor_plano) AS "faturamento_maximo",
    ROUND(AVG(fat.valor_plano), 2) AS "faturamento_medio",
    SUM(fat.valor_plano) AS "faturamento_total"
FROM plano as fat
INNER JOIN users as us ON fat.id_plano = us.id_plano ;