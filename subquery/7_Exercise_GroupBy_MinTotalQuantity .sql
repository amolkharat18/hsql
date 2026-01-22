-- Exercise_GroupBy_MinTotalQuantity 
SELECT ProductId
FROM Invoice
GROUP BY ProductId
HAVING SUM(QuantityPurchased) =
(
    SELECT MIN(total_qty)
    FROM (
        SELECT ProductId, SUM(QuantityPurchased) AS total_qty
        FROM Invoice
        GROUP BY ProductId
    ) total_qty
);
