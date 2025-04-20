SELECT name
FROM Employee AS e1
LEFT JOIN 
(SELECT managerId, 
    CASE WHEN COUNT(*) > 4 THEN COUNT(*) 
    ELSE 0
    END AS reportsNum
FROM Employee
GROUP BY managerId) AS e2
ON e1.id = e2.managerId
WHERE e2.reportsNum > 0
