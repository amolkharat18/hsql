-- Group By

-- Requirement 1

SELECT
    LOWER(CustomerType) AS CustomerType,
    COUNT(*) AS CustomerCount
FROM Customer
WHERE Location IS NOT NULL
  AND LOWER(Location) <> 'chicago'
GROUP BY LOWER(CustomerType)
ORDER BY CustomerCount DESC;


-- Requirement 2

SELECT
    p.Category AS Category,
    CAST(AVG(od.ItemAmount) AS NUMERIC(10,5)) AS Avg_Price
FROM OrderDetails od
JOIN Product p
  ON p.ProductId = od.ProductId
GROUP BY p.Category

-- Requirement 3

SELECT
    o.CustomerId AS CustomerId,
    CAST(SUM(od.ItemAmount) AS NUMERIC(10,5)) AS Total_Amount
FROM Orders o
JOIN OrderDetails od ON od.OrderId = o.OrderId
JOIN Product p ON p.ProductId = od.ProductId
WHERE LOWER(p.Category) = 'plant'
GROUP BY o.CustomerId;

-- Requirement 4

SELECT
    CustomerId AS CustomerId,
    SUM(OrderAmount) AS TotalOrderAmount
FROM Orders
GROUP BY CustomerId
HAVING SUM(OrderAmount) > 4000;
