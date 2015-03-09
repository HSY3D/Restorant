CREATE TABLE ADDRESS (AID VARCHAR(5) NOT NULL, STREET VARCHAR(50), CITY VARCHAR(20), POSTALCODE VARCHAR(20), PHONENUMBER VARCHAR(15), PRIMARY KEY (AID))
CREATE TABLE SERVICES (SID VARCHAR(5) NOT NULL, DINE_IN INTEGER, TAKE_OUT INTEGER, BYOD INTEGER, DELIVERY INTEGER, PRIMARY KEY (SID))
CREATE TABLE RESTAURANTS (RID VARCHAR(5) NOT NULL, AID VARCHAR(5) NOT NULL, SID VARCHAR(5) NOT NULL, RESTNAME VARCHAR(20), PRICEBRACKET VARCHAR(5), OPEN VARCHAR(5), CLOSE VARCHAR(5), WEBSITE VARCHAR(40), PRIMARY KEY (RID), FOREIGN KEY (AID) REFERENCES ADDRESS (AID), FOREIGN KEY (SID) REFERENCES SERVICES (SID))
CREATE TABLE CUSTOMERS (CID VARCHAR(5) NOT NULL, FIRSTNAME VARCHAR(20), LASTNAME VARCHAR(20), EMAIL VARCHAR(40), PRIMARY KEY (CID))
CREATE TABLE CRITICS (CID VARCHAR(5) NOT NULL, REPUTATION INTEGER, FOREIGN KEY (CID) REFERENCES CUSTOMERS (CID))
CREATE TABLE REVIEW (REVIEWID VARCHAR(5) NOT NULL, CID VARCHAR(5) NOT NULL, RID VARCHAR(5) NOT NULL, COMMENTS VARCHAR(100), RATINGS INTEGER, DATES DATE, PRIMARY KEY (REVIEWID),  FOREIGN KEY (CID) REFERENCES CUSTOMERS (CID), FOREIGN KEY (RID) REFERENCES RESTAURANTS (RID))
CREATE TABLE MENU (MID VARCHAR(5) NOT NULL, RID VARCHAR(5) NOT NULL, CUISINE VARCHAR(20), MENU_DESCRIPTION VARCHAR(20), PRIMARY KEY (MID), FOREIGN KEY (RID) REFERENCES RESTAURANTS (RID))
CREATE TABLE FOODITEM (FID VARCHAR(5) NOT NULL, MID VARCHAR(5) NOT NULL, FOODNAME VARCHAR(20), FOODPRICE DOUBLE, PRIMARY KEY (FID), FOREIGN KEY (MID) REFERENCES MENU (MID))