SELECT count(staffID) AS AttorneyCount FROM Attorney;

INSERT INTO Attorney
VALUES (5, 6610933, null, null, null, null);

DELETE FROM Attorney
WHERE staffID = 4;

UPDATE Attorney
SET barNo = 3455197
WHERE staffID = 2;

SELECT a.staffID, lName, fName, a.districtID, address
FROM Attorney a, District d
WHERE a.districtID = d.districtID
ORDER BY lname, fname;



