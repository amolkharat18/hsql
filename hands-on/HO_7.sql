-- HO_7
SELECT
    c.custid,
    c.custname
FROM customer c
INNER JOIN booking b
    ON c.custid = b.custid
GROUP BY c.custid, c.custname
HAVING COUNT(*) =
       (SELECT MAX(book_count) FROM
           (SELECT COUNT(*) AS book_count
            FROM booking
            GROUP BY custid));
