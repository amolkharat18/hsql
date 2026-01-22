-- HO_1
SELECT
    bookingid,
    flightid,
    TO_CHAR(bookingdate, 'Mon') AS bookingmonth,
    TO_CHAR(bookingdate, 'DD') AS bookingdate
FROM booking
WHERE bookingdate BETWEEN '2018-10-01' AND '2019-03-31';
