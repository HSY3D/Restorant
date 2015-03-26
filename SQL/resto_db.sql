CREATE TABLE ADDRESS (AID VARCHAR(5) NOT NULL, STREET VARCHAR(50), CITY VARCHAR(20), POSTALCODE VARCHAR(20), PHONENUMBER VARCHAR(15), PRIMARY KEY (AID))

CREATE TABLE SERVICES (SID VARCHAR(5) NOT NULL, DINE_IN INTEGER, TAKE_OUT INTEGER, BYOD INTEGER, DELIVERY INTEGER, PRIMARY KEY (SID))

CREATE TABLE RESTAURANTS (RID VARCHAR(5) NOT NULL, AID VARCHAR(5) NOT NULL, SID VARCHAR(5) NOT NULL, RESTNAME VARCHAR(20), PRICEBRACKET VARCHAR(5), OPEN VARCHAR(5), CLOSE VARCHAR(5), WEBSITE VARCHAR(40), PRIMARY KEY (RID), FOREIGN KEY (AID) REFERENCES ADDRESS (AID), FOREIGN KEY (SID) REFERENCES SERVICES (SID))

CREATE TABLE CUSTOMERS (CID VARCHAR(5) NOT NULL, FIRSTNAME VARCHAR(20), LASTNAME VARCHAR(20), EMAIL VARCHAR(40), PRIMARY KEY (CID))

CREATE TABLE CRITICS (CID VARCHAR(5) NOT NULL, REPUTATION INTEGER, FOREIGN KEY (CID) REFERENCES CUSTOMERS (CID))

CREATE TABLE REVIEW (REVIEWID VARCHAR(5) NOT NULL, CID VARCHAR(5) NOT NULL, RID VARCHAR(5) NOT NULL, COMMENTS VARCHAR(100), RATINGS INTEGER, DATES DATE, PRIMARY KEY (REVIEWID))

CREATE TABLE MENU (MID VARCHAR(5) NOT NULL, RID VARCHAR(5) NOT NULL, CUISINE VARCHAR(20), MENU_DESCRIPTION VARCHAR(20), PRIMARY KEY (MID))

CREATE TABLE FOODITEM (FID VARCHAR(5) NOT NULL, MID VARCHAR(5) NOT NULL, FOODNAME VARCHAR(20), FOODPRICE DOUBLE, PRIMARY KEY (FID), FOREIGN KEY (MID) REFERENCES MENU (MID))

INSERT INTO ADDRESS VALUES ('A1000','756 Quiet Close', 'Montreal',  'G3N-5U6', '(450) 349-5131'), ('A1001','497 Heather Boulevard', 'Montreal',  'G7D-2C2', '(450) 926-4634'), ('A1002','5023 Bright Harbour', 'Montreal',  'G9X-6E9', '(819) 223-1469'), ('A1003','2283 Cotton Anchor Crossing', 'Montreal',  'H1Y-7D1', '(418) 865-6119'), ('A1004','8237 Middle Pony Walk', 'Laval',  'G4A-3J4', '(579) 433-4279'), ('A1005','959 Silent Lane', 'Laval',  'H7D-1T2', '(418) 560-3966'), ('A1006','2754 Green Campus', 'Laval',  'G3T-2Q1', '(819) 743-8731'), ('A1007','8068 Tawny Autoroute', 'Laval',  'G8P-0W5', '(450) 944-5221'), ('A1008','5758 Hazy Prairie Parkway', 'Laval',  'H2D-7X8', '(450) 624-3678'), ('A1009','3551 Clear Ridge', 'Laval',  'H5Z-4N9', '(418) 995-7677'), ('A1010','1584 Umber Lake Heath', 'Montreal',  'H0W-9P2', '(438) 132-3010'), ('A1011','9797 Dewy Rabbit Thicket', 'Montreal',  'G5I-3F3', '(450) 988-4431'), ('A1012','7386 Blue Barn Passage', 'Montreal',  'J2W-0R3', '(514) 238-9775'), ('A1013','8569 Pleasant Via', 'Laval',  'J2X-9U9', '(514) 308-2444'), ('A1014','293 Sleepy End', 'Laval',  'H1K-0E7', '(819) 401-9102'), ('A1015','6238 Cinder Vista', 'Laval',  'G2H-9F8', '(450) 842-1282'), ('A1016','5379 Stony Leaf Glade', 'Montreal',  'G1T-4Y2', '(581) 329-4784'), ('A1017','3983 Misty Cider Corner', 'Montreal',  'G4P-5G8', '(514) 905-5784'), ('A1018','5426 Little Landing', 'Montreal',  'H5E-2M2', '(819) 716-8499'), ('A1019','2532 Shady Close', 'Montreal',  'J2I-8Y7', '(819) 251-8999')

INSERT INTO SERVICES VALUES ('S1111',1,1,1,1), ('S0000',0,0,0,0), ('S1110',1,1,1,0), ('S1101',1,1,0,1), ('S1011',1,0,1,1), ('S0111',0,1,1,1), ('S1100',1,1,0,0), ('S0011',0,0,1,1), ('S0101',0,1,0,1), ('S1010',1,0,1,0), ('S1001',1,0,0,1), ('S0110',0,1,1,0), ('S1000',1,0,0,0), ('S0100',0,1,0,0), ('S0010',0,0,1,0), ('S0001',0,0,0,1) 

INSERT INTO RESTAURANTS VALUES ('R1',	'A1000'	,	'S1100'	,	'The Vintage Windmill'	,'$$'	,'11am'	,	'11pm'	,	NULL), ('R2',	'A1001'	,	'S1000'	,	'The Saffron Canteen'	,'$$'	,'11am'	,	'11pm'	,	'http://saffron.com'), ('R3',	'A1002'	,	'S1101'	,	'The Pink Panda'	,'$'	,'10am'	,	'11pm'	,	'http://pinkpanda.com'	)	, ('R4',	'A1003'	,	'S1110'	,	'The Friendly Saloon'	,'$$'	,'11am'	,	'3am'	,	'http://friendly-saloon.ca'	)	, ('R5',	'A1004'	,	'S1110'	,	'The Square Canteen'	,'$$'	,'11am'	,	'11pm'	,	'http://square-canteen.ca'	)	, ('R6',	'A1005'	,	'S1100'	,	'The Island'	,	'$$'	,'11am'	,	'11pm'	,	'http://theisland.com'	)	, ('R7',	'A1006'	,	'S1111'	,	'Little Italy'	,	'$$$'	,'11am'	,	'11pm'	,	'http://little-italy.com'	)	, ('R8',	'A1007'	,	'S1101'	,	'Lily'	,		'$'	,'10am'	,	'11pm'	,	'http://lily-restaurant.ca'	), ('R9',	'A1008'	,	'S1100'	,	'The Gallery'	,	'$$$'	,'11am'	,	'11pm'	,	'http://thegallery.com'	)	, ('R10'	,'A1009',	'S1100'	,	'Retro',		'$$$'	,'8am'	,	'3am'	,	'http://retrofood.ca'	)	, ('R11'	,'A1010',	'S1101'	,	'Lily'	,		'$'	,'10am'	,	'11pm'	,	'http://lily-restaurant.ca'	)	, ('R12'	,'A1011',	'S1101'	,	'Lily'	,		'$'	,'10am'	,	'11pm'	,	NULL	)	, ('R13'	,'A1012',	'S1110'	,	'The Fire Eats'	,	'$$'	,'11am'	,	'3am'	,	'http://fire-eats.ca'	)	, ('R14'	,'A1013',	'S1101'	,	'The Japanese Dome',	'$$'	,'11am'	,	'11pm'	,	'http://japanesedome.com'	)	, ('R15'	,'A1014',	'S1100'	,	'The City Spice',	'$$'	,'11am'	,	'11pm'	,	'http://cityspices.com'	)	, ('R16'	,'A1015',	'S1101'	,	'The Pink Panda',	'$'	,'10am'	,	'11pm'	,	'http://pinkpanda.com'	)	, ('R17'	,'A1016',	'S1101'	,	'The Pink Panda',	'$'	,'10am'	,	'11pm'	,	'http://pinkpanda.com'	)	, ('R18'	,'A1017',	'S1100'	,	'The Island'	,	'$$'	,'11am'	,	'11pm'	,	'http://theisland.com'	)	, ('R19'	,'A1018',	'S1100'	,	'Aroma'	,		'$'	,'11am'	,	'3am'	,	'http://aroma.ca'	)	, ('R20'	,'A1019',	'S1100'	,	'Citrus'	,	'$$'	,'8am'	,	'11pm'	,	'http://citrus.com'	)

INSERT INTO CUSTOMERS VALUES ('C1'	,'Pamela', 'Hansen', 'phansen0@samsung.com'), ('C2'	,'Christine', 'Fowler', 'cfowler1@cnet.com'), ('C3'	,'Carol', 'Brooks', 'cbrooks2@wordpress.org'), ('C4'	,'Denise', 'Reynolds', 'dreynolds3@abc.net.au'), ('C5'	,'Teresa', 'Henderson', 'thenderson4@yandex.ru'), ('C6'	,'Judith', 'Schmidt', 'jschmidt5@dot.gov'), ('C7'	,'Andrew', 'Stone', 'astone6@phpbb.com'), ('C8'	,'Christina', 'Garza', 'cgarza7@soup.io'), ('C9'	,'Ruby', 'Olson', 'rolson8@sciencedaily.com'), ('C10'	,'Wayne', 'Williams', 'wwilliams9@jiathis.com'), ('C11'	,'Stephen', 'Oliver', 'solivera@foxnews.com'), ('C12'	,'Pamela', 'Adams', 'padamsb@biblegateway.com'), ('C13'	,'Sarah', 'Shaw', 'sshawc@trellian.com'), ('C14'	,'Norma', 'Morris', 'nmorrisd@mashable.com'), ('C15'	,'Jack', 'Welch', 'jwelche@cdc.gov'), ('C16'	,'Fred', 'Gordon', 'fgordonf@aboutads.info'), ('C17'	,'Louise', 'Daniels', 'ldanielsg@google.it'), ('C18'	,'Robert', 'Robertson', 'rrobertsonh@seesaa.net'), ('C19'	,'Randy', 'Murray', 'rmurrayi@ifeng.com'), ('C20'	,'Paula', 'Mitchell', 'pmitchellj@hud.gov')

INSERT INTO CRITICS VALUES ('C1'	,1), ('C2'	,2), ('C3'	,3), ('C4'	,4), ('C5'	,5)

INSERT INTO REVIEW VALUES ('RV1'	,'C1'	,'R1'	,'Good portion & food, so so service.'	,					5	,'2015-01-10'	), ('RV2'	,'C2'	,'R12'	,'A good brunch, but a bit expensive!'	,					3	,'2015-01-10'	), ('RV3'	,'C3'	,'R3'	,'An exemplary bistro with arguably the most loyal clientele in the city.',	5	,'2015-01-13'	), ('RV4'	,'C4'	,'R19'	,'Appetizers were the best part of our meal.' 	,				3	,'2015-01-18'	), ('RV5'	,'C5'	,'R5'	,'Simple no-fuss decor. Excellent service. Great food.'	,			4	,'2014-10-06'	), ('RV6'	,'C1'	,'R20'	,'Decadent deserts.'	,							4	,'2015-01-22'	), ('RV7'	,'C7'	,'R19'	,'Laid back. Amazing coffee and grilled cheese. Delicious!'	,		4	,'2015-01-30'	), ('RV8'	,'C1'	,'R19'	,'Great for groups or a couple to try all the flavors. Highly recommended.',	5	,'2015-02-01'	), ('RV9'	,'C9'	,'R1'	,'The chicken was impeccable. Amazing!'	,					5	,'2015-02-10'	), ('RV10'	,'C10'	,'R1'	,'Exceptional food and service.'	,					4	,'2015-02-14'	), ('RV11'	,'C11'	,'R12'	,'Great flavors.'	,							3	,'2015-02-14'	), ('RV12'	,'C12'	,'R1'	,'Uncomfortable. Feeling rushed to eat.',					1	,'2015-02-18'	), ('RV13'	,'C1'	,'R12'	,'The dishes are a bit expensive, but the quality is there.'	,		2	,'2015-02-25'	)

INSERT INTO MENU VALUES (       'M1'    ,       'R1'    ,       'Western'       ,       'Dinner'        ), (       'M2'    ,       'R2'    ,       'Indian'        ,       'Dinner'        ), (       'M3'    ,       'R3'    ,       'Chinese'       ,       'Dinner'        ), (       'M4'    ,       'R4'    ,       'Western'       ,       'Lunch'         ), (       'M5'    ,       'R5'    ,       'Western'       ,       'Dinner'        ), (       'M6'    ,       'R6'    ,       'Mexican'       ,       'Lunch'         ), (       'M7'    ,       'R7'    ,       'Italian'       ,       'Dinner'        ), (       'M8'    ,       'R8'    ,       'Vietnamese'    ,       'Dinner'        ), (       'M9'    ,       'R9'    ,       'French'        ,       'Dinner'        ), (       'M10'   ,       'R10'   ,       'Italian'       ,       'Dinner'        ), (       'M11'   ,       'R11'   ,       'Vietnamese'    ,       'Dinner'        ), (       'M12'   ,       'R12'   ,       'Vietnamese'    ,       'Dinner'        ), (       'M13'   ,       'R13'   ,       'Indian'        ,       'Lunch'         ), (       'M14'   ,       'R14'   ,       'Japanese'      ,       'Dinner'        ), (       'M15'   ,       'R15'   ,       'Indian'        ,       'Dinner'        ), (       'M16'   ,       'R16'   ,       'Chinese'       ,       'Dinner'        ), (       'M17'   ,       'R17'   ,       'Chinese'       ,       'Dinner'        ), (       'M18'   ,       'R18'   ,       'Mexican'       ,       'Lunch'         ), (       'M19'   ,       'R19'   ,       'Cafe'          ,       'Drinks'        ), (       'M20'   ,       'R20'   ,       'Desserts'      ,       'Dessert'       )

INSERT INTO FOODITEM VALUES (	'F1'	,	'M1'	,	'Burger'	,	10.50	), (	'F2'	,	'M1'	,	'Fish'	,		15.00	), (	'F3'	,	'M2'	,	'Butter Chicken',	13.00	), (	'F4'	,	'M2'	,	'Chicken Tikka'	,	12.00	), (	'F5'	,	'M3'	,	'Orange Chicken',	9.75	), (	'F6'	,	'M3'	,	'Fried Rice'	,	8.00	), (	'F7'	,	'M4'	,	'Rib eye steak'	,	15.00	), (	'F8'	,	'M4'	,	'Baby back ribs',	15.00	), (	'F9'	,	'M5'	,	'Poutine'	,	10.00	), (	'F10'	,	'M5'	,	'Burger'	,	11.00	), (	'F11'	,	'M6'	,	'Tacos'	,		9.00	), (	'F12'	,	'M6'	,	'Burrito'	,	10.00	), (	'F13'	,	'M7'	,	'Pizza',		15.00	), (	'F14'	,	'M7'	,	'Pasta'	,		13.50	), (	'F15'	,	'M8'	,	'Pho'	,		10.75	), (	'F16'	,	'M8'	,	'Spring rolls'	,	6.00	), (	'F17'	,	'M9'	,	'Duck confit'	,	15.00	), (	'F18'	,	'M9'	,	'Escargots'	,	18.00	), (	'F19'	,	'M10'	,	'Pizza'	,		16.00	), (	'F20'	,	'M10'	,	'Pasta'	,		15.00	), (	'F21'	,	'M11'	,	'Pho'	,		10.75	), (	'F22'	,	'M11'	,	'Spring rolls'	,	6.00	), (	'F23'	,	'M12'	,	'Pho'	,		10.75	), (	'F24'	,	'M12'	,	'Spring rolls'	,	6.00	), (	'F25'	,	'M13'	,	'Butter Chicken',	12.00	), (	'F26'	,	'M13'	,	'Chicken Tikka'	,	12.00	), (	'F27'	,	'M14'	,	'Sushi'	,		14.00	), (	'F28'	,	'M14'	,	'Ramen'	,		11.50	), (	'F29'	,	'M15'	,	'Butter Chicken',	11.00	), (	'F30'	,	'M15'	,	'Lamb Korma'	,	14.00	), (	'F31'	,	'M16'	,	'Orange Chicken',	9.75	), (	'F32'	,	'M16'	,	'Fried Rice'	,	8.00	), (	'F33'	,	'M17'	,	'Orange Chicken',	9.75	), (	'F34'	,	'M17'	,	'Fried Rice'	,	8.00	), (	'F35'	,	'M18'	,	'Tacos'	,		9.00	), (	'F36'	,	'M18'	,	'Nachos'	,	11.75	), (	'F37'	,	'M19'	,	'Coffee'	,	3.00	), (	'F38'	,	'M19'	,	'Espresso'	,	4.00	), (	'F39'	,	'M20'	,	'Apple pie'	,	6.00	), (	'F40'	,	'M20'	,	'Chocolate cake',	7.00	)


SELECT R.RESTNAME FROM RESTAURANTS R, SERVICES S WHERE R.SID = S.SID AND S.DINE_IN = 1 AND S.BYOD = 1
SELECT C.FIRSTNAME, C.LASTNAME, RE.RESTNAME FROM  CUSTOMERS C, REVIEW R, RESTAURANTS RE WHERE R.RATINGS = 5 AND C.CID = R.CID AND R.RID = RE.RID ORDER BY C.LASTNAME
SELECT M.CUISINE, F.FOODNAME FROM MENU M, FOODITEM F WHERE M.MID = F.MID GROUP BY M.CUISINE, F.FOODNAME
SELECT R1.RESTNAME FROM RESTAURANTS R1, REVIEW R2 WHERE R1.RID = R2.RID AND R1.WEBSITE IS NULL INTERSECT SELECT R1.RESTNAME FROM RESTAURANTS R1, REVIEW R2 WHERE R1.RID = R2.RID AND R2.RATINGS < 4
SELECT C.CID, COUNT(*) AS COUNT FROM CRITICS C, REVIEW R WHERE C.CID = R.CID GROUP BY C.CID

UPDATE RESTAURANTS SET RESTNAME='Lola Rosa', PRICEBRACKET='$$', WEBSITE='http://lola-rosa.com' WHERE RID = 'R12'
UPDATE CRITICS SET REPUTATION = REPUTATION -1 WHERE CID IN (SELECT RV.CID FROM REVIEW RV WHERE RV.DATES < '2014-12-31')
UPDATE RESTAURANTS SET PRICEBRACKET = '$$$$$' WHERE AID IN (SELECT A.AID FROM ADDRESS A WHERE A.CITY='Laval')
UPDATE MENU SET MENU_DESCRIPTION = 'Fast food' WHERE RID IN (SELECT R.RID FROM RESTAURANTS R WHERE R.RESTNAME = 'The Pink Panda')

CREATE VIEW MOST_POPULAR_RESTAURANT (RESTNAME, RID, REVIEWCOUNT, AVGRATING) AS SELECT RESTNAME, REVIEW.RID, COUNT(REVIEW.RID) AS REVIEWCOUNT, AVG(RATINGS) AS AVGRATING FROM RESTAURANTS, REVIEW WHERE RESTAURANTS.RID = REVIEW.RID GROUP BY REVIEW.RID, RESTAURANTS.RESTNAME

SELECT FOODNAME, RESTNAME FROM FOODITEM f, MENU m1, MOST_POPULAR_RESTAURANT m where m.RID = m1.RID and m1.MID = f.MID and REVIEWCOUNT = (SELECT max(REVIEWCOUNT) FROM MOST_POPULAR_RESTAURANT)

CREATE VIEW TOP_RATED_REST (RESTNAME, RID, PRICEBRACKET, AVGRATING) AS SELECT RESTNAME, REVIEW.RID, PRICEBRACKET, AVG(RATINGS) AS AVGRATING FROM RESTAURANTS, REVIEW WHERE RESTAURANTS.RID = REVIEW.RID GROUP BY REVIEW.RID, RESTAURANTS.RESTNAME, RESTAURANTS.PRICEBRACKET

SELECT FIRSTNAME, LASTNAME, RATINGS, RESTNAME FROM REVIEW R, CUSTOMERS C, TOP_RATED_REST T WHERE C.CID = R.CID AND R.RID = T.RID AND AVGRATING = (SELECT MAX(AVGRATING) FROM TOP_RATED_REST)

ALTER TABLE CRITICS ADD CONSTRAINT check_rep CHECK (REPUTATION >0)

ALTER TABLE FOODITEM ADD CONSTRAINT food_price CHECK(FOODPRICE>0)
