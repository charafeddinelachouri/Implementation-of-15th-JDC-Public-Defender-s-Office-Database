SELECT COUNT(ProsecutorID) AS prosecutorCount
FROM Prosecutor
WHERE districtID = 'D2';

INSERT INTO Prosecutor
VALUES ('15', '33344409', 'Jack', 'Doga', '33745509', 'D4'),
('16', '33344410', 'Danny', 'Doglas', '33745511', 'D5'),
('17', '33344411', 'Robert', 'Albert', '33745573', 'D6'),
('18', '33344412', 'Jason', 'Thomas', '33745577', 'D6'),
('19', '33344413', 'Peter', 'Rodrigo', '33745500', 'D8');

DELETE FROM Prosecutor
WHERE prosecutorID = 15;

UPDATE Prosecutor
SET districtID = 'D7'
WHERE prosecutorID = 18;

SELECT lName, fName, d.districtID, address
FROM District d, Prosecutor p
WHERE d.districtID = p.districtID;


SELECT * FROM Prosecutor



