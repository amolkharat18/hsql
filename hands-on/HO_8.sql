SELECT DISTINCT
    flightid,
    flightcharge,
    bookingdate
FROM booking
WHERE (flightid, flightcharge) IN (
    SELECT  flightid, MIN(flightcharge)
    FROM booking
    GROUP BY flightid
);
