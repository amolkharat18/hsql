-- HO_6
SELECT
    c.custid,
    c.custname,
    NVL(TO_CHAR(b.bookingdate, 'YYYY-MM-DD'), 'No Booking') AS bdate
FROM customer c
LEFT JOIN booking b
    ON b.custid = c.custid
    AND b.travelclass = 'Business';
