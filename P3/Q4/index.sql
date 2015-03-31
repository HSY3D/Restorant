CREATE INDEX ind1 ON Restaurants (website ASC)
CREATE INDEX ind2 ON Review (ratings) CLUSTER

SELECT R1.RESTNAME FROM RESTAURANTS R1, REVIEW R2 WHERE R1.RID = R2.RID AND R1.WEBSITE IS NULL INTERSECT SELECT R1.RESTNAME FROM RESTAURANTS R1, REVIEW R2 WHERE R1.RID = R2.RID AND R2.RATINGS < 4