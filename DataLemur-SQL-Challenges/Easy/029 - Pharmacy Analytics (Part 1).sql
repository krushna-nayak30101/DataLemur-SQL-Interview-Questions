
WITH DrugProfit AS (
    -- Step 1: Calculate the total profit for each drug
    SELECT
        drug,
        CAST(SUM(total_sales - cogs) AS DECIMAL(18, 2)) AS total_profit
    FROM pharmacy_sales_part1
    GROUP BY drug
),
RankedProfit AS (
    -- Step 2: Rank the drugs based on the calculated total profit
    SELECT
        drug,
        total_profit,
        -- Use ROW_NUMBER since the problem assumes no ties, but RANK() would also work
        ROW_NUMBER() OVER (ORDER BY total_profit DESC) AS rank_n
    FROM DrugProfit
)
-- Step 3: Filter for the top 3 and display the results
SELECT
    drug,
    total_profit
FROM RankedProfit
WHERE rank_n <= 3
ORDER BY total_profit DESC;

