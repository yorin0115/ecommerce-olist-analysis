-- =====================================================
-- 問題一、哪些產品類別的總銷售額與訂單量最高？
-- =====================================================

WITH a AS(
SELECT 
	COALESCE(NULLIF(p.product_category_name, ''), 'unknown') AS product_category_name,
	SUM(oi.price) AS revenue,
	CAST(100.0 * SUM(oi.price) / SUM(SUM(oi.price)) OVER() AS NUMERIC(10, 4)) AS revenue_share,
	COUNT(DISTINCT oi.order_id) AS order_count,
	ROUND(SUM(oi.price)/ COUNT(DISTINCT oi.order_id), 2) AS category_aov
FROM olist_order_items_dataset oi
LEFT JOIN olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY COALESCE(NULLIF(p.product_category_name, ''), 'unknown')
)
SELECT
	a.product_category_name,
	cn.product_category_name_english,
	a.revenue,
	a.revenue_share,
	a.order_count,
	a.category_aov
FROM a
LEFT JOIN product_category_name_translation cn ON a.product_category_name = cn.product_category_name
ORDER BY revenue DESC;

