-- ==========================================================
-- 檢查一、檢查各資料表row count是否合理
-- ==========================================================

SELECT 'customer' AS table_name, COUNT(*) AS row_count
FROM olist_customers_dataset
UNION ALL
SELECT 'geolocation' AS table_name, COUNT(*) AS row_count
FROM olist_geolocation_dataset
UNION ALL
SELECT 'order_items' AS table_name, COUNT(*) AS row_count
FROM olist_order_items_dataset
UNION ALL
SELECT 'order_payments' AS table_name, COUNT(*) AS row_count
FROM olist_order_payments_dataset
UNION ALL
SELECT 'orders_dataset' AS table_name, COUNT(*) AS row_count
FROM olist_orders_dataset
UNION ALL
SELECT 'products' AS table_name, COUNT(*) AS row_count
FROM olist_products_dataset
UNION ALL
SELECT 'sellers' AS table_name, COUNT(*) AS row_count
FROM olist_sellers_dataset
UNION ALL
SELECT 'product_category_name' AS table_name, COUNT(*) AS row_count
FROM product_category_name_translation;


-- ==========================================================
-- 檢查二、檢查所有資料表主鍵唯一性
-- 如果 duplicate_amount為 0，代表主鍵為唯一值
-- ==========================================================

SELECT
	'olist_customers_dataset' AS table_name,
	'customer_id' AS pk_columns,
	COUNT(*) AS total_rows,
	(COUNT(*) - COUNT(DISTINCT customer_id)) AS duplicate_amount
FROM olist_customers_dataset
UNION ALL
SELECT
	'olist_orders_dataset',
	'order_id', COUNT(*),
	(COUNT(*) - COUNT(DISTINCT order_id))
FROM olist_orders_dataset
UNION ALL
SELECT
	'olist_order_items_dataset',
	'(order_id, order_item_id)',
	COUNT(*),
	(COUNT(*) - COUNT(DISTINCT (order_id, order_item_id)))
FROM olist_order_items_dataset
UNION ALL
SELECT
	'olist_order_payments_dataset',
	'(order_id, payment_sequential)',
	COUNT(*),
	(COUNT(*) - COUNT(DISTINCT (order_id, payment_sequential)))
FROM olist_order_payments_dataset
UNION ALL
SELECT
	'olist_products_dataset',
	'product_id',
	COUNT(*),
	(COUNT(*) - COUNT(DISTINCT product_id))
FROM olist_products_dataset
UNION ALL
SELECT
	'olist_sellers_dataset',
	'seller_id',
	COUNT(*),
	(COUNT(*) - COUNT(DISTINCT seller_id))
FROM olist_sellers_dataset;


-- ==========================================================
-- 檢查三、檢查重要欄位是否有NULL值
-- 檢查結果
-- 資料表olist_products_dataset的商品尺寸、重量欄位發現有2筆為空值
-- ==========================================================
SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(seller_id) AS seller_id_null
FROM olist_sellers_dataset;


-- ==========================================================
-- 檢查四、檢查重要欄位資料合理性
-- 是否有金額小於0
-- ==========================================================
SELECT price, freight_value
FROM olist_order_items_dataset
WHERE price < 0 OR freight_value < 0;


-- ==========================================================
-- 檢查五、檢查資料關聯
-- 子表是否都能在主表找到對應資料
-- ==========================================================
SELECT COUNT(*) AS missing_seller_id
FROM olist_order_items_dataset oi
LEFT JOIN olist_sellers_dataset s ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;