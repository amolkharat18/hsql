-- Exercise_Subquery_MaxPurchaseDate 
SELECT InvoiceId, PurchaseDate
FROM Invoice
WHERE PurchaseDate = (
	SELECT MAX(PurchaseDate) AS PurchaseDate
	FROM Invoice
);
