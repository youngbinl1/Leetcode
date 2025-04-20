SELECT w2.id AS Id
FROM Weather AS w1
LEFT JOIN Weather AS w2
ON w2.recordDate = date_add(w1.recordDate, interval 1 DAY)
WHERE w1.temperature < w2.temperature
