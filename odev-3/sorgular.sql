-- Q1: Her müşterinin toplam harcama tutarını listele.
SELECT c.full_name,
       SUM(oi.quantity * p.price) AS toplam_harcama
FROM customer c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_item oi ON o.order_id = oi.order_id
INNER JOIN product p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.full_name
ORDER BY toplam_harcama DESC;

-- Q2: Her ürün kategorisinin ortalama fiyatını ve toplam sipariş edilen ürün adetini listele.
WITH category_prices AS (
    SELECT category, AVG(price) AS ortalama_fiyat
    FROM product
    GROUP BY category
),
category_quantities AS (
    SELECT p.category, SUM(oi.quantity) AS toplam_siparis_adedi
    FROM product p
    INNER JOIN order_item oi ON p.product_id = oi.product_id
    GROUP BY p.category
)
SELECT cp.category,
       cp.ortalama_fiyat,
       COALESCE(cq.toplam_siparis_adedi, 0) AS toplam_siparis_adedi
FROM category_prices cp
LEFT JOIN category_quantities cq ON cp.category = cq.category
ORDER BY cp.category;

-- Q3: Ürünlerin numarasını, adını, kategorisini ve fiyatını listele.
SELECT product_id, name, category, price
FROM product
ORDER BY product_id;

-- Q4: Siparişlerin toplam tutarlarını hesaplayarak tüm kafenin ortalama sipariş tutarını listele.
WITH order_totals AS (
    SELECT oi.order_id,
           SUM(oi.quantity * p.price) AS siparis_tutari
    FROM order_item oi
    INNER JOIN product p ON oi.product_id = p.product_id
    GROUP BY oi.order_id
)
SELECT AVG(siparis_tutari) AS ortalama_siparis_tutari
FROM order_totals;

-- Q5: Fiyatı 50 TL ve altı olan ürünleri listele.
SELECT name, price
FROM product
WHERE price <= 50
ORDER BY price;

-- Q6: Her siparişte bulunan toplam ürün adedini sipariş numarasıyla birlikte listele.
SELECT order_id,
       SUM(quantity) AS toplam_urun_adedi
FROM order_item
GROUP BY order_id
ORDER BY order_id;
