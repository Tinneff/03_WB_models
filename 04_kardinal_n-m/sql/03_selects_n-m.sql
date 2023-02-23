-- 03. SELECTS / Servants, Products, Purchases

-- Einzeltabellen
SELECT * FROM mydb.servants;
SELECT * FROM mydb.products;
SELECT * FROM mydb.purchases;

-- Inner Join 1 / Kombi (servants / products / purchases)
SELECT
	*
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
;

-- Welche Artikel hat Patrick/Peter gekauft?
SELECT
	#servant_name AS Diener,
    #product_name AS "Von Patrick gekaufte Produkte:"
    CONCAT(servant_name, " kauft ", product_name, ".") AS Kaufhandlung
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Patrick"
;

-- Wieviele Produkte hat Patrick gekauft?
SELECT
	 CONCAT(
			servant_name, 
            " kauft ", 
            COUNT(product_name),
            " Produkte."
            ) AS Kaufhandlung
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Patrick"
;
