-- HO_2
SELECT DISTINCT
       c.custid,
       c.custname
FROM customer c
INNER JOIN booking b
    ON c.custid = b.custid
    AND b.bookingdate BETWEEN '2018-01-01'AND '2018-12-31';
