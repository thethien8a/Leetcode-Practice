/*
    https://leetcode.com/problems/apples-oranges/ 
*/

SELECT
    sale_date,
    SUM(sold_num) FILTER(WHERE fruit = 'apples') - SUM(sold_num) FILTER(WHERE fruit = 'oranges') AS diff
FROM
    Sales
GROUP BY
    sale_date
ORDER BY sale_date