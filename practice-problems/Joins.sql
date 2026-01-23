-- Joins

-- Requirement 1

SELECT
    d.CustomerID,
    COUNT(*) AS NumDistinctBookingDates
FROM (
    SELECT DISTINCT CustomerID, DateOfTravel
    FROM Ride
) d
GROUP BY d.CustomerID
HAVING COUNT(*) > 1;

-- Requirement 2

SELECT
    r.CustomerID,
    v.VehicleNo,
    v.VehicleType
FROM Ride r
JOIN Vehicle v ON v.VehicleID = r.VehicleID
WHERE r.RideType = 'In-Station'
  AND r.BillAmount < 500;

-- Requirement 3

SELECT
    r.RideID
FROM Ride r
JOIN Customer c ON c.CustomerID = r.CustomerID
WHERE c.CustName LIKE 'S%';


-- Requirement 4

SELECT
    c.CustName,
    SUM(r.BillAmount) AS TotalAmountSpent
FROM Customer c
JOIN Ride r ON r.CustomerID = c.CustomerID
GROUP BY c.CustName
ORDER BY TotalAmountSpent DESC;

-- Requirement 5

SELECT DISTINCT
    d.DriverID,
    d.DriverName,
    r.RideType
FROM Driver d
LEFT JOIN Ride r
    ON r.DriverID = d.DriverID
ORDER BY d.DriverID, r.RideType;
