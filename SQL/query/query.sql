1) List the name of each restaurant which offers dine in services and BYOD
SELECT R.RESTNAME FROM RESTAURANTS R, SERVICES S WHERE R.SID = S.SID AND S.DINE_IN = 1 AND S.BYOD = 1

2) List the names of customers and restaurants who have given perfect ratings to restaurants
SELECT C.FIRSTNAME, C.LASTNAME, RE.RESTNAME FROM  CUSTOMERS C, REVIEW R, RESTAURANTS RE WHERE R.RATINGS = 5 AND C.CID = R.CID AND R.RID = RE.RID ORDER BY C.LASTNAME

3) List all cuisines and all goods offered by each cuisine
SELECT M.CUISINE, F.FOODNAME FROM MENU M, FOODITEM F WHERE M.MID = F.MID GROUP BY M.CUISINE, F.FOODNAME

4) List the restaurants that do not have websites and do not have ratings over 3
SELECT R1.RESTNAME FROM RESTAURANTS R1, REVIEW R2 WHERE R1.RID = R2.RID AND R1.WEBSITE IS NULL INTERSECT SELECT R1.RESTNAME FROM RESTAURANTS R1, REVIEW R2 WHERE R1.RID = R2.RID AND R2.RATINGS < 4

5) List the number of reviews each critic has and their name
SELECT C.CID, COUNT(*) AS COUNT FROM CRITICS C, REVIEW R WHERE C.CID = R.CID GROUP BY C.CID
