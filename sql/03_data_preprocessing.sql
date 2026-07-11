-- ==========================================================
-- 階段三：資料清理與型態調整 (Data Cleaning & Transformation)
-- 目的：將原始字串型態修正為正確的資料型態，並處理空值
-- ==========================================================

-- 1. 修正地理位置表的經緯度型態（字串 -> 高精度定點數）
ALTER TABLE olist_geolocation_dataset 
ALTER COLUMN geolocation_lat TYPE DECIMAL(10, 7),
ALTER COLUMN geolocation_lng TYPE DECIMAL(10, 7);

-- 2. 修正商品明細的金額、最遲出貨日期（字串 -> 高精度定點數、時間）
ALTER TABLE olist_order_items_dataset 
ALTER COLUMN price TYPE DECIMAL(10, 2),
ALTER COLUMN freight_value TYPE DECIMAL(10, 2),
ALTER COLUMN shipping_limit_date TYPE TIMESTAMP USING shipping_limit_date::TIMESTAMP;

-- 3. 修正付款方式的的金額（字串 -> 高精度定點數）
ALTER TABLE olist_order_payments_dataset 
ALTER COLUMN payment_value TYPE DECIMAL(10, 2);

-- 4. 修正訂單資訊的時間（字串 -> 時間）
-- 備註：使用 NULLIF 和 TRIM 排除空字串""引起的SQL Error[22007]
ALTER TABLE olist_orders_dataset 
ALTER COLUMN order_purchase_timestamp TYPE TIMESTAMP 
	USING NULLIF(TRIM(order_purchase_timestamp), '')::TIMESTAMP,
ALTER COLUMN order_approved_at TYPE TIMESTAMP 
    USING NULLIF(TRIM(order_approved_at), '')::TIMESTAMP,
ALTER COLUMN order_delivered_carrier_date TYPE TIMESTAMP 
    USING NULLIF(TRIM(order_delivered_carrier_date), '')::TIMESTAMP,
ALTER COLUMN order_delivered_customer_date TYPE TIMESTAMP 
    USING NULLIF(TRIM(order_delivered_customer_date), '')::TIMESTAMP,
ALTER COLUMN order_estimated_delivery_date TYPE TIMESTAMP 
    USING NULLIF(TRIM(order_estimated_delivery_date), '')::TIMESTAMP;