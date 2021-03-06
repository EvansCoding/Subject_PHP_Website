CREATE TABLE `MEMBER`
(
    ID INT(11) AUTO_INCREMENT PRIMARY KEY,
    FULLNAME VARCHAR(200),
    USERNAME VARCHAR(50),
    PASSWORD VARCHAR(50),
    ADDRESS VARCHAR(500),
    PHONE VARCHAR(11),
    THUMNAIL VARCHAR(100),
    CREATE_AT DATETIME,
    UPDATE_AT DATETIME,
    BLOCK BIT,
    ROLE BIT DEFAULT 0
);

CREATE TABLE `CATEGORY`
( 
    ID INT(11) AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(300),
    ID_PARENT INT(11),
    CONSTRAINT FOREIGN KEY(ID_PARENT) REFERENCES CATEGORY(ID)
);

CREATE TABLE `PRODUCT`(
    ID VARCHAR(100) PRIMARY KEY,
    NAME VARCHAR(255),
    PRICE DOUBLE,
    DISCOUNT DOUBLE,
    QUANTUM INT DEFAULT 0,
    DESCRIPTION VARCHAR(500),
    CONTENT TEXT,
    STATUS BIT,
    ID_CATEGORY INT(11),
    CONSTRAINT FOREIGN KEY(ID_CATEGORY) REFERENCES CATEGORY(ID)
);

CREATE TABLE `IMAGE_PRODUCT`(
    ID INT(11) AUTO_INCREMENT PRIMARY KEY,
    THUMNAIL VARCHAR(100),
    ID_PRODUCT VARCHAR(100),
    CREATE_AT DATETIME,
    UPDATE_AT DATETIME,
    CONSTRAINT FOREIGN KEY(ID_PRODUCT) REFERENCES PRODUCT(ID)
);

CREATE TABLE `CART`(
    ID INT(11) AUTO_INCREMENT  PRIMARY KEY,
    CREATE_AT DATETIME,
    STATUS BIT,
    ID_MEMBER INT(11),
    CONSTRAINT FOREIGN KEY(ID_MEMBER) REFERENCES MEMBER(ID)
);

CREATE TABLE `DETAIL_CART`(
    ID_CART INT(11),
    ID_PRODUCT VARCHAR (100),
    QUANTUM INT DEFAULT 0,
    PRIMARY KEY(ID_CART,ID_PRODUCT),
    CONSTRAINT FOREIGN KEY(ID_CART) REFERENCES CART(ID),
    CONSTRAINT FOREIGN KEY(ID_PRODUCT) REFERENCES PRODUCT(ID)
);
