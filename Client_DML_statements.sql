SELECT COUNT(clientID) AS clientCount
FROM Client;

INSERT INTO Client
VALUES ('10', 'Ryann', 'Sullivann', DATE '1981-10-11', '33733732', '122 Main St., Crowley, LA 76036'),
('20', 'Stive', 'Bolt', DATE '1989-10-10', '33744332', '121 Main St., Crowley, NM 76036'),
 ('30', 'John', 'Brown', DATE '1983-10-7', '33733355', '4723 Green St., Houston, TX 77044'), 
 ('40', 'Adam', 'Downson', DATE '1986-10-1', '33733365', '123 Valley St., Dallas, TX 79054'),
 ('50', 'Oscar', 'Templeton', DATE '1984-5-22', '33733326', '123 Ginosa St., Austin, TX 70022');

DELETE FROM Client
WHERE clientID = 40;

UPDATE Client
SET phoneNo = 33788890
WHERE clientID = 20;

SELECT b.clientID, lName, fName, caseNo, docketNo
FROM Client a, Criminal_Case b
WHERE b.clientID = 20 AND b.clientID = a.clientID;

SELECT * FROM Client


