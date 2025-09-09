-- V002__change_schema.sql
-- добавление столбца price
ALTER TABLE product
ADD COLUMN price DOUBLE PRECISION;

-- Удаление таблицы product_info
DROP TABLE IF EXISTS product_info;

-- добавление столбца date_created в таблицу orders
ALTER TABLE orders
ADD COLUMN date_created DATE DEFAULT CURRENT_DATE;

-- Удаление таблицы orders_date
DROP TABLE IF EXISTS orders_date;

-- Удаление индексов удаленный таблиц
DROP INDEX IF EXISTS idx_product_info_product_id;
DROP INDEX IF EXISTS idx_orders_date_order_id;