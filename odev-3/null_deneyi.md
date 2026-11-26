NULL Deneyi
Deney 1: NULL değerini eşitlik operatörüyle kontrol etme
Sorgu:
SELECT full_name, phone
FROM customer
WHERE phone = NULL;

Beklenen Çıktı:
 full_name | phone

(0 rows)

Yorum:
Bu sorguda NULL değeri = operatörüyle kontrol edildiğinde herhangi bir sonuç gelmez. 
Çünkü SQL'de NULL değerleri doğrudan eşitlik karşılaştırmasıyla kontrol edilemez.

Deney 2: NULL değerini IS NULL ile kontrol etme
Sorgu:
SELECT full_name, phone
FROM customer
WHERE phone IS NULL;

Beklenen Çıktı:
   full_name     phone

 Mehmet Kaya     NULL
 Can Arslan      NULL
 Selin Öztürk    NULL
(3 rows)

Yorum:
Bu sorguda IS NULL kullanılarak telefon numarası olmayan müşteriler bulunur. Sorgu sonucunda 
telefon numarası kayıtlı olmayan 3 müşteri listelenmiştir.
Deneylerin Karşılaştırılması
İlk sorguda phone = NULL kullanıldığında sonuç alınmazken, ikinci sorguda IS NULL kullanıldığında 
telefon numarası olmayan müşteriler görüntülenir. Bu iki sorgu arasındaki fark, NULL değerlerini 
kontrol ederken IS NULL kullanılması gerektiğini gösterir.
