/*
https://leetcode.com/problems/odd-and-even-transactions/
*/

-- WITH TEMP_TABLE AS (
--     SELECT
--         transaction_date,
--         SUM(amount) FILTER(WHERE amount % 2 = 1) AS odd_sum,
--         SUM(amount) FILTER(WHERE amount % 2 = 0) AS even_sum
--     FROM
--         transactions
--     GROUP BY
--         transaction_date
--     ORDER BY
--         transaction_date ASC
-- )
-- SELECT
--     transaction_date,
--     CASE WHEN odd_sum IS NULL THEN 0 ELSE odd_sum END,
--     CASE WHEN even_sum IS NULL THEN 0 ELSE even_sum END
-- FROM
--     TEMP_TABLE


-- more optimize
select transaction_date, 
sum(case when amount % 2 != 0 then amount else 0 end) as odd_sum, 
sum(case when amount % 2 = 0 then amount else 0 end) as even_sum
from transactions 
group by transaction_date
order by transaction_date;