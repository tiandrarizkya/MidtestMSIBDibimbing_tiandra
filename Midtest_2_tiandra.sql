WITH item_counts AS (
    SELECT item, COUNT(*) AS count
    FROM item_bought
    GROUP BY item
),
max_min_counts AS (
    SELECT 
        MAX(count) AS max_count,
        MIN(count) AS min_count
    FROM item_counts
)
SELECT item
FROM item_counts
CROSS JOIN max_min_counts
WHERE count != max_count AND count != min_count;