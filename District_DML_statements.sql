SELECT COUNT(DistrictID) AS districtCount
FROM District;

INSERT INTO District
VALUES ('D5' ,'123 Congress Street, Lafayette, LA, 70507', '33788900'),
('D6' ,'123 Congress Street, Lafayette, LA, 70507', '33788900'),
('D7' ,'123 Congress Street, Lafayette, LA, 70507', '33788900'),
('D8' ,'123 Congress Street, Lafayette, LA, 70507', '33788900');

DELETE FROM District
WHERE districtID = 'D4';

UPDATE District
SET phoneNo = 3372230099
WHERE districtID = 'D2';

UPDATE District
SET address = '111 Rosa St, Lafayette, LA, 70511'
WHERE districtID = 'D7';

SELECT lName, fName, p.districtID
FROM District d, Prosecutor p
WHERE p.districtID  = 'D2' AND p.districtID = d.districtID;

SELECT * FROM district


