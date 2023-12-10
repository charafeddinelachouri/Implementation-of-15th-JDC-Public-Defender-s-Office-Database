SELECT COUNT(caseNo) AS caseCount
FROM Criminal_Case
WHERE staffID = '001';

INSERT INTO Criminal_Case
VALUES ('20', '23345', 'felony', 'Armed Robbery', DATE '2022-04-21', DATE '2023-04-21', 'open', '20', '15','5');

DELETE FROM Criminal_Case
WHERE caseStatus = 'closed';

UPDATE Criminal_Case
SET endDate = '20220421', caseStatus = 'closed'
WHERE caseNo = 11;

SELECT a.clientID, lName, fName, caseNo, docketNo
FROM Criminal_Case a, Client b
WHERE a.clientID = 20 AND a.clientID = b.clientID;

SELECT clientID, docketNo, b.districtID
FROM Criminal_Case a, District b
WHERE clientID = 20 AND districtID = b.districtID;

SELECT * FROM Criminal_Case;


