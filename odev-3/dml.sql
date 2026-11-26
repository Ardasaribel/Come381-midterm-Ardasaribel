-- DML Deneyi
BEGIN;
-- Güncelleme öncesi Sıcak İçecek ürünlerinin fiyatları
SELECT product_id, name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;

-- Sıcak İçecek kategorisindeki ürünlerin fiyatlarını 5 TL artırma
UPDATE product
SET price = price + 5
WHERE category = 'Sıcak İçecek';

-- Güncelleme sonrası fiyatları kontrol etme
SELECT product_id, name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;

-- Hatalı INSERT deneyi: Var olmayan product_id kullanımı
INSERT INTO order_item (order_id, product_id, quantity)
VALUES (1, 999, 1);

-- İşlemleri geri alma
ROLLBACK;

-- Rollback sonrası başlangıç fiyatlarını kontrol etme
SELECT product_id, name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;

