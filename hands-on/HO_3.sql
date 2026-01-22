-- HO_3
SELECT
    custid,
    travelclass,
    COUNT(*) AS nooftravels
FROM booking
GROUP BY custid, travelclass
HAVING COUNT(*) > 1;
