/*
    https://leetcode.com/problems/suspicious-bank-accounts
*/

WITH TEMP_TABLE AS (
    SELECT
        t.account_id,
        DATE_FORMAT(t.day, '%Y-%m') AS month
    FROM
        Transactions t
        INNER JOIN Accounts a
            ON t.account_id = a.account_id
    WHERE
        t.type = 'Creditor'
    GROUP BY
        t.account_id,
        DATE_FORMAT(t.day, '%Y-%m')
    HAVING
        SUM(t.amount) > MAX(a.max_income)
)
SELECT DISTINCT
    t1.account_id
FROM
    TEMP_TABLE t1
    INNER JOIN TEMP_TABLE t2
        ON t1.account_id = t2.account_id
        AND PERIOD_DIFF(
            REPLACE(t2.month, '-', ''),
            REPLACE(t1.month, '-', '')
        ) = 1
ORDER BY
    t1.account_id ASC;