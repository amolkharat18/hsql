-- HO_4
SELECT
    b.bookingid,
    b.flightid,
    b.flightcharge
FROM booking b
WHERE b.flightcharge >
      (SELECT MAX(flightcharge)
       FROM booking
       WHERE travelclass = 'Economy');
