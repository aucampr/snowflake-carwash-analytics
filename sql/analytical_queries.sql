-- Member Count by Status
SELECT
    status,
    COUNT(*)                    AS member_count,
    ROUND(COUNT(*) * 100.0 /
      SUM(COUNT(*)) OVER (), 1) AS pct_of_total
FROM CARWASH_RAW.CRM.MEMBERS
GROUP BY status
ORDER BY member_count DESC;

-- Monthly Revenue Trend
SELECT
    DATE_TRUNC('month', transacted_at)  AS month,
    COUNT(DISTINCT member_id)            AS paying_members,
    SUM(amount)                          AS total_revenue,
    LAG(SUM(amount)) OVER
      (ORDER BY DATE_TRUNC('month', transacted_at)) AS prev_month_revenue,
    ROUND(
      (SUM(amount) - LAG(SUM(amount)) OVER
        (ORDER BY DATE_TRUNC('month', transacted_at)))
      / NULLIF(LAG(SUM(amount)) OVER
        (ORDER BY DATE_TRUNC('month', transacted_at)), 0) * 100, 1
    ) AS mom_growth_pct
FROM CARWASH_RAW.POS.TRANSACTIONS
WHERE transaction_type = 'RENEWAL'
GROUP BY 1
ORDER BY 1;

-- Top Locations by Visit Volume
WITH visit_counts AS (
    SELECT
        v.location_id,
        l.location_name,
        l.state,
        COUNT(*)                        AS total_visits,
        COUNT(DISTINCT v.member_id)     AS unique_members,
        RANK() OVER
          (ORDER BY COUNT(*) DESC)      AS rank
    FROM CARWASH_RAW.POS.VISITS v
    JOIN CARWASH_RAW.LOCATIONS.LOCATIONS l
      ON v.location_id = l.location_id
    GROUP BY 1, 2, 3
)
SELECT * FROM visit_counts

