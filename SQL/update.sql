1) change the name of restaurant with rid r12 to lola rose and change its pricebracket and website
UPDATE RESTAURANTS SET RESTNAME='Lola Rosa', PRICEBRACKET='$$', WEBSITE='http://lola-rosa.com' WHERE RID = 'R12'

2) decrement the repuation of critics who have not posted since 2014-12-31
UPDATE CRITICS SET REPUTATION = REPUTATION -1 WHERE CID IN (SELECT RV.CID FROM REVIEW RV WHERE RV.DATES < '2014-12-31')

3) change the pricebracket of the all restaurants in laval to $$$$$
UPDATE RESTAURANTS SET PRICEBRACKET = '$$$$$' WHERE AID IN (SELECT A.AID FROM ADDRESS A WHERE A.CITY='Laval')

4) change the menu menu description to fastfood for any restaurants called the pink panda
UPDATE MENU SET MENU_DESCRIPTION = 'Fast food' WHERE RID IN (SELECT R.RID FROM RESTAURANTS R WHERE R.RESTNAME = 'The Pink Panda')