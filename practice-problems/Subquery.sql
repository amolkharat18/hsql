-- Subquery

-- Requirement 1

SELECT
    c.CustomerID,
    c.CustName
FROM Ride r
JOIN Customer c ON c.CustomerID = r.CustomerID
WHERE r.RideType = 'In-Station'
  AND r.BillAmount = (
        SELECT MAX(BillAmount)
        FROM Ride
        WHERE RideType = 'In-Station'
  )
;

-- Requirement 2

SELECT
    v.VehicleID,
    v.VehicleType
FROM Vehicle v
JOIN Ride r ON r.VehicleID = v.VehicleID
GROUP BY v.VehicleID, v.VehicleType
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Ride
        GROUP BY VehicleID
    ) x
);

-- Requirement 3

SELECT
    CustomerID,
    CustName
FROM Customer
WHERE WalletAmt < (
    SELECT AVG(WalletAmt)
    FROM Customer
);

-- Requirement 4

SELECT
    r.RideID,
    r.VehicleID,
    r.CustomerID
FROM Ride r
JOIN Customer c ON c.CustomerID = r.CustomerID
JOIN Vehicle v ON v.VehicleID = r.VehicleID
WHERE r.RideType = 'In-Station'
  AND LOWER(c.CustName) LIKE '%h%'
  AND v.VehicleType NOT IN ('Mini', 'Auto')
ORDER BY r.RideID DESC;


-- Requirement 5

SELECT
    r.RideID,
    r.Source,
    r.Destination,
    r.DateOfTravel,
    r.BillAmount,
    r.PayMode
FROM Ride r
WHERE r.BillAmount < (
    SELECT AVG(r2.BillAmount)
    FROM Ride r2
    WHERE r2.PayMode = r.PayMode
)
ORDER BY r.RideID;


-- Requirement 6

SELECT
    d.DriverID,
    d.DriverName
FROM Driver d
WHERE d.RideCount > (
    SELECT AVG(d2.RideCount)
    FROM Driver d2
    WHERE d2.DriverID <> d.DriverID
      AND d2.Feedback < (
          SELECT AVG(d3.Feedback)
          FROM Driver d3
          WHERE d3.DriverID <> d.DriverID
      )
);

-- Requirement 7

SELECT
    r.RideID,
    v.Capacity,
    r.BillAmount
FROM Ride r
JOIN Vehicle v ON v.VehicleID = r.VehicleID
WHERE r.BillAmount = (
    SELECT MIN(r2.BillAmount)
    FROM Ride r2
    JOIN Vehicle v2 ON v2.VehicleID = r2.VehicleID
    WHERE v2.Capacity = v.Capacity
)
ORDER BY v.Capacity;
