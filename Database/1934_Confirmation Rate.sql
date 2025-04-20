SELECT t.user_id, round(avg(t.numerator), 2) AS confirmation_rate
FROM (SELECT s.user_id, CASE WHEN c.action = 'confirmed' THEN 1
        ELSE 0
        END AS numerator
FROM Signups AS s
LEFT JOIN Confirmations AS c
ON c.user_id = s.user_id) AS t
GROUP BY t.user_id
