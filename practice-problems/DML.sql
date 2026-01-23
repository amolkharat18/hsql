-- DML

-- Requirement 1:

INSERT INTO FitnessClass (ClassId, ClassName, TrainerId, ClassType)
VALUES ('C511', 'Water Aerobics', 'T203', 'Strength');


-- Requirement 2:

INSERT INTO ClassRegistration (RegistrationId, MemberId, ClassId)
SELECT 'R006', 103, ClassId
FROM FitnessClass
WHERE ClassName = 'Boot Camp';
