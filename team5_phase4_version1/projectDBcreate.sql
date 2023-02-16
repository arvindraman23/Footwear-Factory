-- USER TABLE
CREATE TABLE Fall22_S001_5_user (
    userid INT PRIMARY KEY NOT NULL,
    email VARCHAR(40),
    fname VARCHAR(20),
    mname VARCHAR(20),
    lname VARCHAR(20),
    footsize INT,
    dob DATE
);

-- USER ADDRESS TABLE
CREATE TABLE Fall22_S001_5_userAddress (
    userid INT,
    aptNo INT,
    city VARCHAR(20),
    state VARCHAR(20),
    type VARCHAR(20),
    street VARCHAR(20),
    zipcode INT,
    FOREIGN KEY (userid) REFERENCES fall22_s001_5_user(userid) ON DELETE CASCADE
);

-- SELLER TABLE
CREATE TABLE Fall22_S001_5_seller (
    sellerid INT PRIMARY KEY NOT NULL,
    email VARCHAR(40),
    fname VARCHAR(20),
    mname VARCHAR(20),
    lname VARCHAR(20),
    footsize INT,
    DOB DATE,
    FOREIGN KEY (sellerid) REFERENCES fall22_s001_5_user(userid) ON DELETE CASCADE
);

-- BUYER TABLE
CREATE TABLE Fall22_S001_5_buyer (
    buyerid INT PRIMARY KEY NOT NULL,
    email VARCHAR(40),
    fname VARCHAR(20),
    mname VARCHAR(20),
    lname VARCHAR(20),
    footsize INT,
    DOB DATE,
    FOREIGN KEY (buyerid) REFERENCES fall22_s001_5_user(userid) ON DELETE CASCADE
);

-- SHOES TABLE
CREATE TABLE Fall22_S001_5_shoes (
    sku VARCHAR(10) PRIMARY KEY NOT NULL,
    color VARCHAR(50),
    yearofmanufacture INT,
    price FLOAT,
    modelname VARCHAR(70)
);

-- REVIEWS TABLE
CREATE TABLE Fall22_S001_5_reviews (
    reviewid INT PRIMARY KEY NOT NULL,
    rating FLOAT,
    reviewcomment VARCHAR(100),
    sku VARCHAR(10),
    sellerid INT,
    shoesku VARCHAR(10),
    FOREIGN KEY (sku) REFERENCES fall22_s001_5_shoes(sku) ON DELETE CASCADE
);

-- STOCK AVAILABILITY TABLE
CREATE TABLE Fall22_S001_5_stockavailability (
    stocksku VARCHAR(10) PRIMARY KEY NOT NULL,
    footsize FLOAT,
    quantity INT
);

-- ORDERS TABLE
CREATE TABLE Fall22_S001_5_orders (
    orderid INT PRIMARY KEY NOT NULL,
    quantity INT,
    price FLOAT,
    footsize INT,
    sku VARCHAR(10)
);

-- PURCHASE HISTORY TABLE
CREATE TABLE Fall22_S001_5_purchasehistory (
    sku VARCHAR(10),
    buyerid INT,
    purchasedate DATE,
    quantity INT,
    FOREIGN KEY (buyerid) REFERENCES fall22_s001_5_buyer(buyerid) ON DELETE CASCADE
);

-- USER VIEWS TABLE
CREATE TABLE Fall22_S001_5_userviews (
    userid INT,
    shoesku VARCHAR(10),
    FOREIGN KEY (userid) REFERENCES fall22_s001_5_user(userid) ON DELETE CASCADE,
    FOREIGN KEY (shoesku) REFERENCES fall22_s001_5_shoes(sku) ON DELETE CASCADE
);

-- LISTING TABLE
CREATE TABLE Fall22_S001_5_listing (
    sellerid INT,
    sku VARCHAR(10),
    listingprice FLOAT,
    FOREIGN KEY (sellerid) REFERENCES fall22_s001_5_seller(sellerid) ON DELETE CASCADE,
    FOREIGN KEY (sku) REFERENCES fall22_s001_5_shoes(sku) ON DELETE CASCADE
);

-- ORDER PLACING TABLE
CREATE TABLE Fall22_S001_5_orderplaced (
    buyerid INT,
    orderid INT,
    FOREIGN KEY (buyerid) REFERENCES fall22_s001_5_buyer(buyerid) ON DELETE CASCADE,
    FOREIGN KEY (orderid) REFERENCES fall22_s001_5_orders(orderid) ON DELETE CASCADE
);

-- REVIEW ADD TABLE
CREATE TABLE Fall22_S001_5_reviewadded (
    buyerid INT,
    reviewid INT,
    FOREIGN KEY (buyerid) REFERENCES fall22_s001_5_buyer(buyerid) ON DELETE CASCADE,
    FOREIGN KEY (reviewid) REFERENCES fall22_s001_5_reviews(reviewid) ON DELETE CASCADE
);

-- STOCK ACCESS TABLE
CREATE TABLE Fall22_S001_5_stockaccess (
    shoesku VARCHAR(10),
    stocksku VARCHAR(10),
    FOREIGN KEY (shoesku) REFERENCES fall22_s001_5_shoes(sku) ON DELETE CASCADE,
    FOREIGN KEY (stocksku) REFERENCES fall22_s001_5_stockavailability(stocksku) ON DELETE CASCADE
);

-- ORDER UPDATES TABLE
CREATE TABLE Fall22_S001_5_orderupdate (
    orderid INT,
    stocksku VARCHAR(10),
    FOREIGN KEY (orderid) REFERENCES fall22_s001_5_orders(orderid) ON DELETE CASCADE,
    FOREIGN KEY (stocksku) REFERENCES fall22_s001_5_stockavailability(stocksku) ON DELETE CASCADE
);