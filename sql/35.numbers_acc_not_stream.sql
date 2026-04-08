/*
    https://leetcode.com/problems/number-of-accounts-that-did-not-stream/
*/

SELECT
    COUNT(DISTINCT s.account_id) AS accounts_count
FROM
    Subscriptions s
    INNER JOIN Streams st
        ON s.account_id = st.account_id
        AND (st.stream_date  < s.start_date OR st.stream_date  > s.end_date)
WHERE
    YEAR(s.start_date) = 2021
    AND YEAR(s.end_date) = 2021