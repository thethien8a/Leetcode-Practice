/*
    https://leetcode.com/problems/seasonal-sales-analysis/
*/

-- Not optimized
WITH TEMP_TABLE AS (
    SELECT    
        (CASE
            WHEN DATE_PART('month', s.sale_date) IN (12,1,2) THEN 'Winter'
            WHEN DATE_PART('month', s.sale_date) IN (3,4,5) THEN 'Spring'
            WHEN DATE_PART('month', s.sale_date) IN (6,7,8) THEN 'Summer'
            ELSE 'Fall'
        END) AS season,
        category,
        SUM(quantity) as total_quantity,
        SUM(quantity*price) AS total_revenue
    FROM
        sales s
        INNER JOIN  products p
            ON s.product_id = p.product_id
    GROUP BY 
        season, category 
), TEMP_2 AS (
SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY season ORDER BY total_quantity DESC, total_revenue DESC, category ASC)
FROM
    TEMP_TABLE
)
SELECT
    season,
    category,
    total_quantity,
    total_revenue
FROM
    TEMP_2
WHERE
    row_number = 1


-- optimized
SELECT DISTINCT ON (season) -- khác biệt ở chỗ dùng distinct luôn cho nhanh
    season,
    category,
    total_quantity,
    total_revenue
FROM (
    SELECT
        CASE
            WHEN EXTRACT(MONTH FROM sale_date) BETWEEN 3 AND 5 THEN 'Spring'
            WHEN EXTRACT(MONTH FROM sale_date) BETWEEN 6 AND 8 THEN 'Summer'
            WHEN EXTRACT(MONTH FROM sale_date) BETWEEN 9 AND 11 THEN 'Fall'
            ELSE 'Winter'
        END season,
        category,
        SUM(quantity) total_quantity,
        SUM(quantity * price) total_revenue
    FROM sales a
        JOIN products b
            USING(product_id)
    GROUP BY 1, 2
)
ORDER BY
    season,
    total_quantity DESC,
    total_revenue DESC,
    category ASC