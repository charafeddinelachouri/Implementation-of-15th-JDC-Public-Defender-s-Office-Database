SELECT COUNT(date) AS courtDateCount
FROM Court_Date
WHERE caseNo = 5;

INSERT INTO Court_Date (caseNo, date, type)
VALUES (4,  '2022-07-09', 'trial')

DELETE FROM Court_Date
WHERE caseNo = 4 AND date = '2022-07-09';

UPDATE Court_Date
SET result = 'pled 8 yrs HL'
WHERE caseNo = 11 AND date = '2022-04-21';

SELECT c.caseNo, docketNo, date, type, result
FROM Criminal_Case c, Court_Date d
WHERE c.caseNo = 4 AND c.caseNo = d.caseNo



