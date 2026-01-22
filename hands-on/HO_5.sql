-- HO_5
SELECT
    b1.bookingid,
    b1.custid,
    b1.flightid,
    b1.bookingdate
FROM booking b1
INNER JOIN booking b2
    ON b1.flightid = b2.flightid
    AND b1.bookingdate = b2.bookingdate
    AND b1.custid <> b2.custid
ORDER BY b1.bookingdate ASC;
