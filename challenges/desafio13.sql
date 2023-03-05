SELECT
	CASE
		WHEN us.idade_users <= 30 THEN 'Até 30 anos'
        WHEN us.idade_users > 30 AND us.idade_users <= 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
        END AS 'faixa_etaria',
    COUNT(DISTINCT us.id_users) AS total_pessoas_usuarias,
    COUNT(fv.id_music) AS total_favoritadas
    
    FROM users as us
    LEFT JOIN favorites as fv ON fv.id_users = us.id_users
    GROUP BY faixa_etaria;