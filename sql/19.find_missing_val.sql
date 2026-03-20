/*
    https://leetcode.com/problems/find-the-missing-ids/
*/

-- Not optimize
SELECT gs.ids
FROM generate_series(1, (SELECT MAX(customer_id) FROM Customers)) AS gs(ids)
LEFT JOIN Customers c ON c.customer_id = gs.ids
WHERE c.customer_id IS NULL
ORDER BY gs.ids ASC;
