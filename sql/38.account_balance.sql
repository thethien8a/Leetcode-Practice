/*
    https://leetcode.com/problems/account-balance
*/


SELECT
    account_id,
    day,
    SUM(balance_change) OVER (PARTITION BY account_id ORDER BY day) AS balance
FROM
(
    SELECT
        account_id,
        day,
        (CASE WHEN  type = 'Deposit' THEN amount ELSE -amount END) AS balance_change
    FROM
        Transactions 
) AS daily_balances
ORDER BY
    account_id, day



SELECT
    account_id,
    day,
    sum(if(type = 'Deposit', amount, -amount)) OVER (
        PARTITION BY account_id
        ORDER BY day
    ) AS balance
FROM Transactions
ORDER BY 1, 2;
