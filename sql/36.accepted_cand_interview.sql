/*
    https://leetcode.com/problems/accepted-candidates-from-the-interviews/
*/

SELECT
    candidate_id
FROM (
    SELECT
        c.candidate_id,
        MAX(c.years_of_exp)     AS years_of_exp,
        SUM(r.score)            AS total_score
    FROM
        Rounds r
        LEFT JOIN Candidates c 
            ON r.interview_id = c.interview_id
    GROUP BY
        c.candidate_id
    HAVING
        MAX(c.years_of_exp) >= 2
        AND SUM(r.score) > 15
) AS accepted_candidates;



-- Optimize
SELECT c.candidate_id
FROM Candidates c
INNER JOIN Rounds r ON c.interview_id = r.interview_id
WHERE c.years_of_exp >= 2
GROUP BY c.candidate_id
HAVING SUM(r.score) > 15;