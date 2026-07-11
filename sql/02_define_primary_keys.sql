-- ==========================================================
-- 階段二：定義主鍵 (Define Primary Keys)
-- 目的：為各個資料表建立Primary Key，確保資料唯一性與關聯完整性
-- ==========================================================

-- 1. 建立customers的主鍵（主鍵：customer_id）
ALTER TABLE olist_customers_dataset
ADD PRIMARY KEY (customer_id);

-- 2. 建立orders的主鍵（主鍵：order_id）
ALTER TABLE olist_orders_dataset
ADD PRIMARY KEY (order_id);

-- 3. 建立order_items的主鍵（複合主鍵：order_id, order_item_id）
ALTER TABLE olist_order_items_dataset
ADD PRIMARY KEY (order_id, order_item_id);

-- 4. 建立order_payments的主鍵（複合主鍵：order_id, payment_sequential）
ALTER TABLE olist_order_payments_dataset
ADD PRIMARY KEY (order_id, payment_sequential);

-- 5. 建立products的主鍵（主鍵：product_id）
ALTER TABLE olist_products_dataset
ADD PRIMARY KEY (product_id);

-- 6. 建立sellers的主鍵（主鍵：seller_id）
ALTER TABLE olist_sellers_dataset
ADD PRIMARY KEY (seller_id);

-- 7. olist_geolocation_dataset 僅作為參考，不建立Primary Key

-- 8. product_category_name_translation 僅作為參考，不建立Primary Key
