-- Functions and Sorting

-- Requirement 1

SELECT 
    MemberId,
    MemberName,
    Gender
FROM Member
WHERE LOWER(MembershipPlan) IN ('gold', 'platinum')
  AND MemberName LIKE '%a%'
ORDER BY MemberName ASC;

-- Requirement 2

SELECT 
    CONCAT(CAST(SUBSTRING(TrainerId, 2) AS INT), '-', UPPER(TrainerFirstName)) AS TrainerDetails
FROM Trainer
WHERE LENGTH(TrainerFirstName) >= 5
  AND TrainerExperience >= 5
ORDER BY CAST(SUBSTRING(TrainerId, 2) AS INT);

-- Requirement 3

SELECT
    TrainerId AS Id,
    TrainerFirstName AS "TRAINER NAME",
    CASE
        WHEN TrainerExperience > 5 THEN 'Senior'
        WHEN TrainerExperience BETWEEN 2 AND 5 THEN 'Fresher'
        ELSE 'Beginner'
    END AS Experience
FROM Trainer
ORDER BY TrainerExperience ASC, TrainerFirstName DESC;


-- Requirement 4

SELECT
    ClassId,
    COUNT(DISTINCT MemberId) AS "MEMBER COUNT"
FROM ClassRegistration
WHERE PaymentMethod IN ('EMI', 'Card')
GROUP BY ClassId
HAVING COUNT(DISTINCT MemberId) >= 2
ORDER BY ClassId;

-- Requirement 5

SELECT
    m.MemberId,
    m.MemberName
FROM Member m
JOIN ClassRegistration cr
    ON m.MemberId = cr.MemberId
GROUP BY m.MemberId, m.MemberName
HAVING AVG(cr.AmountPaid) < 3000
ORDER BY m.MemberId;

-- Requirement 6

SELECT
    MemberId AS MEMBERID,
    ROUND(AVG(AmountPaid), 2) AS AVGFEE
FROM ClassRegistration
GROUP BY MemberId
HAVING AVG(AmountPaid) < 3800
   AND COUNT(DISTINCT ClassId) > 1
ORDER BY MemberId;

-- Requirement 7

UPDATE FitnessClass
SET TrainerId = 'T208'
WHERE ClassType = 'Strength'
   OR TrainerId = 'T205';

-- Requirement 8

DELETE FROM Trainer t
WHERE NOT EXISTS (
    SELECT 1
    FROM FitnessClass f
    WHERE f.TrainerId = t.TrainerId
);

-- Requirement 9

SELECT
    AmountPaid,
    ROUND(AmountPaid, 2)    AS VALUE1,   -- rounded to two decimals
    CEILING(AmountPaid)     AS VALUE2,   -- nearest higher integer
    FLOOR(AmountPaid)       AS VALUE3    -- truncate fractional part
FROM ClassRegistration;

