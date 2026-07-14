-- =====================================================
-- 問題二、平台是否存在明顯的季節性或週期性波動？
-- =====================================================

--第一階段分析各年度每月營收與訂單數
WITH a AS(
SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS order_year,
    EXTRACT(MONTH FROM o.order_purchase_timestamp) AS order_month,
    ROUND(SUM(oi.price), 2) AS revenue,
    COUNT(DISTINCT o.order_id) AS order_count 
FROM olist_orders_dataset o
INNER JOIN public.olist_order_items_dataset oi ON o.order_id = oi.order_id
WHERE o.order_purchase_timestamp >= '2017-01-01' 
	AND o.order_purchase_timestamp < '2018-09-01'
GROUP BY order_year, order_month
)
SELECT
	order_year,
	order_month,
	revenue,
	ROUND(100.0 * revenue / SUM(revenue) OVER(PARTITION BY order_year), 2) AS revenue_share,
	order_count,
	ROUND((revenue / order_count), 2) AS aov
FROM a
ORDER BY revenue DESC;


--第二階段分析星期別營收與訂單數
WITH a AS(
SELECT
EXTRACT(DOW FROM o.order_purchase_timestamp) AS weekday_num,
CASE EXTRACT(DOW FROM o.order_purchase_timestamp)
        WHEN 1 THEN 'Monday'
    	WHEN 2 THEN 'Tuesday'
    	WHEN 3 THEN 'Wednesday'
    	WHEN 4 THEN 'Thursday'
    	WHEN 5 THEN 'Friday'
    	WHEN 6 THEN 'Saturday'
    	WHEN 0 THEN 'Sunday'
		END AS weekday,
    ROUND(SUM(oi.price), 2) AS revenue,
    COUNT(DISTINCT o.order_id) AS order_count 
FROM olist_orders_dataset o
INNER JOIN public.olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY weekday_num, weekday
)
SELECT
	weekday,
	revenue,
	ROUND(100.0 * revenue / SUM(revenue) OVER(), 2) AS revenue_share,
	order_count,
	ROUND((revenue / order_count), 2) AS aov
FROM a
ORDER BY weekday_num;


--第三階段分析小時別營收與訂單數
WITH a AS(
SELECT
	EXTRACT(HOUR FROM o.order_purchase_timestamp) AS order_hour,
    ROUND(SUM(oi.price), 2) AS revenue,
    COUNT(DISTINCT o.order_id) AS order_count 
FROM olist_orders_dataset o
INNER JOIN public.olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY order_hour
)
SELECT
	order_hour,
	revenue,
	ROUND(100.0 * revenue / SUM(revenue) OVER(), 2) AS revenue_share,
	order_count,
	ROUND((revenue / order_count), 2) AS aov
FROM a
ORDER BY a.revenue DESC;