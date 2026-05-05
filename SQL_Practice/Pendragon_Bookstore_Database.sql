-- ============================================================
-- Pendragon Bookstore Database
-- Complete Master Script — All Revisions Compiled
-- Includes: Georgia + Alabama Stores, 61 Authors, 61 Books,
--           Accessories, Genre Table, Employee Performance,
--           Updated Returns Notes, WorkState Column
-- Platform: MySQL
-- ============================================================

DROP SCHEMA IF EXISTS pendragon_bookstore;
CREATE SCHEMA pendragon_bookstore;
USE pendragon_bookstore;

-- ============================================================
-- TABLE: Locations
-- ============================================================
CREATE TABLE Locations (
    ZipCode     VARCHAR(10)  NOT NULL,
    City        VARCHAR(100) NOT NULL,
    State       VARCHAR(50)  NOT NULL,
    CONSTRAINT pk_Locations PRIMARY KEY (ZipCode)
);

-- ============================================================
-- TABLE: Stores
-- ============================================================
CREATE TABLE Stores (
    StoreID     INT          NOT NULL AUTO_INCREMENT,
    StoreName   VARCHAR(150) NOT NULL DEFAULT 'Pendragon Bookstore',
    PhoneNumber VARCHAR(15)  NOT NULL,
    Email       VARCHAR(100) NOT NULL,
    Street      VARCHAR(150) NOT NULL,
    ZipCode     VARCHAR(10)  NOT NULL,
    CONSTRAINT pk_Stores PRIMARY KEY (StoreID),
    CONSTRAINT fk_Stores_ZipCode FOREIGN KEY (ZipCode)
        REFERENCES Locations(ZipCode)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Stores_Phone
        CHECK (PhoneNumber REGEXP '^[0-9\\-\\+\\(\\) ]+$'),
    CONSTRAINT chk_Stores_Email
        CHECK (Email LIKE '%@%.%')
);

CREATE INDEX idx_Stores_ZipCode ON Stores(ZipCode);

-- ============================================================
-- TABLE: Employees
-- Includes WorkState column derived from store location
-- ============================================================
CREATE TABLE Employees (
    EmployeeID  INT          NOT NULL AUTO_INCREMENT,
    FirstName   VARCHAR(100) NOT NULL,
    LastName    VARCHAR(100) NOT NULL,
    Email       VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15)  NOT NULL,
    HireDate    DATE         NOT NULL,
    Role        VARCHAR(50)  NOT NULL DEFAULT 'Sales Associate',
    StoreID     INT          NOT NULL,
    WorkState   VARCHAR(50)  NOT NULL
                COMMENT 'The U.S. state in which the employee''s store is located',
    CONSTRAINT pk_Employees PRIMARY KEY (EmployeeID),
    CONSTRAINT uq_Employees_Email UNIQUE (Email),
    CONSTRAINT fk_Employees_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Employees_Email
        CHECK (Email LIKE '%@%.%'),
    CONSTRAINT chk_Employees_Role
        CHECK (Role IN ('Store Manager', 'Assistant Manager', 'Sales Associate',
                        'Cashier', 'Inventory Specialist', 'Customer Service')),
    CONSTRAINT chk_Employees_WorkState
        CHECK (WorkState IN ('Georgia', 'Alabama'))
);

CREATE INDEX idx_Employees_StoreID ON Employees(StoreID);

-- ============================================================
-- TABLE: Customers
-- ============================================================
CREATE TABLE Customers (
    CustomerID     INT          NOT NULL AUTO_INCREMENT,
    FirstName      VARCHAR(100) NOT NULL,
    LastName       VARCHAR(100) NOT NULL,
    Email          VARCHAR(100) NOT NULL,
    PhoneNumber    VARCHAR(15)  NOT NULL,
    Street         VARCHAR(150) NOT NULL,
    ZipCode        VARCHAR(10)  NOT NULL,
    JoinDate       DATE         NOT NULL,
    MembershipType VARCHAR(50)  NOT NULL DEFAULT 'Standard',
    Status         VARCHAR(20)  NOT NULL DEFAULT 'Active',
    StoreID        INT          NOT NULL,
    CONSTRAINT pk_Customers PRIMARY KEY (CustomerID),
    CONSTRAINT uq_Customers_Email UNIQUE (Email),
    CONSTRAINT fk_Customers_ZipCode FOREIGN KEY (ZipCode)
        REFERENCES Locations(ZipCode)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_Customers_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Customers_Email
        CHECK (Email LIKE '%@%.%'),
    CONSTRAINT chk_Customers_MembershipType
        CHECK (MembershipType IN ('Standard', 'Student', 'Senior', 'Premium', 'Staff')),
    CONSTRAINT chk_Customers_Status
        CHECK (Status IN ('Active', 'Inactive', 'Suspended'))
);

CREATE INDEX idx_Customers_StoreID ON Customers(StoreID);
CREATE INDEX idx_Customers_ZipCode ON Customers(ZipCode);

-- ============================================================
-- TABLE: Publishers
-- ============================================================
CREATE TABLE Publishers (
    PublisherID   INT          NOT NULL AUTO_INCREMENT,
    PublisherName VARCHAR(150) NOT NULL,
    Country       VARCHAR(100) NOT NULL,
    Website       VARCHAR(255) NULL,
    CONSTRAINT pk_Publishers PRIMARY KEY (PublisherID)
);

-- ============================================================
-- TABLE: Authors
-- ============================================================
CREATE TABLE Authors (
    AuthorID    INT          NOT NULL AUTO_INCREMENT,
    FirstName   VARCHAR(100) NOT NULL,
    LastName    VARCHAR(100) NOT NULL,
    Nationality VARCHAR(100) NULL,
    BirthDate   DATE         NULL,
    CONSTRAINT pk_Authors PRIMARY KEY (AuthorID)
);

-- ============================================================
-- TABLE: Books
-- ============================================================
CREATE TABLE Books (
    BookID        INT          NOT NULL AUTO_INCREMENT,
    ISBN          VARCHAR(20)  NOT NULL,
    Title         VARCHAR(255) NOT NULL,
    Genre         VARCHAR(100) NOT NULL,
    PublishedYear YEAR         NOT NULL,
    Edition       VARCHAR(50)  NULL,
    Language      VARCHAR(50)  NOT NULL DEFAULT 'English',
    RetailPrice   DECIMAL(8,2) NOT NULL,
    PublisherID   INT          NOT NULL,
    CONSTRAINT pk_Books PRIMARY KEY (BookID),
    CONSTRAINT uq_Books_ISBN UNIQUE (ISBN),
    CONSTRAINT fk_Books_PublisherID FOREIGN KEY (PublisherID)
        REFERENCES Publishers(PublisherID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Books_Genre
        CHECK (Genre IN ('Fiction', 'Non-Fiction', 'Science', 'History',
                         'Biography', 'Fantasy', 'Mystery', 'Romance',
                         'Horror', 'Self-Help', 'Technology', 'Children',
                         'Poetry', 'Reference', 'Other')),
    CONSTRAINT chk_Books_Price
        CHECK (RetailPrice > 0)
);

CREATE INDEX idx_Books_PublisherID ON Books(PublisherID);

-- ============================================================
-- TABLE: Book_Authors
-- ============================================================
CREATE TABLE Book_Authors (
    BookID   INT NOT NULL,
    AuthorID INT NOT NULL,
    CONSTRAINT pk_Book_Authors PRIMARY KEY (BookID, AuthorID),
    CONSTRAINT fk_BookAuthors_BookID FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_BookAuthors_AuthorID FOREIGN KEY (AuthorID)
        REFERENCES Authors(AuthorID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ============================================================
-- TABLE: Inventory
-- ============================================================
CREATE TABLE Inventory (
    InventoryID    INT NOT NULL AUTO_INCREMENT,
    BookID         INT NOT NULL,
    StoreID        INT NOT NULL,
    QuantityOnHand INT NOT NULL DEFAULT 0,
    ReorderLevel   INT NOT NULL DEFAULT 5,
    CONSTRAINT pk_Inventory PRIMARY KEY (InventoryID),
    CONSTRAINT uq_Inventory_BookStore UNIQUE (BookID, StoreID),
    CONSTRAINT fk_Inventory_BookID FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_Inventory_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Inventory_Quantity
        CHECK (QuantityOnHand >= 0)
);

CREATE INDEX idx_Inventory_BookID  ON Inventory(BookID);
CREATE INDEX idx_Inventory_StoreID ON Inventory(StoreID);

-- ============================================================
-- TABLE: Orders
-- ============================================================
CREATE TABLE Orders (
    OrderID    INT         NOT NULL AUTO_INCREMENT,
    OrderDate  DATE        NOT NULL,
    Status     VARCHAR(20) NOT NULL DEFAULT 'Pending',
    CustomerID INT         NOT NULL,
    StoreID    INT         NOT NULL,
    EmployeeID INT         NOT NULL,
    CONSTRAINT pk_Orders PRIMARY KEY (OrderID),
    CONSTRAINT fk_Orders_CustomerID FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_Orders_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_Orders_EmployeeID FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Orders_Status
        CHECK (Status IN ('Pending', 'Completed', 'Cancelled', 'Refunded'))
);

CREATE INDEX idx_Orders_CustomerID ON Orders(CustomerID);
CREATE INDEX idx_Orders_StoreID    ON Orders(StoreID);
CREATE INDEX idx_Orders_EmployeeID ON Orders(EmployeeID);

-- ============================================================
-- TABLE: Order_Items
-- ============================================================
CREATE TABLE Order_Items (
    OrderItemID INT           NOT NULL AUTO_INCREMENT,
    Quantity    INT           NOT NULL DEFAULT 1,
    UnitPrice   DECIMAL(8,2) NOT NULL,
    Discount    DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    OrderID     INT           NOT NULL,
    BookID      INT           NOT NULL,
    CONSTRAINT pk_Order_Items PRIMARY KEY (OrderItemID),
    CONSTRAINT fk_OrderItems_OrderID FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_OrderItems_BookID FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_OrderItems_Quantity  CHECK (Quantity > 0),
    CONSTRAINT chk_OrderItems_Price     CHECK (UnitPrice > 0),
    CONSTRAINT chk_OrderItems_Discount  CHECK (Discount >= 0 AND Discount < 100)
);

CREATE INDEX idx_OrderItems_OrderID ON Order_Items(OrderID);
CREATE INDEX idx_OrderItems_BookID  ON Order_Items(BookID);

-- ============================================================
-- TABLE: Payments
-- ============================================================
CREATE TABLE Payments (
    PaymentID           INT          NOT NULL AUTO_INCREMENT,
    PaymentDate         DATE         NOT NULL,
    PaymentMethod       VARCHAR(50)  NOT NULL,
    AmountPaid          DECIMAL(8,2) NOT NULL,
    PaymentConfirmation VARCHAR(100) NOT NULL,
    Status              VARCHAR(20)  NOT NULL DEFAULT 'Pending',
    OrderID             INT          NOT NULL,
    CONSTRAINT pk_Payments PRIMARY KEY (PaymentID),
    CONSTRAINT uq_Payments_Confirmation UNIQUE (PaymentConfirmation),
    CONSTRAINT uq_Payments_OrderID      UNIQUE (OrderID),
    CONSTRAINT fk_Payments_OrderID FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Payments_Method
        CHECK (PaymentMethod IN ('Cash', 'Credit Card', 'Debit Card',
                                 'Check', 'Venmo', 'Zelle', 'PayPal')),
    CONSTRAINT chk_Payments_Status
        CHECK (Status IN ('Paid', 'Pending', 'Refunded', 'Failed')),
    CONSTRAINT chk_Payments_Amount
        CHECK (AmountPaid > 0)
);

CREATE INDEX idx_Payments_OrderID ON Payments(OrderID);

-- ============================================================
-- TABLE: Returns
-- ============================================================
CREATE TABLE Returns (
    ReturnID    INT          NOT NULL AUTO_INCREMENT,
    ReturnDate  DATE         NOT NULL,
    Reason      VARCHAR(100) NOT NULL,
    Notes       TEXT         NULL,
    Status      VARCHAR(20)  NOT NULL DEFAULT 'Pending',
    OrderItemID INT          NOT NULL,
    EmployeeID  INT          NOT NULL,
    CONSTRAINT pk_Returns PRIMARY KEY (ReturnID),
    CONSTRAINT fk_Returns_OrderItemID FOREIGN KEY (OrderItemID)
        REFERENCES Order_Items(OrderItemID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_Returns_EmployeeID FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Returns_Reason
        CHECK (Reason IN ('Damaged', 'Wrong Item', 'Changed Mind',
                          'Duplicate Order', 'Other')),
    CONSTRAINT chk_Returns_Status
        CHECK (Status IN ('Pending', 'Approved', 'Rejected', 'Completed'))
);

CREATE INDEX idx_Returns_OrderItemID ON Returns(OrderItemID);
CREATE INDEX idx_Returns_EmployeeID  ON Returns(EmployeeID);

-- ============================================================
-- TABLE: Reservations
-- ============================================================
CREATE TABLE Reservations (
    ReservationID   INT         NOT NULL AUTO_INCREMENT,
    ReservationDate DATE        NOT NULL,
    ExpiryDate      DATE        NOT NULL,
    Status          VARCHAR(20) NOT NULL DEFAULT 'Pending',
    CustomerID      INT         NOT NULL,
    BookID          INT         NOT NULL,
    StoreID         INT         NOT NULL,
    CONSTRAINT pk_Reservations PRIMARY KEY (ReservationID),
    CONSTRAINT fk_Reservations_CustomerID FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_Reservations_BookID FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_Reservations_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Reservations_Status
        CHECK (Status IN ('Pending', 'Ready', 'Fulfilled', 'Cancelled', 'Expired')),
    CONSTRAINT chk_Reservations_Dates
        CHECK (ExpiryDate > ReservationDate)
);

CREATE INDEX idx_Reservations_CustomerID ON Reservations(CustomerID);
CREATE INDEX idx_Reservations_BookID     ON Reservations(BookID);
CREATE INDEX idx_Reservations_StoreID    ON Reservations(StoreID);

-- ============================================================
-- TABLE: Genres (standalone reference)
-- ============================================================
CREATE TABLE Genres (
    GenreID     INT          NOT NULL AUTO_INCREMENT,
    GenreName   VARCHAR(100) NOT NULL,
    Description TEXT         NULL,
    CONSTRAINT pk_Genres PRIMARY KEY (GenreID),
    CONSTRAINT uq_Genres_Name UNIQUE (GenreName)
);

-- ============================================================
-- TABLE: Genre_Books
-- ============================================================
CREATE TABLE Genre_Books (
    GenreBookID   INT          NOT NULL AUTO_INCREMENT,
    GenreID       INT          NOT NULL,
    Title         VARCHAR(255) NOT NULL,
    Author        VARCHAR(150) NOT NULL,
    PublishedYear YEAR         NULL,
    IsReal        TINYINT(1)   NOT NULL DEFAULT 1
                  COMMENT '1 = real published title, 0 = fictional/invented title',
    CONSTRAINT pk_Genre_Books PRIMARY KEY (GenreBookID),
    CONSTRAINT fk_GenreBooks_GenreID FOREIGN KEY (GenreID)
        REFERENCES Genres(GenreID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX idx_GenreBooks_GenreID ON Genre_Books(GenreID);

-- ============================================================
-- TABLE: Accessory_Categories
-- ============================================================
CREATE TABLE Accessory_Categories (
    CategoryID   INT          NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(100) NOT NULL,
    Description  TEXT         NULL,
    CONSTRAINT pk_Accessory_Categories PRIMARY KEY (CategoryID),
    CONSTRAINT uq_AccessoryCategories_Name UNIQUE (CategoryName)
);

-- ============================================================
-- TABLE: Accessories
-- ============================================================
CREATE TABLE Accessories (
    AccessoryID   INT           NOT NULL AUTO_INCREMENT,
    SKU           VARCHAR(30)   NOT NULL,
    AccessoryName VARCHAR(150)  NOT NULL,
    Description   TEXT          NULL,
    CategoryID    INT           NOT NULL,
    RetailPrice   DECIMAL(8,2)  NOT NULL,
    Material      VARCHAR(100)  NULL,
    Color         VARCHAR(50)   NULL,
    IsGiftable    TINYINT(1)    NOT NULL DEFAULT 1
                  COMMENT '1 = marketed as a gift item, 0 = utility item',
    CONSTRAINT pk_Accessories PRIMARY KEY (AccessoryID),
    CONSTRAINT uq_Accessories_SKU UNIQUE (SKU),
    CONSTRAINT fk_Accessories_CategoryID FOREIGN KEY (CategoryID)
        REFERENCES Accessory_Categories(CategoryID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Accessories_Price CHECK (RetailPrice > 0)
);

CREATE INDEX idx_Accessories_CategoryID ON Accessories(CategoryID);

-- ============================================================
-- TABLE: Accessory_Inventory
-- ============================================================
CREATE TABLE Accessory_Inventory (
    AccessoryInventoryID INT NOT NULL AUTO_INCREMENT,
    AccessoryID          INT NOT NULL,
    StoreID              INT NOT NULL,
    QuantityOnHand       INT NOT NULL DEFAULT 0,
    ReorderLevel         INT NOT NULL DEFAULT 10,
    CONSTRAINT pk_Accessory_Inventory PRIMARY KEY (AccessoryInventoryID),
    CONSTRAINT uq_AccessoryInventory_AccStore UNIQUE (AccessoryID, StoreID),
    CONSTRAINT fk_AccessoryInventory_AccessoryID FOREIGN KEY (AccessoryID)
        REFERENCES Accessories(AccessoryID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_AccessoryInventory_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_AccessoryInventory_Quantity CHECK (QuantityOnHand >= 0)
);

CREATE INDEX idx_AccessoryInventory_AccessoryID ON Accessory_Inventory(AccessoryID);
CREATE INDEX idx_AccessoryInventory_StoreID     ON Accessory_Inventory(StoreID);

-- ============================================================
-- TABLE: Accessory_Order_Items
-- ============================================================
CREATE TABLE Accessory_Order_Items (
    AccessoryOrderItemID INT           NOT NULL AUTO_INCREMENT,
    OrderID              INT           NOT NULL,
    AccessoryID          INT           NOT NULL,
    Quantity             INT           NOT NULL DEFAULT 1,
    UnitPrice            DECIMAL(8,2)  NOT NULL,
    Discount             DECIMAL(5,2)  NOT NULL DEFAULT 0.00,
    CONSTRAINT pk_Accessory_Order_Items PRIMARY KEY (AccessoryOrderItemID),
    CONSTRAINT fk_AccOrderItems_OrderID FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_AccOrderItems_AccessoryID FOREIGN KEY (AccessoryID)
        REFERENCES Accessories(AccessoryID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_AccOrderItems_Quantity CHECK (Quantity > 0),
    CONSTRAINT chk_AccOrderItems_Price    CHECK (UnitPrice > 0),
    CONSTRAINT chk_AccOrderItems_Discount CHECK (Discount >= 0 AND Discount < 100)
);

CREATE INDEX idx_AccOrderItems_OrderID     ON Accessory_Order_Items(OrderID);
CREATE INDEX idx_AccOrderItems_AccessoryID ON Accessory_Order_Items(AccessoryID);

-- ============================================================
-- TABLE: Employee_Performance
-- Annual reviews, one per employee per year per category
-- ============================================================
CREATE TABLE Employee_Performance (
    PerformanceID INT         NOT NULL AUTO_INCREMENT,
    EmployeeID    INT         NOT NULL,
    ReviewerID    INT         NOT NULL
                  COMMENT 'EmployeeID of the reviewing manager',
    ReviewDate    DATE        NOT NULL,
    ReviewYear    YEAR        NOT NULL,
    Rating        TINYINT     NOT NULL,
    Category      VARCHAR(50) NOT NULL DEFAULT 'Overall',
    Notes         TEXT        NULL,
    CONSTRAINT pk_Employee_Performance PRIMARY KEY (PerformanceID),
    CONSTRAINT uq_Performance_EmployeeYear UNIQUE (EmployeeID, ReviewYear, Category),
    CONSTRAINT fk_Performance_EmployeeID FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_Performance_ReviewerID FOREIGN KEY (ReviewerID)
        REFERENCES Employees(EmployeeID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_Performance_Rating
        CHECK (Rating BETWEEN 1 AND 10),
    CONSTRAINT chk_Performance_Category
        CHECK (Category IN ('Overall', 'Customer Service', 'Sales',
                            'Punctuality', 'Teamwork', 'Inventory Management'))
);

CREATE INDEX idx_Performance_EmployeeID ON Employee_Performance(EmployeeID);
CREATE INDEX idx_Performance_ReviewerID ON Employee_Performance(ReviewerID);
CREATE INDEX idx_Performance_Year       ON Employee_Performance(ReviewYear);

-- ============================================================
-- ============================================================
-- DATA INSERTS
-- ============================================================
-- ============================================================

-- ============================================================
-- INSERT: Locations — Georgia (11) + Alabama (20)
-- ============================================================
INSERT IGNORE INTO Locations (ZipCode, City, State) VALUES
-- Georgia
('30301', 'Atlanta',     'Georgia'),
('30601', 'Athens',      'Georgia'),
('30901', 'Augusta',     'Georgia'),
('31201', 'Macon',       'Georgia'),
('31401', 'Savannah',    'Georgia'),
('30501', 'Gainesville', 'Georgia'),
('30701', 'Dalton',      'Georgia'),
('31701', 'Albany',      'Georgia'),
('30801', 'Evans',       'Georgia'),
('30401', 'Swainsboro',  'Georgia'),
('31901', 'Columbus',    'Georgia'),
-- Alabama
('35203', 'Birmingham',  'Alabama'),
('36104', 'Montgomery',  'Alabama'),
('35801', 'Huntsville',  'Alabama'),
('36602', 'Mobile',      'Alabama'),
('35401', 'Tuscaloosa',  'Alabama'),
('36830', 'Auburn',      'Alabama'),
('35601', 'Decatur',     'Alabama'),
('35901', 'Gadsden',     'Alabama'),
('36201', 'Anniston',    'Alabama'),
('35630', 'Florence',    'Alabama'),
('36301', 'Dothan',      'Alabama'),
('36801', 'Opelika',     'Alabama'),
('35055', 'Cullman',     'Alabama'),
('35501', 'Jasper',      'Alabama'),
('35007', 'Alabaster',   'Alabama'),
('36330', 'Enterprise',  'Alabama'),
('35150', 'Talladega',   'Alabama'),
('35004', 'Moody',       'Alabama'),
('36420', 'Andalusia',   'Alabama'),
('36701', 'Selma',       'Alabama');

-- ============================================================
-- INSERT: Stores — Georgia (11) + Alabama (20)
-- ============================================================
INSERT IGNORE INTO Stores (StoreID, StoreName, PhoneNumber, Email, Street, ZipCode) VALUES
-- Georgia
(1,  'Pendragon Bookstore', '(404) 100-2001', 'atlanta@pendragon.com',     '100 Peachtree St NW',  '30301'),
(2,  'Pendragon Bookstore', '(706) 100-2002', 'athens@pendragon.com',      '200 College Ave',      '30601'),
(3,  'Pendragon Bookstore', '(706) 100-2003', 'augusta@pendragon.com',     '300 Broad St',         '30901'),
(4,  'Pendragon Bookstore', '(478) 100-2004', 'macon@pendragon.com',       '400 Cherry St',        '31201'),
(5,  'Pendragon Bookstore', '(912) 100-2005', 'savannah@pendragon.com',    '500 River St',         '31401'),
(6,  'Pendragon Bookstore', '(770) 100-2006', 'gainesville@pendragon.com', '600 Main St',          '30501'),
(7,  'Pendragon Bookstore', '(706) 100-2007', 'dalton@pendragon.com',      '700 Waugh St',         '30701'),
(8,  'Pendragon Bookstore', '(229) 100-2008', 'albany@pendragon.com',      '800 Pine Ave',         '31701'),
(9,  'Pendragon Bookstore', '(706) 100-2009', 'evans@pendragon.com',       '900 Harlem Rd',        '30801'),
(10, 'Pendragon Bookstore', '(478) 100-2010', 'swainsboro@pendragon.com',  '1000 South Main St',   '30401'),
(11, 'Pendragon Bookstore', '(706) 100-2011', 'columbus@pendragon.com',    '1100 Broadway',        '31901'),
-- Alabama
(12, 'Pendragon Bookstore', '(205) 300-4012', 'birmingham@pendragon.com',  '1200 Morris Ave',      '35203'),
(13, 'Pendragon Bookstore', '(334) 300-4013', 'montgomery@pendragon.com',  '1301 Commerce St',     '36104'),
(14, 'Pendragon Bookstore', '(256) 300-4014', 'huntsville@pendragon.com',  '1400 Church St NW',    '35801'),
(15, 'Pendragon Bookstore', '(251) 300-4015', 'mobile@pendragon.com',      '1500 Dauphin St',      '36602'),
(16, 'Pendragon Bookstore', '(334) 300-4016', 'tuscaloosa@pendragon.com',  '1600 University Blvd', '35401'),
(17, 'Pendragon Bookstore', '(334) 300-4017', 'auburn@pendragon.com',      '1700 College St',      '36830'),
(18, 'Pendragon Bookstore', '(256) 300-4018', 'decatur@pendragon.com',     '1800 Bank St NE',      '35601'),
(19, 'Pendragon Bookstore', '(205) 300-4019', 'gadsden@pendragon.com',     '1900 Broad St',        '35901'),
(20, 'Pendragon Bookstore', '(205) 300-4020', 'anniston@pendragon.com',    '2000 Noble St',        '36201'),
(21, 'Pendragon Bookstore', '(256) 300-4021', 'florence@pendragon.com',    '2100 N Court St',      '35630'),
(22, 'Pendragon Bookstore', '(334) 300-4022', 'dothan@pendragon.com',      '2200 W Main St',       '36301'),
(23, 'Pendragon Bookstore', '(334) 300-4023', 'opelika@pendragon.com',     '2300 S Railroad Ave',  '36801'),
(24, 'Pendragon Bookstore', '(205) 300-4024', 'cullman@pendragon.com',     '2400 4th Ave SW',      '35055'),
(25, 'Pendragon Bookstore', '(205) 300-4025', 'jasper@pendragon.com',      '2500 Highway 78 E',    '35501'),
(26, 'Pendragon Bookstore', '(205) 300-4026', 'alabaster@pendragon.com',   '2600 US-31',           '35007'),
(27, 'Pendragon Bookstore', '(334) 300-4027', 'enterprise@pendragon.com',  '2700 Boll Weevil Cir', '36330'),
(28, 'Pendragon Bookstore', '(205) 300-4028', 'talladega@pendragon.com',   '2800 Battle St E',     '35150'),
(29, 'Pendragon Bookstore', '(205) 300-4029', 'moody@pendragon.com',       '2900 Moody Pkwy',      '35004'),
(30, 'Pendragon Bookstore', '(334) 300-4030', 'andalusia@pendragon.com',   '3000 Bypass Dr E',     '36420'),
(31, 'Pendragon Bookstore', '(334) 300-4031', 'selma@pendragon.com',       '3100 Broad St',        '36701');

-- ============================================================
-- INSERT: Employees — Georgia (11) + Alabama (40) — with WorkState
-- ============================================================
INSERT IGNORE INTO Employees (EmployeeID, FirstName, LastName, Email, PhoneNumber, HireDate, Role, StoreID, WorkState) VALUES
-- Georgia
(1,  'Yukihiro', 'Souma',      'yukihiro.souma@pendragon.com',     '(404) 201-3001', '2021-03-15', 'Store Manager',        1,  'Georgia'),
(2,  'Amara',    'Mensah',     'amara.mensah@pendragon.com',       '(706) 201-3002', '2020-07-22', 'Assistant Manager',    2,  'Georgia'),
(3,  'Diego',    'Reyes',      'diego.reyes@pendragon.com',        '(706) 201-3003', '2022-01-10', 'Sales Associate',      3,  'Georgia'),
(4,  'Fatima',   'Al-Rashid',  'fatima.alrashid@pendragon.com',    '(478) 201-3004', '2019-05-18', 'Store Manager',        4,  'Georgia'),
(5,  'Priya',    'Nair',       'priya.nair@pendragon.com',         '(912) 201-3005', '2023-02-28', 'Cashier',              5,  'Georgia'),
(6,  'Elijah',   'Washington', 'elijah.washington@pendragon.com',  '(770) 201-3006', '2021-09-14', 'Inventory Specialist', 6,  'Georgia'),
(7,  'Ingrid',   'Sorensen',   'ingrid.sorensen@pendragon.com',    '(706) 201-3007', '2020-11-03', 'Assistant Manager',    7,  'Georgia'),
(8,  'Kofi',     'Asante',     'kofi.asante@pendragon.com',        '(229) 201-3008', '2022-06-20', 'Sales Associate',      8,  'Georgia'),
(9,  'Mei',      'Lin',        'mei.lin@pendragon.com',            '(706) 201-3009', '2018-04-11', 'Store Manager',        9,  'Georgia'),
(10, 'Aaliyah',  'Baptiste',   'aaliyah.baptiste@pendragon.com',   '(478) 201-3010', '2023-08-05', 'Customer Service',     10, 'Georgia'),
(11, 'Rashid',   'Okonkwo',    'rashid.okonkwo@pendragon.com',     '(706) 201-3011', '2019-12-17', 'Cashier',              11, 'Georgia'),
-- Alabama — Store 12: Birmingham
(12, 'Imani',    'Osei-Mensah', 'imani.oseim@pendragon.com',       '(205) 401-5012', '2022-03-07', 'Store Manager',        12, 'Alabama'),
(13, 'Devon',    'Calloway',    'devon.calloway@pendragon.com',    '(205) 401-5013', '2023-06-14', 'Sales Associate',      12, 'Alabama'),
-- Store 13: Montgomery
(14, 'Yolanda',  'Trujillo',    'yolanda.trujillo@pendragon.com',  '(334) 401-5014', '2021-11-01', 'Store Manager',        13, 'Alabama'),
(15, 'Marcus',   'Lindqvist',   'marcus.lindqvist@pendragon.com',  '(334) 401-5015', '2022-08-19', 'Cashier',              13, 'Alabama'),
-- Store 14: Huntsville
(16, 'Priyanka', 'Okonkwo',     'priyanka.okonkwo@pendragon.com',  '(256) 401-5016', '2020-04-22', 'Store Manager',        14, 'Alabama'),
(17, 'Elliot',   'Nakashima',   'elliot.nakashima@pendragon.com',  '(256) 401-5017', '2023-01-09', 'Inventory Specialist', 14, 'Alabama'),
-- Store 15: Mobile
(18, 'Celeste',  'Abubakar',    'celeste.abubakar@pendragon.com',  '(251) 401-5018', '2021-07-30', 'Store Manager',        15, 'Alabama'),
(19, 'Jordan',   'Ferreira',    'jordan.ferreira@pendragon.com',   '(251) 401-5019', '2022-10-11', 'Customer Service',     15, 'Alabama'),
-- Store 16: Tuscaloosa
(20, 'Amara',    'Petrov',      'amara.petrov@pendragon.com',      '(334) 401-5020', '2019-09-03', 'Store Manager',        16, 'Alabama'),
(21, 'Hassan',   'Beaumont',    'hassan.beaumont@pendragon.com',   '(334) 401-5021', '2023-04-17', 'Sales Associate',      16, 'Alabama'),
-- Store 17: Auburn
(22, 'Saoirse',  'Nakamura',    'saoirse.nakamura@pendragon.com',  '(334) 401-5022', '2022-01-25', 'Assistant Manager',    17, 'Alabama'),
(23, 'Tobias',   'Mensah',      'tobias.mensah@pendragon.com',     '(334) 401-5023', '2023-08-02', 'Cashier',              17, 'Alabama'),
-- Store 18: Decatur
(24, 'Nneka',    'Johansson',   'nneka.johansson@pendragon.com',   '(256) 401-5024', '2022-05-16', 'Store Manager',        18, 'Alabama'),
(25, 'Liam',     'Oduya',       'liam.oduya@pendragon.com',        '(256) 401-5025', '2023-07-03', 'Sales Associate',      18, 'Alabama'),
-- Store 19: Gadsden
(26, 'Fatou',    'Christensen', 'fatou.christensen@pendragon.com', '(205) 401-5026', '2020-12-15', 'Store Manager',        19, 'Alabama'),
(27, 'Rowan',    'Adeyemi',     'rowan.adeyemi@pendragon.com',     '(205) 401-5027', '2023-03-28', 'Sales Associate',      19, 'Alabama'),
-- Store 20: Anniston
(28, 'Keiko',    'Oduya',       'keiko.oduya@pendragon.com',       '(205) 401-5028', '2021-05-10', 'Store Manager',        20, 'Alabama'),
(29, 'Damien',   'Vasquez',     'damien.vasquez@pendragon.com',    '(205) 401-5029', '2022-11-23', 'Inventory Specialist', 20, 'Alabama'),
-- Store 21: Florence
(30, 'Anaya',    'Sorensen',    'anaya.sorensen@pendragon.com',    '(256) 401-5030', '2020-06-08', 'Store Manager',        21, 'Alabama'),
(31, 'Felix',    'Okafor',      'felix.okafor@pendragon.com',      '(256) 401-5031', '2023-09-16', 'Cashier',              21, 'Alabama'),
-- Store 22: Dothan
(32, 'Miriam',   'Halvorsen',   'miriam.halvorsen@pendragon.com',  '(334) 401-5032', '2021-02-14', 'Store Manager',        22, 'Alabama'),
(33, 'Kwame',    'Delacroix',   'kwame.delacroix@pendragon.com',   '(334) 401-5033', '2022-07-05', 'Sales Associate',      22, 'Alabama'),
-- Store 23: Opelika
(34, 'Sienna',   'Abara',       'sienna.abara@pendragon.com',      '(334) 401-5034', '2022-04-11', 'Store Manager',        23, 'Alabama'),
(35, 'Caden',    'Osei',        'caden.osei@pendragon.com',        '(334) 401-5035', '2023-10-02', 'Cashier',              23, 'Alabama'),
-- Store 24: Cullman
(36, 'Zuri',     'Magnusson',   'zuri.magnusson@pendragon.com',    '(205) 401-5036', '2021-08-23', 'Store Manager',        24, 'Alabama'),
(37, 'Elena',    'Nwosu',       'elena.nwosu@pendragon.com',       '(205) 401-5037', '2023-02-07', 'Sales Associate',      24, 'Alabama'),
-- Store 25: Jasper
(38, 'Tariq',    'Lindqvist',   'tariq.lindqvist@pendragon.com',   '(205) 401-5038', '2020-10-19', 'Store Manager',        25, 'Alabama'),
(39, 'Amina',    'Petersen',    'amina.petersen@pendragon.com',    '(205) 401-5039', '2023-05-30', 'Cashier',              25, 'Alabama'),
-- Store 26: Alabaster
(40, 'Darius',   'Volkov',      'darius.volkov@pendragon.com',     '(205) 401-5040', '2021-03-25', 'Store Manager',        26, 'Alabama'),
(41, 'Yuki',     'Mensah',      'yuki.mensah@pendragon.com',       '(205) 401-5041', '2023-11-06', 'Sales Associate',      26, 'Alabama'),
-- Store 27: Enterprise
(42, 'Chidinma', 'Sorensen',    'chidinma.sorensen@pendragon.com', '(334) 401-5042', '2022-06-13', 'Store Manager',        27, 'Alabama'),
(43, 'Rafael',   'Osei-Kuffour','rafael.oseik@pendragon.com',      '(334) 401-5043', '2023-09-01', 'Cashier',              27, 'Alabama'),
-- Store 28: Talladega
(44, 'Nadia',    'Brennan',     'nadia.brennan@pendragon.com',     '(205) 401-5044', '2021-07-08', 'Store Manager',        28, 'Alabama'),
(45, 'Kofi',     'Andersen',    'kofi.andersen@pendragon.com',     '(205) 401-5045', '2023-04-22', 'Sales Associate',      28, 'Alabama'),
-- Store 29: Moody
(46, 'Leila',    'Okonkwo',     'leila.okonkwo@pendragon.com',     '(205) 401-5046', '2020-09-14', 'Store Manager',        29, 'Alabama'),
(47, 'Matteo',   'Abiodun',     'matteo.abiodun@pendragon.com',    '(205) 401-5047', '2023-06-27', 'Cashier',              29, 'Alabama'),
-- Store 30: Andalusia
(48, 'Seun',     'Holmberg',    'seun.holmberg@pendragon.com',     '(334) 401-5048', '2022-02-28', 'Store Manager',        30, 'Alabama'),
(49, 'Cleo',     'Nakamura',    'cleo.nakamura@pendragon.com',     '(334) 401-5049', '2023-08-14', 'Sales Associate',      30, 'Alabama'),
-- Store 31: Selma
(50, 'Adaeze',   'Petrov',      'adaeze.petrov@pendragon.com',     '(334) 401-5050', '2021-11-30', 'Store Manager',        31, 'Alabama'),
(51, 'Jerome',   'Osei',        'jerome.osei@pendragon.com',       '(334) 401-5051', '2023-03-15', 'Cashier',              31, 'Alabama');

-- ============================================================
-- INSERT: Customers
-- ============================================================
INSERT IGNORE INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Street, ZipCode, JoinDate, MembershipType, Status, StoreID) VALUES
(1,  'Emily',   'Moss',      'emily.moss@gmail.com',       '678-900-5900', '101 Magnolia Ln',       '30301', '2024-01-15', 'Premium',  'Active',   1),
(2,  'James',   'Carter',    'james.carter@gmail.com',     '404-321-7845', '202 Peach Tree Rd',     '30601', '2024-02-10', 'Standard', 'Active',   2),
(3,  'Sarah',   'Whitfield', 'sarah.whitfield@yahoo.com',  '770-654-3210', '303 Dogwood Dr',        '30901', '2024-02-28', 'Student',  'Active',   3),
(4,  'Marcus',  'Dillard',   'marcus.dillard@outlook.com', '678-445-9023', '404 Azalea Blvd',       '31201', '2024-03-05', 'Standard', 'Active',   4),
(5,  'Patrice', 'Holman',    'patrice.holman@gmail.com',   '404-789-6541', '505 Wisteria Way',      '31401', '2024-03-18', 'Senior',   'Active',   5),
(6,  'Derek',   'Langford',  'derek.langford@yahoo.com',   '770-234-8796', '606 Camellia Ct',       '30501', '2024-04-01', 'Standard', 'Active',   6),
(7,  'Angela',  'Simmons',   'angela.simmons@gmail.com',   '678-567-4312', '707 Jasmine St',        '30701', '2024-04-12', 'Premium',  'Active',   7),
(8,  'Trevor',  'Banks',     'trevor.banks@outlook.com',   '404-890-1234', '808 Honeysuckle Ave',   '31701', '2024-05-03', 'Student',  'Active',   8),
(9,  'Latoya',  'Freeman',   'latoya.freeman@gmail.com',   '770-345-6789', '909 Gardenia Blvd',     '30801', '2024-05-22', 'Standard', 'Active',   9),
(10, 'Colin',   'Marsh',     'colin.marsh@yahoo.com',      '678-123-4567', '1010 Rosewood Dr',      '30401', '2024-06-08', 'Senior',   'Inactive', 10),
(11, 'Brianna', 'Okafor',    'brianna.okafor@gmail.com',   '404-567-8901', '1111 Violet Valley Rd', '31901', '2024-06-30', 'Standard', 'Active',   11);

-- ============================================================
-- INSERT: Publishers (20 total)
-- ============================================================
INSERT IGNORE INTO Publishers (PublisherID, PublisherName, Country, Website) VALUES
(1,  'Horizon Press',         'United States', 'www.horizonpress.com'),
(2,  'Maple Leaf Publishing', 'Canada',        'www.mapleleafpub.com'),
(3,  'Sahara Books',          'Nigeria',       'www.saharabooks.com'),
(4,  'Vega Literary Group',   'Mexico',        'www.vegaliterary.com'),
(5,  'Beaumont Editions',     'France',        'www.beaumonteditions.fr'),
(6,  'Nakamura Press',        'Japan',         'www.nakamurapress.jp'),
(7,  'Sharma Publishing',     'India',         'www.sharmapublishing.in'),
(8,  'Dublin House Books',    'Ireland',       'www.dublinhousebooks.ie'),
(9,  'Vasquez & Co.',         'Spain',         'www.vasquezco.es'),
(10, 'Okafor Literary Works', 'Nigeria',       'www.okaforliterary.com'),
(11, 'Pemberton Publishing',  'United Kingdom','www.pembertonpublishing.co.uk'),
(12, 'Crossroads Literary',   'United States', 'www.crossroadsliterary.com'),
(13, 'Tundra House Press',    'Canada',        'www.tundrahousepress.ca'),
(14, 'Baobab & Birch',        'Kenya',         'www.baobabandbirch.co.ke'),
(15, 'Solstice Publishing',   'Australia',     'www.solsticepublishing.au'),
(16, 'Meridian Books',        'South Africa',  'www.meridianbooks.co.za'),
(17, 'Sakura Ink',            'Japan',         'www.sakuraink.jp'),
(18, 'Olive & Papyrus Press', 'Greece',        'www.olivepapyrus.gr'),
(19, 'Andean Ink',            'Peru',          'www.andeanink.pe'),
(20, 'Fjord Literary House',  'Norway',        'www.fjordliterary.no');

-- ============================================================
-- INSERT: Authors (61 total — diverse, non-stereotypical)
-- ============================================================
INSERT IGNORE INTO Authors (AuthorID, FirstName, LastName, Nationality, BirthDate) VALUES
(1,  'Tiffany',   'Ngozi',       'Nigerian-American',     '1985-03-12'),
(2,  'James',     'Whitmore',    'American',              '1972-07-04'),
(3,  'Amara',     'Osei',        'Ghanaian',              '1990-11-22'),
(4,  'Carlos',    'Vega',        'Mexican',               '1968-05-30'),
(5,  'Sophie',    'Beaumont',    'French',                '1983-09-15'),
(6,  'Kenji',     'Nakamura',    'Japanese',              '1975-01-08'),
(7,  'Priya',     'Sharma',      'Indian',                '1992-06-25'),
(8,  'Liam',      'O''Brien',    'Irish',                 '1965-04-17'),
(9,  'Elena',     'Vasquez',     'Spanish',               '1988-12-03'),
(10, 'Marcus',    'Okafor',      'Nigerian',              '1979-08-19'),
(11, 'Charlotte', 'Pemberton',   'British',               '1995-02-28'),
(12, 'Saoirse',   'Oduya',       'Irish-Nigerian',        '1987-06-14'),
(13, 'Dmitri',    'Nakashima',   'Russian-Japanese',      '1974-11-02'),
(14, 'Valentina', 'Achebe',      'Italian-Ghanaian',      '1993-03-27'),
(15, 'Eamon',     'Delacroix',   'Canadian',              '1969-08-19'),
(16, 'Zara',      'Lindström',   'Swedish-Somali',        '1991-01-30'),
(17, 'Kwabena',   'Ferreira',    'Ghanaian-Brazilian',    '1982-05-11'),
(18, 'Adaeze',    'Svensson',    'Nigerian-Swedish',      '1996-09-08'),
(19, 'Tomás',     'Ikeda',       'Irish-Japanese',        '1978-12-22'),
(20, 'Nneka',     'Ostrowski',   'Nigerian-Polish',       '1985-07-04'),
(21, 'Rowan',     'Mbeki',       'Scottish-South African','1990-04-16'),
(22, 'Haruki',    'Solberg',     'Japanese-Norwegian',    '1976-02-09'),
(23, 'Divya',     'Castellanos', 'Indian-Spanish',        '1988-10-23'),
(24, 'Minh',      'Abara',       'Vietnamese-Nigerian',   '1994-06-05'),
(25, 'Sunita',    'Kowalczyk',   'Indian-Polish',         '1971-03-18'),
(26, 'Jae-won',   'Osei',        'Korean-Ghanaian',       '1983-08-30'),
(27, 'Laleh',     'Christiansen','Iranian-Danish',        '1995-01-12'),
(28, 'Ravi',      'Johansson',   'Sri Lankan-Swedish',    '1967-11-27'),
(29, 'Ying',      'Nkemdirim',   'Chinese-Nigerian',      '1992-04-03'),
(30, 'Farrukh',   'Brennan',     'Uzbek-Irish',           '1980-09-15'),
(31, 'Ananya',    'Visser',      'Indian-Dutch',          '1997-07-21'),
(32, 'Xiomara',   'Lindqvist',   'Cuban-Swedish',         '1986-12-08'),
(33, 'Danilo',    'Eze',         'Brazilian-Nigerian',    '1973-05-24'),
(34, 'Yara',      'Björk',       'Venezuelan-Icelandic',  '1991-02-17'),
(35, 'Marisol',   'Takahashi',   'Puerto Rican-Japanese', '1984-10-01'),
(36, 'Emeka',     'Rodrigues',   'Nigerian-Portuguese',   '1977-06-29'),
(37, 'Catalina',  'Okafor',      'Colombian-Nigerian',    '1998-03-14'),
(38, 'Leandro',   'Mensah',      'Argentine-Ghanaian',    '1969-08-06'),
(39, 'Simone',    'Abubakar',    'Haitian-Nigerian',      '1993-11-19'),
(40, 'Rafael',    'Anand',       'Mexican-Indian',        '1981-01-08'),
(41, 'Nadia',     'Ferreira',    'Dominican-Brazilian',   '1975-04-22'),
(42, 'Yasmine',   'Petrov',      'Algerian-Russian',      '1989-07-17'),
(43, 'Tariq',     'Holmberg',    'Moroccan-Swedish',      '1972-09-03'),
(44, 'Leila',     'Okonkwo',     'Lebanese-Nigerian',     '1994-12-26'),
(45, 'Arash',     'Nwosu',       'Iranian-Nigerian',      '1968-05-09'),
(46, 'Nour',      'Christiansen','Egyptian-Danish',       '1996-02-14'),
(47, 'Cyrus',     'Abiodun',     'Persian-Yoruba',        '1980-10-31'),
(48, 'Dina',      'Magnusson',   'Jordanian-Swedish',     '1987-06-22'),
(49, 'Samir',     'Kowalski',    'Tunisian-Polish',       '1976-03-05'),
(50, 'Farida',    'Nakamura',    'Afghan-Japanese',       '1991-08-18'),
(51, 'Khalid',    'Dubois',      'Saudi-French',          '1983-01-29'),
(52, 'Aroha',     'Mensah',      'Māori-Ghanaian',        '1992-04-11'),
(53, 'Tūhoe',     'Petersen',    'Māori-Danish',          '1978-09-25'),
(54, 'Kainoa',    'Abebe',       'Hawaiian-Ethiopian',    '1985-12-03'),
(55, 'Moana',     'Ferreira',    'Polynesian-Brazilian',  '1997-06-17'),
(56, 'Ezinne',    'Larsson',     'Igbo-Swedish',          '1974-02-28'),
(57, 'Chisom',    'Andersen',    'Nigerian-Danish',       '1990-10-14'),
(58, 'Amahle',    'Kowalczyk',   'Zulu-Polish',           '1988-07-07'),
(59, 'Tendai',    'Björnsson',   'Zimbabwean-Icelandic',  '1971-03-21'),
(60, 'Oluwaseun', 'Petrov',      'Yoruba-Russian',        '1995-11-09'),
(61, 'Kehinde',   'Sørensen',    'Nigerian-Danish',       '1982-05-30');

-- ============================================================
-- INSERT: Books (61 total)
-- ============================================================
INSERT IGNORE INTO Books (BookID, ISBN, Title, Genre, PublishedYear, Edition, Language, RetailPrice, PublisherID) VALUES
(1,  '978-1-001-00001-1', 'Echoes of the Savanna',          'Fiction',     2018, '1st', 'English', 19.99,  1),
(2,  '978-1-001-00002-2', 'The Cartographer''s Secret',     'Mystery',     2015, '2nd', 'English', 14.99,  2),
(3,  '978-1-001-00003-3', 'Roots of Gold',                  'Biography',   2020, '1st', 'English', 24.99,  3),
(4,  '978-1-001-00004-4', 'Beneath the Agave Moon',         'Romance',     2019, '1st', 'Spanish', 17.99,  4),
(5,  '978-1-001-00005-5', 'The Lavender District',          'Fiction',     2021, '1st', 'French',  22.99,  5),
(6,  '978-1-001-00006-6', 'Storm of Cherry Blossoms',       'Fantasy',     2017, '3rd', 'English', 16.99,  6),
(7,  '978-1-001-00007-7', 'The Saffron Path',               'Self-Help',   2022, '1st', 'English', 18.99,  7),
(8,  '978-1-001-00008-8', 'Cliffs of Connemara',            'History',     2014, '2nd', 'English', 21.99,  8),
(9,  '978-1-001-00009-9', 'Shadows Over Seville',           'Horror',      2023, '1st', 'English', 15.99,  9),
(10, '978-1-001-00010-0', 'The Lagos Chronicles',           'Non-Fiction', 2016, '1st', 'English', 23.99, 10),
(11, '978-1-001-00011-1', 'A Garden in Devonshire',         'Romance',     2020, '2nd', 'English', 13.99, 11),
(12, '978-1-001-00012-2', 'The Cork and the Tide',          'Fiction',     2019, '1st', 'English', 18.99, 12),
(13, '978-1-001-00013-3', 'Drift Without Anchor',           'Fiction',     2021, '1st', 'English', 21.99, 13),
(14, '978-1-001-00014-4', 'The Vermillion Accord',          'Mystery',     2018, '1st', 'English', 16.99, 14),
(15, '978-1-001-00015-5', 'Pale Roads to Fenwick',          'History',     2020, '2nd', 'English', 23.99, 15),
(16, '978-1-001-00016-6', 'Between Dust and Longitude',     'Non-Fiction', 2017, '1st', 'English', 19.99, 16),
(17, '978-1-001-00017-7', 'The Lantern Fisherman',          'Fiction',     2022, '1st', 'English', 20.99, 12),
(18, '978-1-001-00018-8', 'Salt and Inheritance',           'Biography',   2020, '1st', 'English', 24.99, 13),
(19, '978-1-001-00019-9', 'The Amber Cartography',          'Fantasy',     2023, '1st', 'English', 17.99, 14),
(20, '978-1-001-00020-0', 'What the Monsoon Leaves Behind', 'Fiction',     2021, '1st', 'English', 22.99, 15),
(21, '978-1-001-00021-1', 'Seventeen Silences',             'Mystery',     2019, '1st', 'English', 15.99, 16),
(22, '978-1-001-00022-2', 'The Cartographer of Lost Seasons','Fiction',    2020, '1st', 'English', 18.99, 17),
(23, '978-1-001-00023-3', 'Borrowed Sun',                   'Romance',     2022, '1st', 'English', 16.99, 18),
(24, '978-1-001-00024-4', 'The Red Bridge Letters',         'History',     2018, '1st', 'English', 21.99, 19),
(25, '978-1-001-00025-5', 'Unmapped',                       'Self-Help',   2021, '1st', 'English', 19.99, 20),
(26, '978-1-001-00026-6', 'The Weight of Open Water',       'Fiction',     2023, '1st', 'English', 17.99, 12),
(27, '978-1-001-00027-7', 'Mirrors in the Fog',             'Horror',      2019, '1st', 'English', 14.99, 13),
(28, '978-1-001-00028-8', 'The Final Garden',               'Romance',     2022, '2nd', 'English', 20.99, 14),
(29, '978-1-001-00029-9', 'Echoes from the Pearl River',    'Fiction',     2020, '1st', 'English', 23.99, 15),
(30, '978-1-001-00030-0', 'A Thousand Small Departures',    'Biography',   2018, '1st', 'English', 18.99, 16),
(31, '978-1-001-00031-1', 'Where the Tulips Fell',          'Fiction',     2021, '1st', 'English', 16.99, 17),
(32, '978-1-001-00032-2', 'The Havana Frequency',           'Mystery',     2019, '1st', 'English', 15.99, 18),
(33, '978-1-001-00033-3', 'Children of the Caatinga',       'Fiction',     2022, '1st', 'English', 22.99, 19),
(34, '978-1-001-00034-4', 'Glacier Song',                   'Poetry',      2020, '1st', 'English', 13.99, 20),
(35, '978-1-001-00035-5', 'The Ceiba and the Storm',        'Fiction',     2023, '1st', 'English', 19.99, 12),
(36, '978-1-001-00036-6', 'Unfinished Atlas',               'Non-Fiction', 2021, '1st', 'English', 21.99, 13),
(37, '978-1-001-00037-7', 'The Bogotá Inheritance',         'Mystery',     2018, '1st', 'English', 16.99, 14),
(38, '978-1-001-00038-8', 'Roots in the Pampas',            'Biography',   2020, '1st', 'English', 24.99, 15),
(39, '978-1-001-00039-9', 'The Port-au-Prince Journals',    'History',     2022, '1st', 'English', 20.99, 16),
(40, '978-1-001-00040-0', 'Dust Over Oaxaca',               'Fiction',     2019, '1st', 'English', 17.99, 17),
(41, '978-1-001-00041-1', 'The Long Road from Santiago',    'Fiction',     2021, '1st', 'English', 18.99, 18),
(42, '978-1-001-00042-2', 'The Algiers Manuscript',         'Mystery',     2020, '1st', 'English', 15.99, 19),
(43, '978-1-001-00043-3', 'Sand and Silence',               'Fiction',     2018, '1st', 'English', 21.99, 20),
(44, '978-1-001-00044-4', 'The Cedar House',                'Fiction',     2022, '1st', 'English', 19.99, 12),
(45, '978-1-001-00045-5', 'Threads of the Old City',        'History',     2021, '1st', 'English', 23.99, 13),
(46, '978-1-001-00046-6', 'The Nile in Winter',             'Fiction',     2019, '1st', 'English', 16.99, 14),
(47, '978-1-001-00047-7', 'Beyond the Qanat',               'Fantasy',     2023, '1st', 'English', 20.99, 15),
(48, '978-1-001-00048-8', 'The Amman Letters',              'Romance',     2020, '1st', 'English', 17.99, 16),
(49, '978-1-001-00049-9', 'Desert Glass',                   'Fiction',     2022, '1st', 'English', 18.99, 17),
(50, '978-1-001-00050-0', 'The Hour of the Muezzin',        'Fiction',     2021, '1st', 'English', 22.99, 18),
(51, '978-1-001-00051-1', 'Between Mecca and Montmartre',   'Fiction',     2018, '1st', 'English', 19.99, 19),
(52, '978-1-001-00052-2', 'The Tangi and the Tide',         'Fiction',     2022, '1st', 'English', 21.99, 20),
(53, '978-1-001-00053-3', 'Where the Kauri Grow',           'Fiction',     2020, '1st', 'English', 17.99, 12),
(54, '978-1-001-00054-4', 'Lava and Latitude',              'Non-Fiction', 2019, '1st', 'English', 23.99, 13),
(55, '978-1-001-00055-5', 'The Blue Lagoon Letters',        'Romance',     2021, '1st', 'English', 16.99, 14),
(56, '978-1-001-00056-6', 'Harmattan Season',               'Fiction',     2023, '1st', 'English', 20.99, 15),
(57, '978-1-001-00057-7', 'The Obi Crossing',               'Fiction',     2019, '1st', 'English', 18.99, 16),
(58, '978-1-001-00058-8', 'Highveld Hymns',                 'Poetry',      2020, '1st', 'English', 14.99, 17),
(59, '978-1-001-00059-9', 'The Zambezi Verdict',            'Mystery',     2022, '1st', 'English', 15.99, 18),
(60, '978-1-001-00060-0', 'Steppe and Shadow',              'Fiction',     2021, '1st', 'English', 22.99, 19),
(61, '978-1-001-00061-1', 'The Lagos Lagoon',               'Fiction',     2018, '1st', 'English', 19.99, 20);

-- ============================================================
-- INSERT: Book_Authors (61 pairs)
-- ============================================================
INSERT IGNORE INTO Book_Authors (BookID, AuthorID) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),
(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),
(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),
(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),
(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),
(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61);

-- ============================================================
-- INSERT: Inventory (61 books across stores 1–11)
-- ============================================================
INSERT IGNORE INTO Inventory (BookID, StoreID, QuantityOnHand, ReorderLevel) VALUES
(1,1,25,5),(2,2,18,5),(3,3,30,5),(4,4,12,5),(5,5,22,5),(6,6,8,5),(7,7,35,5),(8,8,15,5),(9,9,20,5),(10,10,10,5),(11,11,28,5),
(12,2,20,5),(13,3,15,5),(14,4,22,5),(15,5,18,5),(16,6,30,5),(17,7,12,5),(18,8,25,5),(19,9,17,5),(20,10,28,5),(21,11,14,5),
(22,1,20,5),(23,2,16,5),(24,3,24,5),(25,4,19,5),(26,5,22,5),(27,6,11,5),(28,7,27,5),(29,8,13,5),(30,9,21,5),(31,10,18,5),
(32,11,23,5),(33,1,15,5),(34,2,29,5),(35,3,10,5),(36,4,26,5),(37,5,14,5),(38,6,20,5),(39,7,17,5),(40,8,22,5),(41,9,25,5),
(42,10,13,5),(43,11,19,5),(44,1,28,5),(45,2,16,5),(46,3,21,5),(47,4,12,5),(48,5,24,5),(49,6,18,5),(50,7,30,5),(51,8,15,5),
(52,9,22,5),(53,10,17,5),(54,11,20,5),(55,1,14,5),(56,2,26,5),(57,3,19,5),(58,4,11,5),(59,5,23,5),(60,6,16,5),(61,7,28,5);

-- ============================================================
-- INSERT: Orders (61 total)
-- ============================================================
INSERT IGNORE INTO Orders (OrderID, OrderDate, Status, CustomerID, StoreID, EmployeeID) VALUES
(1,'2024-07-01','Completed',1,1,1),(2,'2024-07-03','Completed',2,2,2),(3,'2024-07-05','Completed',3,3,3),
(4,'2024-07-08','Cancelled',4,4,4),(5,'2024-07-10','Completed',5,5,5),(6,'2024-07-12','Completed',6,6,6),
(7,'2024-07-15','Pending',7,7,7),(8,'2024-07-18','Completed',8,8,8),(9,'2024-07-20','Refunded',9,9,9),
(10,'2024-07-22','Completed',10,10,10),(11,'2024-07-25','Pending',11,11,11),
(12,'2024-08-01','Completed',1,1,1),(13,'2024-08-02','Completed',2,2,2),(14,'2024-08-03','Completed',3,3,3),
(15,'2024-08-04','Pending',4,4,4),(16,'2024-08-05','Completed',5,5,5),(17,'2024-08-06','Completed',6,6,6),
(18,'2024-08-07','Cancelled',7,7,7),(19,'2024-08-08','Completed',8,8,8),(20,'2024-08-09','Completed',9,9,9),
(21,'2024-08-10','Refunded',10,10,10),(22,'2024-08-11','Completed',11,11,11),(23,'2024-08-12','Completed',1,1,1),
(24,'2024-08-13','Pending',2,2,2),(25,'2024-08-14','Completed',3,3,3),(26,'2024-08-15','Completed',4,4,4),
(27,'2024-08-16','Completed',5,5,5),(28,'2024-08-17','Cancelled',6,6,6),(29,'2024-08-18','Completed',7,7,7),
(30,'2024-08-19','Completed',8,8,8),(31,'2024-08-20','Refunded',9,9,9),(32,'2024-08-21','Completed',10,10,10),
(33,'2024-08-22','Completed',11,11,11),(34,'2024-08-23','Completed',1,1,1),(35,'2024-08-24','Pending',2,2,2),
(36,'2024-08-25','Completed',3,3,3),(37,'2024-08-26','Completed',4,4,4),(38,'2024-08-27','Completed',5,5,5),
(39,'2024-08-28','Cancelled',6,6,6),(40,'2024-08-29','Completed',7,7,7),(41,'2024-08-30','Completed',8,8,8),
(42,'2024-09-01','Completed',9,9,9),(43,'2024-09-02','Refunded',10,10,10),(44,'2024-09-03','Completed',11,11,11),
(45,'2024-09-04','Completed',1,1,1),(46,'2024-09-05','Pending',2,2,2),(47,'2024-09-06','Completed',3,3,3),
(48,'2024-09-07','Completed',4,4,4),(49,'2024-09-08','Completed',5,5,5),(50,'2024-09-09','Cancelled',6,6,6),
(51,'2024-09-10','Completed',7,7,7),(52,'2024-09-11','Completed',8,8,8),(53,'2024-09-12','Completed',9,9,9),
(54,'2024-09-13','Refunded',10,10,10),(55,'2024-09-14','Completed',11,11,11),(56,'2024-09-15','Completed',1,1,1),
(57,'2024-09-16','Pending',2,2,2),(58,'2024-09-17','Completed',3,3,3),(59,'2024-09-18','Completed',4,4,4),
(60,'2024-09-19','Completed',5,5,5),(61,'2024-09-20','Completed',6,6,6);

-- ============================================================
-- INSERT: Order_Items (61 total)
-- ============================================================
INSERT IGNORE INTO Order_Items (OrderItemID, Quantity, UnitPrice, Discount, OrderID, BookID) VALUES
(1,2,19.99,0.00,1,1),(2,1,14.99,5.00,2,2),(3,3,24.99,10.00,3,3),(4,1,17.99,0.00,4,4),
(5,2,22.99,5.00,5,5),(6,4,16.99,15.00,6,6),(7,1,18.99,0.00,7,7),(8,2,21.99,5.00,8,8),
(9,1,15.99,10.00,9,9),(10,3,23.99,0.00,10,10),(11,2,13.99,5.00,11,11),
(12,1,18.99,0.00,12,12),(13,2,21.99,5.00,13,13),(14,1,16.99,10.00,14,14),(15,3,23.99,0.00,15,15),
(16,2,19.99,5.00,16,16),(17,1,20.99,0.00,17,17),(18,2,24.99,10.00,18,18),(19,1,17.99,0.00,19,19),
(20,3,22.99,5.00,20,20),(21,1,15.99,15.00,21,21),(22,2,18.99,0.00,22,22),(23,1,16.99,5.00,23,23),
(24,2,21.99,0.00,24,24),(25,1,19.99,10.00,25,25),(26,3,17.99,0.00,26,26),(27,1,14.99,5.00,27,27),
(28,2,20.99,0.00,28,28),(29,1,23.99,10.00,29,29),(30,2,18.99,5.00,30,30),(31,1,16.99,0.00,31,31),
(32,3,15.99,0.00,32,32),(33,2,22.99,5.00,33,33),(34,1,13.99,10.00,34,34),(35,2,19.99,0.00,35,35),
(36,1,21.99,5.00,36,36),(37,3,16.99,0.00,37,37),(38,1,24.99,10.00,38,38),(39,2,20.99,5.00,39,39),
(40,1,17.99,0.00,40,40),(41,2,18.99,0.00,41,41),(42,1,15.99,5.00,42,42),(43,3,21.99,0.00,43,43),
(44,2,19.99,10.00,44,44),(45,1,23.99,0.00,45,45),(46,2,16.99,5.00,46,46),(47,1,20.99,0.00,47,47),
(48,3,17.99,15.00,48,48),(49,1,18.99,0.00,49,49),(50,2,22.99,5.00,50,50),(51,1,19.99,0.00,51,51),
(52,2,21.99,10.00,52,52),(53,1,17.99,5.00,53,53),(54,3,23.99,0.00,54,54),(55,1,16.99,0.00,55,55),
(56,2,20.99,5.00,56,56),(57,1,18.99,0.00,57,57),(58,2,14.99,10.00,58,58),(59,1,15.99,0.00,59,59),
(60,3,22.99,5.00,60,60),(61,1,19.99,0.00,61,61);

-- ============================================================
-- INSERT: Payments (61 total)
-- ============================================================
INSERT IGNORE INTO Payments (PaymentID, PaymentDate, PaymentMethod, AmountPaid, PaymentConfirmation, Status, OrderID) VALUES
(1,'2024-07-01','Debit Card',39.98,'CONF-PEN-10001','Paid',1),(2,'2024-07-03','Venmo',14.24,'CONF-PEN-10002','Paid',2),
(3,'2024-07-05','Credit Card',67.47,'CONF-PEN-10003','Paid',3),(4,'2024-07-08','Cash',17.99,'CONF-PEN-10004','Refunded',4),
(5,'2024-07-10','Zelle',43.68,'CONF-PEN-10005','Paid',5),(6,'2024-07-12','PayPal',57.76,'CONF-PEN-10006','Paid',6),
(7,'2024-07-15','Debit Card',18.99,'CONF-PEN-10007','Pending',7),(8,'2024-07-18','Check',41.78,'CONF-PEN-10008','Paid',8),
(9,'2024-07-20','Credit Card',14.39,'CONF-PEN-10009','Refunded',9),(10,'2024-07-22','Venmo',71.97,'CONF-PEN-10010','Paid',10),
(11,'2024-07-25','Cash',26.58,'CONF-PEN-10011','Pending',11),
(12,'2024-08-01','Credit Card',18.99,'CONF-PEN-10012','Paid',12),(13,'2024-08-02','Debit Card',41.78,'CONF-PEN-10013','Paid',13),
(14,'2024-08-03','Venmo',15.29,'CONF-PEN-10014','Paid',14),(15,'2024-08-04','Cash',71.97,'CONF-PEN-10015','Pending',15),
(16,'2024-08-05','Zelle',37.98,'CONF-PEN-10016','Paid',16),(17,'2024-08-06','PayPal',20.99,'CONF-PEN-10017','Paid',17),
(18,'2024-08-07','Check',44.98,'CONF-PEN-10018','Refunded',18),(19,'2024-08-08','Credit Card',17.99,'CONF-PEN-10019','Paid',19),
(20,'2024-08-09','Debit Card',65.32,'CONF-PEN-10020','Paid',20),(21,'2024-08-10','Venmo',13.59,'CONF-PEN-10021','Refunded',21),
(22,'2024-08-11','Cash',37.98,'CONF-PEN-10022','Paid',22),(23,'2024-08-12','Zelle',16.14,'CONF-PEN-10023','Paid',23),
(24,'2024-08-13','PayPal',43.98,'CONF-PEN-10024','Pending',24),(25,'2024-08-14','Check',17.99,'CONF-PEN-10025','Paid',25),
(26,'2024-08-15','Credit Card',53.97,'CONF-PEN-10026','Paid',26),(27,'2024-08-16','Debit Card',14.24,'CONF-PEN-10027','Paid',27),
(28,'2024-08-17','Venmo',41.98,'CONF-PEN-10028','Refunded',28),(29,'2024-08-18','Cash',21.59,'CONF-PEN-10029','Paid',29),
(30,'2024-08-19','Zelle',35.08,'CONF-PEN-10030','Paid',30),(31,'2024-08-20','PayPal',16.99,'CONF-PEN-10031','Refunded',31),
(32,'2024-08-21','Check',47.97,'CONF-PEN-10032','Paid',32),(33,'2024-08-22','Credit Card',43.68,'CONF-PEN-10033','Paid',33),
(34,'2024-08-23','Debit Card',12.59,'CONF-PEN-10034','Paid',34),(35,'2024-08-24','Venmo',39.98,'CONF-PEN-10035','Pending',35),
(36,'2024-08-25','Cash',20.89,'CONF-PEN-10036','Paid',36),(37,'2024-08-26','Zelle',50.97,'CONF-PEN-10037','Paid',37),
(38,'2024-08-27','PayPal',44.98,'CONF-PEN-10038','Paid',38),(39,'2024-08-28','Check',39.78,'CONF-PEN-10039','Refunded',39),
(40,'2024-08-29','Credit Card',17.99,'CONF-PEN-10040','Paid',40),(41,'2024-08-30','Debit Card',37.98,'CONF-PEN-10041','Paid',41),
(42,'2024-09-01','Venmo',15.19,'CONF-PEN-10042','Paid',42),(43,'2024-09-02','Cash',65.97,'CONF-PEN-10043','Refunded',43),
(44,'2024-09-03','Zelle',35.98,'CONF-PEN-10044','Paid',44),(45,'2024-09-04','PayPal',23.99,'CONF-PEN-10045','Paid',45),
(46,'2024-09-05','Check',32.24,'CONF-PEN-10046','Pending',46),(47,'2024-09-06','Credit Card',20.99,'CONF-PEN-10047','Paid',47),
(48,'2024-09-07','Debit Card',45.82,'CONF-PEN-10048','Paid',48),(49,'2024-09-08','Venmo',18.99,'CONF-PEN-10049','Paid',49),
(50,'2024-09-09','Cash',43.68,'CONF-PEN-10050','Refunded',50),(51,'2024-09-10','Zelle',19.99,'CONF-PEN-10051','Paid',51),
(52,'2024-09-11','PayPal',39.58,'CONF-PEN-10052','Paid',52),(53,'2024-09-12','Check',17.04,'CONF-PEN-10053','Paid',53),
(54,'2024-09-13','Credit Card',71.97,'CONF-PEN-10054','Refunded',54),(55,'2024-09-14','Debit Card',16.99,'CONF-PEN-10055','Paid',55),
(56,'2024-09-15','Venmo',39.72,'CONF-PEN-10056','Paid',56),(57,'2024-09-16','Cash',18.99,'CONF-PEN-10057','Pending',57),
(58,'2024-09-17','Zelle',26.98,'CONF-PEN-10058','Paid',58),(59,'2024-09-18','PayPal',15.99,'CONF-PEN-10059','Paid',59),
(60,'2024-09-19','Check',65.32,'CONF-PEN-10060','Paid',60),(61,'2024-09-20','Credit Card',19.99,'CONF-PEN-10061','Paid',61);

-- ============================================================
-- INSERT: Reservations (61 total)
-- ============================================================
INSERT IGNORE INTO Reservations (ReservationID, ReservationDate, ExpiryDate, Status, CustomerID, BookID, StoreID) VALUES
(1,'2024-07-01','2024-07-15','Fulfilled',1,1,1),(2,'2024-07-03','2024-07-17','Cancelled',2,2,2),
(3,'2024-07-05','2024-07-19','Ready',3,3,3),(4,'2024-07-08','2024-07-22','Pending',4,4,4),
(5,'2024-07-10','2024-07-24','Fulfilled',5,5,5),(6,'2024-07-12','2024-07-26','Expired',6,6,6),
(7,'2024-07-15','2024-07-29','Pending',7,7,7),(8,'2024-07-18','2024-08-01','Ready',8,8,8),
(9,'2024-07-20','2024-08-03','Cancelled',9,9,9),(10,'2024-07-22','2024-08-05','Fulfilled',10,10,10),
(11,'2024-07-25','2024-08-08','Expired',11,11,11),
(12,'2024-08-01','2024-08-15','Fulfilled',1,12,1),(13,'2024-08-02','2024-08-16','Cancelled',2,13,2),
(14,'2024-08-03','2024-08-17','Ready',3,14,3),(15,'2024-08-04','2024-08-18','Pending',4,15,4),
(16,'2024-08-05','2024-08-19','Fulfilled',5,16,5),(17,'2024-08-06','2024-08-20','Expired',6,17,6),
(18,'2024-08-07','2024-08-21','Pending',7,18,7),(19,'2024-08-08','2024-08-22','Ready',8,19,8),
(20,'2024-08-09','2024-08-23','Cancelled',9,20,9),(21,'2024-08-10','2024-08-24','Fulfilled',10,21,10),
(22,'2024-08-11','2024-08-25','Expired',11,22,11),(23,'2024-08-12','2024-08-26','Fulfilled',1,23,1),
(24,'2024-08-13','2024-08-27','Pending',2,24,2),(25,'2024-08-14','2024-08-28','Ready',3,25,3),
(26,'2024-08-15','2024-08-29','Fulfilled',4,26,4),(27,'2024-08-16','2024-08-30','Cancelled',5,27,5),
(28,'2024-08-17','2024-08-31','Expired',6,28,6),(29,'2024-08-18','2024-09-01','Fulfilled',7,29,7),
(30,'2024-08-19','2024-09-02','Ready',8,30,8),(31,'2024-08-20','2024-09-03','Pending',9,31,9),
(32,'2024-08-21','2024-09-04','Fulfilled',10,32,10),(33,'2024-08-22','2024-09-05','Cancelled',11,33,11),
(34,'2024-08-23','2024-09-06','Ready',1,34,1),(35,'2024-08-24','2024-09-07','Pending',2,35,2),
(36,'2024-08-25','2024-09-08','Fulfilled',3,36,3),(37,'2024-08-26','2024-09-09','Expired',4,37,4),
(38,'2024-08-27','2024-09-10','Fulfilled',5,38,5),(39,'2024-08-28','2024-09-11','Cancelled',6,39,6),
(40,'2024-08-29','2024-09-12','Ready',7,40,7),(41,'2024-08-30','2024-09-13','Fulfilled',8,41,8),
(42,'2024-09-01','2024-09-15','Pending',9,42,9),(43,'2024-09-02','2024-09-16','Expired',10,43,10),
(44,'2024-09-03','2024-09-17','Fulfilled',11,44,11),(45,'2024-09-04','2024-09-18','Ready',1,45,1),
(46,'2024-09-05','2024-09-19','Pending',2,46,2),(47,'2024-09-06','2024-09-20','Fulfilled',3,47,3),
(48,'2024-09-07','2024-09-21','Cancelled',4,48,4),(49,'2024-09-08','2024-09-22','Expired',5,49,5),
(50,'2024-09-09','2024-09-23','Fulfilled',6,50,6),(51,'2024-09-10','2024-09-24','Ready',7,51,7),
(52,'2024-09-11','2024-09-25','Fulfilled',8,52,8),(53,'2024-09-12','2024-09-26','Pending',9,53,9),
(54,'2024-09-13','2024-09-27','Expired',10,54,10),(55,'2024-09-14','2024-09-28','Fulfilled',11,55,11),
(56,'2024-09-15','2024-09-29','Cancelled',1,56,1),(57,'2024-09-16','2024-09-30','Pending',2,57,2),
(58,'2024-09-17','2024-10-01','Ready',3,58,3),(59,'2024-09-18','2024-10-02','Fulfilled',4,59,4),
(60,'2024-09-19','2024-10-03','Expired',5,60,5),(61,'2024-09-20','2024-10-04','Fulfilled',6,61,6);

-- ============================================================
-- INSERT: Returns (61 total — notes include book titles)
-- ============================================================
INSERT IGNORE INTO Returns (ReturnID, ReturnDate, Reason, Notes, Status, OrderItemID, EmployeeID) VALUES
(1,'2024-07-03','Damaged','Customer reported that "Echoes of the Savanna" arrived with a torn cover and several water-damaged pages. Replacement was issued and the damaged copy of "Echoes of the Savanna" was pulled from inventory.','Completed',1,1),
(2,'2024-07-05','Wrong Item','Customer received a copy of "Cliffs of Connemara" instead of the ordered title "The Cartographer\'s Secret". The correct copy of "The Cartographer\'s Secret" was located in store and exchanged immediately.','Completed',2,2),
(3,'2024-07-07','Changed Mind','Customer decided they were no longer interested in "Roots of Gold" after reading the first chapter. The return of "Roots of Gold" was accepted within the 7-day return window and a store credit was issued.','Approved',3,3),
(4,'2024-07-10','Duplicate Order','Customer accidentally placed two separate orders for "Beneath the Agave Moon" on the same day. The second order of "Beneath the Agave Moon" was identified as a duplicate and fully refunded upon return of the unopened copy.','Completed',4,4),
(5,'2024-07-12','Damaged','The spine of "The Lavender District" was cracked and pages were loose upon opening the package. Customer provided photos as evidence. Full refund was processed and "The Lavender District" was removed from active inventory.','Completed',5,5),
(6,'2024-07-14','Other','Customer stated "Storm of Cherry Blossoms" did not match the online description and felt misrepresented. Manager reviewed the complaint regarding "Storm of Cherry Blossoms" and approved a partial store credit as resolution.','Approved',6,6),
(7,'2024-07-17','Wrong Item','Customer ordered "The Saffron Path" but received "A Garden in Devonshire" instead. An inventory discrepancy between "The Saffron Path" and "A Garden in Devonshire" was logged and reported to the Inventory Specialist. The correct title was shipped same day.','Completed',7,7),
(8,'2024-07-19','Changed Mind','Customer purchased "Cliffs of Connemara" as a gift but the recipient already owned a copy. The return of "Cliffs of Connemara" was processed within the allowed return period and the original payment method was refunded in full.','Completed',8,8),
(9,'2024-07-21','Damaged','Customer found "Shadows Over Seville" had missing pages between chapters 4 and 7. The defective copy of "Shadows Over Seville" was quarantined and sent back to the publisher for review. Customer was offered a replacement or refund.','Pending',9,9),
(10,'2024-07-23','Duplicate Order','Customer\'s online session timed out mid-checkout, causing a duplicate charge for "The Lagos Chronicles". Both transactions for "The Lagos Chronicles" were verified and the duplicate payment was reversed promptly.','Completed',10,10),
(11,'2024-07-26','Other','Customer reported that "A Garden in Devonshire" contained a printing error where pages 45 through 60 were repeated twice and pages 61 through 75 were missing entirely. The publisher was notified about the defective run of "A Garden in Devonshire".','Pending',11,11),
(12,'2024-08-03','Damaged','Customer reported that "The Cork and the Tide" arrived with water damage to the cover and first thirty pages. A replacement copy of "The Cork and the Tide" was issued from in-store stock.','Completed',12,1),
(13,'2024-08-04','Wrong Item','Customer received "Drift Without Anchor" instead of the title they ordered. The correct book was retrieved from back stock and exchanged for "Drift Without Anchor" with an apology.','Completed',13,2),
(14,'2024-08-05','Changed Mind','Customer decided "The Vermillion Accord" was not what they expected based on the cover description. The return of "The Vermillion Accord" was accepted within the 7-day window and store credit was issued.','Approved',14,3),
(15,'2024-08-06','Duplicate Order','Customer placed two identical orders for "Pale Roads to Fenwick" during a website session error. The second copy of "Pale Roads to Fenwick" was returned unopened and a full refund was processed.','Completed',15,4),
(16,'2024-08-07','Damaged','"Between Dust and Longitude" had a cracked spine and loose pages upon delivery. Customer submitted photographic evidence of the damage to "Between Dust and Longitude" and a full replacement was shipped within two business days.','Completed',16,5),
(17,'2024-08-08','Other','Customer felt "The Lantern Fisherman" did not align with the summary provided on the website. Manager reviewed the listing for "The Lantern Fisherman" and approved a partial store credit as resolution.','Approved',17,6),
(18,'2024-08-09','Wrong Item','"Salt and Inheritance" was sent to the wrong customer due to a mislabeled shipping slip. The copy of "Salt and Inheritance" was returned by the incorrect recipient and re-routed to the correct customer.','Completed',18,7),
(19,'2024-08-10','Changed Mind','Customer purchased "The Amber Cartography" as a birthday gift but the recipient preferred a different genre. The return of "The Amber Cartography" was processed and the original payment method was refunded in full.','Completed',19,8),
(20,'2024-08-11','Damaged','"What the Monsoon Leaves Behind" was found to have pages 88 through 102 printed completely blank. The defective copy of "What the Monsoon Leaves Behind" was quarantined and the publisher was notified for quality review.','Pending',20,9),
(21,'2024-08-12','Duplicate Order','Customer was double-charged for "Seventeen Silences" due to a payment gateway timeout. Both transactions for "Seventeen Silences" were verified and the duplicate charge was reversed within 24 hours.','Completed',21,10),
(22,'2024-08-13','Other','Customer reported that "The Cartographer of Lost Seasons" contained a misbound section where chapters 6 and 7 appeared in reverse order. Publisher was contacted about "The Cartographer of Lost Seasons" and a corrected copy was issued.','Pending',22,11),
(23,'2024-08-14','Damaged','"Borrowed Sun" arrived with a torn back cover and a broken spine. Customer was offered either a replacement or a full refund for "Borrowed Sun" and chose the replacement option.','Completed',23,1),
(24,'2024-08-15','Wrong Item','Customer ordered "The Red Bridge Letters" but received "Unmapped" instead. The store inventory log was updated to reflect the misplacement between "The Red Bridge Letters" and "Unmapped" and the correct title was dispatched same day.','Completed',24,2),
(25,'2024-08-16','Changed Mind','Customer read the first few chapters of "Unmapped" and decided it was not the right fit for their personal development goals. A full store credit was issued for the return of "Unmapped" per policy.','Approved',25,3),
(26,'2024-08-17','Duplicate Order','A technical error on the online checkout page resulted in two separate charges for "The Weight of Open Water". The duplicate order of "The Weight of Open Water" was cancelled and the payment reversed promptly.','Completed',26,4),
(27,'2024-08-18','Damaged','"Mirrors in the Fog" had extensive yellowing and mold spotting consistent with improper storage. The copy of "Mirrors in the Fog" was removed from inventory and a quality report was filed with the warehouse.','Completed',27,5),
(28,'2024-08-19','Other','Customer stated "The Final Garden" did not reflect the romantic tone advertised. After manager review of the return for "The Final Garden", a partial refund was approved and the customer retained the book.','Approved',28,6),
(29,'2024-08-20','Wrong Item','"Echoes from the Pearl River" was incorrectly labeled as a different title in the store system. The shelving error affecting "Echoes from the Pearl River" was corrected and the customer was given a full exchange.','Completed',29,7),
(30,'2024-08-21','Changed Mind','Customer purchased "A Thousand Small Departures" as a gift but was informed the recipient already had a copy. The return of "A Thousand Small Departures" was accepted within the allowed window and the original payment was refunded.','Completed',30,8),
(31,'2024-08-22','Damaged','"Where the Tulips Fell" was received with a severely bent cover and water stains on the first twenty pages. A replacement copy of "Where the Tulips Fell" was issued from in-store stock the same day.','Completed',31,9),
(32,'2024-08-23','Duplicate Order','Customer accidentally submitted "The Havana Frequency" twice during an unstable internet session. One order of "The Havana Frequency" was cancelled immediately and the charge was reversed.','Completed',32,10),
(33,'2024-08-24','Other','Customer reported "Children of the Caatinga" contained a printing error causing entire paragraphs to repeat across three consecutive pages. The publisher was contacted about "Children of the Caatinga" and a corrected copy was ordered.','Pending',33,11),
(34,'2024-08-25','Damaged','"Glacier Song" poetry collection arrived with the cover detached from the binding. Customer was offered a replacement for "Glacier Song" and the damaged copy was returned to the distributor.','Completed',34,1),
(35,'2024-08-26','Wrong Item','Customer ordered "The Ceiba and the Storm" but received "Unfinished Atlas" instead. The mix-up between "The Ceiba and the Storm" and "Unfinished Atlas" was traced to a warehouse scanning error which was logged and corrected.','Completed',35,2),
(36,'2024-08-27','Changed Mind','Customer felt "Unfinished Atlas" was too academic in tone for their reading preferences. The return of "Unfinished Atlas" was accepted and a full refund was applied to the original payment method.','Approved',36,3),
(37,'2024-08-28','Duplicate Order','"The Bogotá Inheritance" was ordered twice within minutes due to a browser back-button issue. The second order of "The Bogotá Inheritance" was flagged and cancelled before shipping with no charge applied.','Completed',37,4),
(38,'2024-08-29','Damaged','"Roots in the Pampas" arrived with pages 201 through 215 stuck together due to a binding adhesive error. Customer requested a replacement for "Roots in the Pampas" and the defective copy was sent back to the publisher.','Completed',38,5),
(39,'2024-08-30','Other','Customer disputed that "The Port-au-Prince Journals" was misrepresented as historical non-fiction when it contained narrative embellishments. A store manager reviewed the case for "The Port-au-Prince Journals" and issued partial credit.','Approved',39,6),
(40,'2024-08-31','Wrong Item','Customer received "Dust Over Oaxaca" instead of the long-form fiction title they requested. The shipping manifest error involving "Dust Over Oaxaca" was documented and corrected. The correct title was hand-delivered to the customer.','Completed',40,7),
(41,'2024-09-01','Changed Mind','Customer bought "The Long Road from Santiago" for a book club but the group selected a different title. The return of "The Long Road from Santiago" was processed within the 7-day window and the customer received a full store credit.','Completed',41,8),
(42,'2024-09-02','Damaged','"The Algiers Manuscript" had a significant printing defect on the cover image and multiple chapters with blurred text. The defective copy of "The Algiers Manuscript" was set aside for quality review and a replacement was issued.','Completed',42,9),
(43,'2024-09-03','Duplicate Order','"Sand and Silence" was purchased twice due to an auto-fill error on the customer account. One copy of "Sand and Silence" was returned unopened and the corresponding payment was refunded in full.','Completed',43,10),
(44,'2024-09-04','Other','Customer indicated "The Cedar House" did not match the synopsis they read on a third-party review site. After discussion with the manager, a one-time store credit exception was granted for "The Cedar House".','Approved',44,11),
(45,'2024-09-05','Wrong Item','"Threads of the Old City" was mistakenly shelved under a different ISBN causing the wrong title to ship. Inventory was audited following the "Threads of the Old City" error and all mismatched entries were corrected.','Completed',45,1),
(46,'2024-09-06','Changed Mind','Customer purchased "The Nile in Winter" on impulse but decided it was not aligned with their current reading list. The return of "The Nile in Winter" was accepted and a refund was issued back to the original payment method.','Approved',46,2),
(47,'2024-09-07','Damaged','"Beyond the Qanat" arrived with a broken spine and several torn pages near the middle of the book. Customer was issued a replacement copy of "Beyond the Qanat" from available inventory.','Completed',47,3),
(48,'2024-09-08','Duplicate Order','"The Amman Letters" was ordered in duplicate due to a checkout session glitch. The second charge for "The Amman Letters" was identified during processing and reversed before the second copy was shipped.','Completed',48,4),
(49,'2024-09-09','Other','Customer felt "Desert Glass" had a misleading subtitle suggesting it was a travel memoir when it is literary fiction. A partial store credit was offered for "Desert Glass" after manager review.','Approved',49,5),
(50,'2024-09-10','Wrong Item','Customer ordered "The Hour of the Muezzin" but received "Between Mecca and Montmartre" due to adjacent shelf placement. Both "The Hour of the Muezzin" and "Between Mecca and Montmartre" were re-tagged and the correct book was provided.','Completed',50,6),
(51,'2024-09-11','Changed Mind','Customer purchased "Between Mecca and Montmartre" as a travel companion read but changed their trip plans. The return of "Between Mecca and Montmartre" was processed within the allowed timeframe and a store credit was applied.','Completed',51,7),
(52,'2024-09-12','Damaged','"The Tangi and the Tide" arrived with significant moisture damage to the back quarter of the book. Customer was offered a full refund or replacement for "The Tangi and the Tide" and chose a full replacement copy.','Completed',52,8),
(53,'2024-09-13','Duplicate Order','"Where the Kauri Grow" was accidentally ordered twice from the mobile app. The second order of "Where the Kauri Grow" was identified during packing and cancelled with a full payment reversal.','Completed',53,9),
(54,'2024-09-14','Other','"Lava and Latitude" contained several factual inconsistencies flagged by the customer who works in the relevant field. The case regarding "Lava and Latitude" was escalated to management and a refund was processed.','Approved',54,10),
(55,'2024-09-15','Wrong Item','Customer received "Highveld Hymns" instead of "The Blue Lagoon Letters". A mis-scan at the packing station was identified as the cause of the mix-up between "Highveld Hymns" and "The Blue Lagoon Letters". The correct title was shipped priority.','Completed',55,11),
(56,'2024-09-16','Changed Mind','Customer purchased "Harmattan Season" as a gift but the recipient preferred non-fiction. The return of "Harmattan Season" was accepted and a full refund was applied to the original credit card.','Completed',56,1),
(57,'2024-09-17','Damaged','"The Obi Crossing" had pages 30 through 45 printed in a completely illegible font due to a press error. Customer was given a replacement for "The Obi Crossing" and the defective batch was flagged for return to the printer.','Pending',57,2),
(58,'2024-09-18','Duplicate Order','"Highveld Hymns" was ordered twice within the same session. The duplicate was caught during order review and only one copy of "Highveld Hymns" was charged and shipped.','Completed',58,3),
(59,'2024-09-19','Other','Customer reported that "The Zambezi Verdict" contained an unresolved plot thread that the ending description on the back cover explicitly promised would be resolved. A partial credit was issued for "The Zambezi Verdict".','Approved',59,4),
(60,'2024-09-20','Wrong Item','"Steppe and Shadow" was delivered to the wrong address due to a zip code entry error. The misdelivered copy of "Steppe and Shadow" was retrieved and re-sent to the correct customer with expedited shipping at no extra cost.','Completed',60,5),
(61,'2024-09-21','Changed Mind','Customer bought "The Lagos Lagoon" for a reading group that ultimately selected a different title. The return of "The Lagos Lagoon" was processed within policy and a full store credit was applied to the customer account.','Completed',61,6);

-- ============================================================
-- INSERT: Genres (7 genres)
-- ============================================================
INSERT INTO Genres (GenreID, GenreName, Description) VALUES
(1,'Classical Literature','Enduring works of literary fiction and prose widely regarded as foundational to the Western and world literary canon, typically published before the 20th century.'),
(2,'Science Fiction','Speculative fiction exploring futuristic science, technology, space travel, time, parallel universes, and extraterrestrial life.'),
(3,'Mystery & Thriller','Fiction centered on suspense, crime, and the solving of puzzles or dangerous situations, often featuring detectives, spies, or ordinary people in peril.'),
(4,'Romance','Fiction focused on romantic relationships and emotional journeys, typically ending with an optimistic or happy conclusion.'),
(5,'Fantasy','Fiction set in imaginary worlds with magical systems, mythical creatures, and epic quests beyond the bounds of reality.'),
(6,'Horror','Fiction designed to frighten, unsettle, or disturb through supernatural elements, psychological terror, or graphic violence.'),
(7,'Self-Help / Non-Fiction','Non-fiction works aimed at personal development, productivity, psychology, and practical life improvement.');

-- ============================================================
-- INSERT: Genre_Books (105 total — 15 per genre, 8 real / 7 fictional)
-- ============================================================
INSERT INTO Genre_Books (GenreID, Title, Author, PublishedYear, IsReal) VALUES
-- Classical Literature
(1,'Pride and Prejudice','Jane Austen',1813,1),(1,'Crime and Punishment','Fyodor Dostoevsky',1866,1),
(1,'Don Quixote','Miguel de Cervantes',1605,1),(1,'Madame Bovary','Gustave Flaubert',1857,1),
(1,'Anna Karenina','Leo Tolstoy',1878,1),(1,'Great Expectations','Charles Dickens',1861,1),
(1,'The Scarlet Letter','Nathaniel Hawthorne',1850,1),(1,'Jane Eyre','Charlotte Brontë',1847,1),
(1,'The Hollow Cathedral','Edmund Ashworth',1872,0),(1,'Letters to No One in Particular','Marguerite Fontenay',1849,0),
(1,'A Season of Dust and Silence','Tobias Grenville',1903,0),(1,'The Governess of Aldermoor House','Helena Voss',1861,0),
(1,'Beneath the Ivory Clock','Sebastien Moreau',1888,0),(1,'The Wandering Sons of Castile','Rafael Dominguez',1834,0),
(1,'When Rivers Forget Their Names','Cecilia Hartwell',1891,0),
-- Science Fiction
(2,'Dune','Frank Herbert',1965,1),(2,'Neuromancer','William Gibson',1984,1),
(2,'The Left Hand of Darkness','Ursula K. Le Guin',1969,1),(2,'Ender''s Game','Orson Scott Card',1985,1),
(2,'The Martian Chronicles','Ray Bradbury',1950,1),(2,'Foundation','Isaac Asimov',1951,1),
(2,'Childhood''s End','Arthur C. Clarke',1953,1),(2,'The Hitchhiker''s Guide to the Galaxy','Douglas Adams',1979,1),
(2,'Signal Ghost','Petra Osei-Kuffour',2031,0),(2,'The Helium Gardens of Titan','Ravi Subramaniam',2019,0),
(2,'Last Orbit','Cade Morrow',2022,0),(2,'Echoes from the Outer Drift','Yuna Holloway',2028,0),
(2,'When the Sun Blinks Twice','Desmond Farquhar',2015,0),(2,'The Synthetic Shepherd','Lena Volkov',2020,0),
(2,'Beyond the Kessler Belt','Omar Adekunle',2033,0),
-- Mystery & Thriller
(3,'The Hound of the Baskervilles','Arthur Conan Doyle',1902,1),(3,'And Then There Were None','Agatha Christie',1939,1),
(3,'The Girl with the Dragon Tattoo','Stieg Larsson',2005,1),(3,'Gone Girl','Gillian Flynn',2012,1),
(3,'In the Woods','Tana French',2007,1),(3,'The Big Sleep','Raymond Chandler',1939,1),
(3,'Rebecca','Daphne du Maurier',1938,1),(3,'Sharp Objects','Gillian Flynn',2006,1),
(3,'The Meridian Confession','Harper Langley',2018,0),(3,'Cold Harbor','Nadia Sinclair',2021,0),
(3,'The Last Witness on Rue Devlin','Thierry Beaumont',2014,0),(3,'Ink and Bone','Cassidy Marlowe',2019,0),
(3,'The Harrow Files','Winston Okeke',2023,0),(3,'Stillwater','Fiona Callahan',2016,0),
(3,'No Exit from Elmsdale','Reid Ashford',2020,0),
-- Romance
(4,'Outlander','Diana Gabaldon',1991,1),(4,'The Notebook','Nicholas Sparks',1996,1),
(4,'Me Before You','Jojo Moyes',2012,1),(4,'The Hating Game','Sally Thorne',2016,1),
(4,'It Ends with Us','Colleen Hoover',2016,1),(4,'Bridgerton: The Duke and I','Julia Quinn',2000,1),
(4,'The Kiss Quotient','Helen Hoang',2018,1),(4,'Beach Read','Emily Henry',2020,1),
(4,'Every Summer Until Now','Isabelle Marchetti',2021,0),(4,'The Space Between Our Silences','Priya Anand',2022,0),
(4,'When We Were Strangers in Paris','Chloe Fontenot',2019,0),(4,'A Letter Left in October','Jada Whitmore',2023,0),
(4,'The Tide Remembers You','Ethan Calloway',2020,0),(4,'Borrowed Tuesdays','Miriam Osei',2018,0),
(4,'Wildflower Wreckage','Sadie Brennan',2024,0),
-- Fantasy
(5,'The Fellowship of the Ring','J.R.R. Tolkien',1954,1),(5,'A Game of Thrones','George R.R. Martin',1996,1),
(5,'The Name of the Wind','Patrick Rothfuss',2007,1),(5,'The Way of Kings','Brandon Sanderson',2010,1),
(5,'American Gods','Neil Gaiman',2001,1),(5,'The Lies of Locke Lamora','Scott Lynch',2006,1),
(5,'Mistborn: The Final Empire','Brandon Sanderson',2006,1),(5,'Jonathan Strange & Mr Norrell','Susanna Clarke',2004,1),
(5,'The Crown of Ash and Ember','Solène Vaubrun',2022,0),(5,'Tides of the Unmade World','Callum Braith',2020,0),
(5,'Where the Warden Walks','Nyima Oduya',2023,0),(5,'The Gilded Labyrinth','Aurelia Cross',2019,0),
(5,'Bloodroot and Iron','Soren Halverson',2021,0),(5,'The Pale Cartographer','Wren Ashby',2018,0),
(5,'Seven Spells for the Forgotten King','Isadora Venn',2024,0),
-- Horror
(6,'The Shining','Stephen King',1977,1),(6,'Dracula','Bram Stoker',1897,1),
(6,'Frankenstein','Mary Shelley',1818,1),(6,'House of Leaves','Mark Z. Danielewski',2000,1),
(6,'It','Stephen King',1986,1),(6,'Mexican Gothic','Silvia Moreno-Garcia',2020,1),
(6,'The Haunting of Hill House','Shirley Jackson',1959,1),(6,'Bird Box','Josh Malerman',2014,1),
(6,'The Pale Below','Alistair Gorm',2021,0),(6,'Nest of the Hollow Men','Dara Vane',2019,0),
(6,'What Lives in the Salting House','Colm Devereux',2022,0),(6,'The Tenant in Room Nine','Mara Aldridge',2017,0),
(6,'Teeth of the Old Forest','Sasha Weir',2020,0),(6,'The Undertow Hour','Felix Crane',2023,0),
(6,'Nothing Comes Back from Millbrook Lane','Niamh Cassidy',2018,0),
-- Self-Help / Non-Fiction
(7,'Atomic Habits','James Clear',2018,1),(7,'Thinking, Fast and Slow','Daniel Kahneman',2011,1),
(7,'The Power of Now','Eckhart Tolle',1997,1),(7,'Educated','Tara Westover',2018,1),
(7,'Becoming','Michelle Obama',2018,1),(7,'Deep Work','Cal Newport',2016,1),
(7,'Man''s Search for Meaning','Viktor E. Frankl',1946,1),(7,'The Body Keeps the Score','Bessel van der Kolk',2014,1),
(7,'The Quiet Overhaul','Renata Solano',2022,0),(7,'Unlearn the Noise','Jerome Whitfield',2020,0),
(7,'Margins: Making Space for What Matters','Adaeze Nwosu',2021,0),(7,'The Deliberate Life','Suki Tanaka',2023,0),
(7,'Small Pivots, Big Shifts','Marcus Oyelaran',2019,0),(7,'The Art of Not Knowing','Elaine Broderick',2022,0),
(7,'Anchored: Finding Focus in Chaos','Damien Cross',2024,0);

-- ============================================================
-- INSERT: Accessory_Categories (10 categories)
-- ============================================================
INSERT INTO Accessory_Categories (CategoryID, CategoryName, Description) VALUES
(1,'Flat Bookmarks','Traditional flat bookmarks in paper, cardstock, metal, or fabric, designed to mark a reader\'s place in any book.'),
(2,'Clip & Clasp Bookmarks','Spring-loaded, magnetic, or corner-clip bookmarks that attach to a page without slipping.'),
(3,'Purse Strap Bookmarks','Bookmarks with a long decorative strap or tassel that hangs outside the book spine for easy retrieval.'),
(4,'Book Darts & Tabs','Slim metal or adhesive page markers designed for precise annotation without writing in the book.'),
(5,'Book Stands & Holders','Freestanding or adjustable holders that prop a book open hands-free for reading or display.'),
(6,'Reading Accessories','Practical tools that enhance the reading experience including lights, magnifiers, and page holders.'),
(7,'Book Bags & Totes','Carrying bags and totes designed specifically for transporting books safely and stylishly.'),
(8,'Book Sleeves & Covers','Protective fabric or leather sleeves and snap-on covers that shield books from damage.'),
(9,'Stationery & Journals','Reading journals, annotation notebooks, and themed stationery sets for avid readers.'),
(10,'Gift Sets','Curated gift bundles combining multiple accessories, often themed around a genre or reading aesthetic.');

-- ============================================================
-- INSERT: Accessories (50 products)
-- ============================================================
INSERT INTO Accessories (AccessoryID, SKU, AccessoryName, Description, CategoryID, RetailPrice, Material, Color, IsGiftable) VALUES
(1,'PEN-BM-F001','Wildflower Pressed Bookmark','A laminated flat bookmark featuring real dried wildflowers sealed between clear acrylic sheets. Each one is unique.',1,8.99,'Acrylic, Dried Flowers','Assorted',1),
(2,'PEN-BM-F002','Vintage Map Bookmark Set (3-pack)','Set of three flat cardstock bookmarks printed with antique cartographic map designs. Ribbon pull tab included.',1,6.99,'Cardstock','Sepia & Gold',1),
(3,'PEN-BM-F003','Brass Engraved Bookmark','Slim solid brass flat bookmark with an engraved floral border. Tarnish-resistant finish. Includes a gift pouch.',1,14.99,'Brass','Gold',1),
(4,'PEN-BM-F004','Watercolor Galaxy Bookmark','Flat laminated bookmark with original watercolor galaxy artwork. Matte finish with a satin ribbon tail.',1,5.99,'Laminated Paper','Multicolor',1),
(5,'PEN-BM-F005','Leather Hand-Stamped Bookmark','Genuine leather flat bookmark hand-stamped with botanical patterns. Develops a rich patina over time.',1,12.99,'Genuine Leather','Tan',1),
(6,'PEN-BM-C001','Magnetic Corner Bookmark Set (4-pack)','Set of four corner-clip bookmarks with a strong magnetic closure. No-slip grip keeps pages perfectly marked.',2,9.99,'Magnetic Metal','Rose Gold',1),
(7,'PEN-BM-C002','Owl Page Clip Bookmark','A die-cut metal page clip in the shape of an owl that grips the top corner of a page. Nickel-plated finish.',2,7.99,'Nickel-plated Metal','Silver',1),
(8,'PEN-BM-C003','Butterfly Spring Clip Bookmark','Delicate enamel butterfly spring-clip that attaches to any page thickness. Comes in a gift box.',2,10.99,'Enamel, Steel','Teal & Gold',1),
(9,'PEN-BM-C004','Infinity Loop Clip Bookmark','Minimalist stainless steel infinite-loop clip that slides onto a page without bending or creasing.',2,8.49,'Stainless Steel','Matte Black',0),
(10,'PEN-BM-C005','Paw Print Magnetic Bookmark','Adorable magnetic bookmark shaped like a paw print that snaps to the page edge. Great for pet lovers.',2,6.49,'Magnetic Resin','Brown',1),
(11,'PEN-BM-P001','Tassel Leather Purse Strap Bookmark','Wide genuine leather strip bookmark with a braided leather tassel. The long strap hangs freely outside the book for effortless retrieval.',3,16.99,'Genuine Leather','Cognac',1),
(12,'PEN-BM-P002','Beaded Silk Strap Bookmark','Flat silk ribbon bookmark with hand-strung glass beads on the tail end. Elegant enough for a gift.',3,13.99,'Silk, Glass Beads','Emerald Green',1),
(13,'PEN-BM-P003','Macramé Strap Bookmark','Hand-knotted cotton macramé bookmark with a long decorative fringe tail. Boho aesthetic, fits any paperback or hardcover.',3,11.99,'Cotton Cord','Cream & Rust',1),
(14,'PEN-BM-P004','Velvet Ribbon Purse Bookmark','Soft velvet ribbon bookmark with a decorative wax-seal charm at the tail. Available in deep jewel tones.',3,10.49,'Velvet, Metal Charm','Midnight Blue',1),
(15,'PEN-BM-P005','Chain & Crystal Strap Bookmark','A delicate metal chain bookmark with a faceted crystal pendant that drapes elegantly over the book edge.',3,19.99,'Rhodium-plated Chain, Crystal','Silver & Clear',1),
(16,'PEN-BD-001','Brass Book Darts (50-pack)','Slim brass book darts that clip precisely to a single line on the page without bending. The reader\'s choice for annotation.',4,9.99,'Brass','Gold',0),
(17,'PEN-BD-002','Color-Coded Adhesive Page Tabs (6-color set)','Semi-transparent adhesive page tabs in six colors for color-coded annotation. Repositionable and residue-free.',4,5.49,'PET Film','Multicolor',0),
(18,'PEN-BD-003','Stainless Steel Book Dart Set (25-pack)','Precision-engineered stainless steel book darts for marking passages without damage. Corrosion-resistant.',4,8.99,'Stainless Steel','Silver',0),
(19,'PEN-BD-004','Arrow Sticky Note Tabs (300-count)','Small arrow-shaped sticky note tabs for flagging key passages. Repositionable and strong-hold.',4,4.99,'Paper','Assorted Neon',0),
(20,'PEN-BD-005','Floral Washi Tape Bookmark Set','Set of five rolls of washi tape with botanical patterns for creating custom page flags and annotations.',4,7.99,'Washi Paper','Floral Pastels',1),
(21,'PEN-BS-001','Bamboo Adjustable Book Stand','Eco-friendly bamboo book stand with six adjustable angles and page-hold wings. Folds flat for storage.',5,24.99,'Bamboo','Natural',0),
(22,'PEN-BS-002','Acrylic Floating Book Display Stand','Clear acrylic minimalist stand that holds a book open at 90 degrees for display or hands-free reading.',5,17.99,'Acrylic','Clear',1),
(23,'PEN-BS-003','Wrought Iron Vintage Book Easel','Decorative wrought iron easel stand with ornate scrollwork. Perfect for displaying a favorite book on a shelf or desk.',5,34.99,'Wrought Iron','Antique Black',1),
(24,'PEN-BS-004','Portable Silicone Book Seat','Flexible silicone book holder that fans pages open flat for hands-free reading on a table. Lightweight and travel-friendly.',5,14.99,'Silicone','Stone Gray',0),
(25,'PEN-BS-005','Lap Desk with Book Rest','Cushioned lap board with a raised book rest rail and a flat writing surface. Includes a side pocket for a bookmark or phone.',5,39.99,'MDF, Microfiber Cushion','Charcoal',0),
(26,'PEN-RA-001','Rechargeable LED Book Light','Slim clip-on LED reading light with three brightness settings and a flexible neck. USB-C rechargeable, up to 40 hours of battery life.',6,22.99,'ABS Plastic','Black',1),
(27,'PEN-RA-002','Page Magnifier Bookmark','Flat Fresnel lens magnifier that doubles as a bookmark. Enlarges text up to 2x for easier reading.',6,9.99,'Fresnel Acrylic','Clear',1),
(28,'PEN-RA-003','Finger Page Turner (2-pack)','Ergonomic silicone fingertip covers that prevent paper cuts and make page turning effortless.',6,4.99,'Silicone','Blush Pink',0),
(29,'PEN-RA-004','Book Lover\'s Pouch & Accessory Kit','Canvas zipper pouch containing a mini pencil, sticky tabs, a book dart set, and an eraser.',6,18.99,'Canvas, Mixed','Forest Green',1),
(30,'PEN-RA-005','Anti-Glare Reading Glasses (+1.5)','Lightweight anti-glare reading glasses with spring hinges and a slim oval frame. Includes a microfiber pouch.',6,16.99,'TR90 Frame, Glass Lens','Tortoiseshell',0),
(31,'PEN-BB-001','Canvas Literary Tote Bag','Heavy-duty 12 oz canvas tote printed with a classic library card design. Fits up to 6 paperbacks or 2 large hardcovers.',7,18.99,'Canvas','Natural & Black',1),
(32,'PEN-BB-002','Leather Book Satchel','Full-grain leather book bag with a magnetic snap closure, padded interior lining, and an adjustable shoulder strap.',7,79.99,'Full-grain Leather','Chestnut',1),
(33,'PEN-BB-003','Waxed Canvas Book Backpack','Water-resistant waxed canvas backpack with a padded book compartment and antique brass hardware.',7,64.99,'Waxed Canvas','Navy',0),
(34,'PEN-BB-004','Pendragon Branded Reusable Tote','Pendragon Bookstore branded recycled cotton tote. Lightweight, machine washable, and eco-friendly.',7,9.99,'Recycled Cotton','Burgundy',1),
(35,'PEN-BB-005','Jute Market Book Bag','Open-top jute market tote with reinforced handles. Sturdy enough for groceries but elegant enough for books.',7,12.99,'Jute','Natural',0),
(36,'PEN-SC-001','Quilted Fabric Book Sleeve (Paperback)','Padded quilted cotton sleeve that protects paperbacks from scratches and spills. Elastic closure.',8,14.99,'Quilted Cotton','Dusty Rose',1),
(37,'PEN-SC-002','Vegan Leather Hardcover Book Jacket','Snap-on vegan leather book jacket with an interior ribbon bookmark attached. Fits most standard hardcovers.',8,22.99,'Vegan Leather','Olive Green',1),
(38,'PEN-SC-003','Neoprene Book Sleeve with Handle','Water-resistant neoprene sleeve with a top grab handle. Fits books up to 9" x 6". Great for commuters.',8,17.99,'Neoprene','Slate Blue',0),
(39,'PEN-SC-004','Embroidered Linen Book Cover','Hand-embroidered linen book cover with a bookmark ribbon sewn in. One-size-fits-most paperback design.',8,19.99,'Linen, Embroidery Thread','Ivory & Sage',1),
(40,'PEN-SC-005','Hardcover Stretch Book Cover (3-pack)','Set of three durable stretch fabric book covers in assorted patterns. Machine washable.',8,11.99,'Polyester Stretch Fabric','Assorted',0),
(41,'PEN-SJ-001','Reading Journal — Hardcover','A 200-page hardcover reading journal with prompts for tracking books, ratings, quotes, and reflections. Lay-flat binding.',9,18.99,'Hardcover, Cream Paper','Forest Green',1),
(42,'PEN-SJ-002','Book Lover\'s Annotation Kit','Set including a mechanical pencil, four-color erasable pen, fine-tip highlighter set, and sticky note booklet in a linen pouch.',9,24.99,'Mixed','Terracotta',1),
(43,'PEN-SJ-003','Monthly Reading Tracker Notepad','Tear-off notepad with 50 monthly reading tracker sheets with spaces for title, author, genre, dates, and star rating.',9,8.99,'Newsprint','Cream & Rust',0),
(44,'PEN-SJ-004','Pendragon Bookstore Branded Pen Set','Set of three smooth-writing ballpoint pens in Pendragon burgundy, black, and gold with the store logo engraved.',9,12.99,'Metal Barrel','Burgundy, Black, Gold',1),
(45,'PEN-SJ-005','Literary Quote Postcard Set (20-pack)','Set of 20 high-quality postcard prints featuring hand-lettered quotes from classic and contemporary literature.',9,14.99,'Cardstock','Assorted',1),
(46,'PEN-GS-001','The Cozy Reader Gift Set','Curated gift set including a wildflower pressed bookmark, a rechargeable LED book light, and a canvas literary tote. In a kraft gift box.',10,44.99,'Mixed','Natural',1),
(47,'PEN-GS-002','The Annotator\'s Gift Set','Gift set for the serious reader: brass book dart 50-pack, a reading journal, a four-color annotation pen, and a sticky tab multipack.',10,54.99,'Mixed','Ivory & Gold',1),
(48,'PEN-GS-003','The Traveler\'s Reading Kit','Portable reading bundle: neoprene book sleeve, rechargeable book light, and silicone book seat. Ideal for commuters.',10,49.99,'Mixed','Navy & Gray',1),
(49,'PEN-GS-004','The Vintage Reader Gift Box','Nostalgic gift set: brass engraved bookmark, wrought iron book easel, and a literary quote postcard set. In a Pendragon gift box.',10,59.99,'Mixed','Antique Gold',1),
(50,'PEN-GS-005','The New Bookworm Starter Kit','A welcoming gift set: magnetic corner bookmark set, Pendragon branded tote, reading tracker notepad, and annotation kit.',10,39.99,'Mixed','Assorted',1);

-- ============================================================
-- INSERT: Accessory_Inventory (stores 1–11 only)
-- ============================================================
INSERT INTO Accessory_Inventory (AccessoryID, StoreID, QuantityOnHand, ReorderLevel) VALUES
(1,1,40,10),(6,1,30,10),(11,1,25,10),(16,1,50,15),(21,1,15,5),(26,1,20,8),(31,1,35,10),(36,1,22,8),(41,1,28,10),(46,1,12,5),
(2,2,45,10),(7,2,28,10),(12,2,20,8),(17,2,60,15),(22,2,18,5),(27,2,25,8),(32,2,10,5),(37,2,20,8),(42,2,15,5),(47,2,8,5),
(3,3,35,10),(8,3,22,10),(13,3,18,8),(18,3,55,15),(23,3,8,5),(28,3,40,10),(33,3,12,5),(38,3,25,8),(43,3,30,10),(48,3,7,5),
(4,4,50,10),(9,4,35,10),(14,4,22,8),(19,4,80,20),(24,4,20,8),(29,4,18,8),(34,4,45,15),(39,4,17,8),(44,4,25,10),(49,4,10,5),
(5,5,38,10),(10,5,42,10),(15,5,15,5),(20,5,70,20),(25,5,10,5),(30,5,22,8),(35,5,28,10),(40,5,30,10),(45,5,20,8),(50,5,14,5),
(1,6,30,10),(6,6,25,10),(11,6,20,8),(16,6,45,15),(21,6,12,5),(26,6,18,8),(31,6,30,10),(36,6,18,8),(41,6,22,10),(46,6,9,5),
(2,7,40,10),(7,7,20,10),(12,7,16,8),(17,7,55,15),(22,7,14,5),(27,7,20,8),(32,7,8,5),(37,7,16,8),(42,7,12,5),(47,7,6,5),
(3,8,28,10),(8,8,18,10),(13,8,14,8),(18,8,50,15),(23,8,6,5),(28,8,35,10),(33,8,10,5),(38,8,20,8),(43,8,25,10),(48,8,5,5),
(4,9,42,10),(9,9,30,10),(14,9,18,8),(19,9,75,20),(24,9,16,8),(29,9,15,8),(34,9,40,15),(39,9,14,8),(44,9,20,10),(49,9,8,5),
(5,10,32,10),(10,10,38,10),(15,10,12,5),(20,10,65,20),(25,10,8,5),(30,10,18,8),(35,10,24,10),(40,10,26,10),(45,10,16,8),(50,10,11,5),
(1,11,36,10),(6,11,28,10),(11,11,22,8),(16,11,48,15),(21,11,14,5),(26,11,20,8),(31,11,32,10),(36,11,20,8),(41,11,24,10),(46,11,10,5);

-- ============================================================
-- INSERT: Accessory_Order_Items (20 sample purchases)
-- ============================================================
INSERT INTO Accessory_Order_Items (OrderID, AccessoryID, Quantity, UnitPrice, Discount) VALUES
(1,46,1,44.99,0.00),(2,1,2,8.99,0.00),(3,41,1,18.99,5.00),(4,6,1,9.99,0.00),(5,31,1,18.99,0.00),
(6,26,1,22.99,10.00),(7,47,1,54.99,0.00),(8,11,1,16.99,0.00),(9,16,1,9.99,0.00),(10,36,1,14.99,5.00),
(11,48,1,49.99,0.00),(12,2,1,6.99,0.00),(13,42,1,24.99,0.00),(14,21,1,24.99,0.00),(15,7,2,7.99,0.00),
(16,49,1,59.99,0.00),(17,12,1,13.99,0.00),(18,37,1,22.99,5.00),(19,43,2,8.99,0.00),(20,50,1,39.99,0.00);

-- ============================================================
-- INSERT: Employee_Performance
-- Annual reviews 2024 — all 51 employees
-- ============================================================
INSERT INTO Employee_Performance (EmployeeID, ReviewerID, ReviewDate, ReviewYear, Rating, Category, Notes) VALUES
-- Georgia employees
(1,1,'2024-12-31',2024,9,'Overall','Yukihiro delivered a consistently strong year at Store 1 in Atlanta. He maintained inventory accuracy above 98% all four quarters, introduced a new end-of-day reconciliation checklist that reduced discrepancies by 15%, and managed the holiday rush with exceptional planning. The store achieved its highest single-day revenue on record in Q4. His mentorship of junior staff was a noted strength and he is regarded as one of the most reliable store managers in the Georgia network.'),
(2,2,'2024-12-31',2024,8,'Overall','Amara had a well-rounded year as Assistant Manager at Store 2 in Athens. She navigated a mid-year inventory backlog and resolved it without escalation, introduced a staff briefing routine that improved team cohesion, and coordinated a seasonal book drive that generated positive local press. A Q2 dip in inventory processing speed was the only notable concern, which she addressed promptly and did not recur. She ended the year with strong sales figures and team morale scores.'),
(3,4,'2024-12-31',2024,8,'Overall','Diego showed clear growth across 2024 at Store 3 in Augusta. His product knowledge deepened significantly, his shelf management became more proactive, and his performance during the holiday season was commendable. He independently reorganized the Fiction section by sub-genre to positive customer feedback. Two missed training sessions in Q3 were noted, addressed professionally, and did not recur. His attitude and customer rapport are consistent strengths heading into 2025.'),
(4,4,'2024-12-31',2024,10,'Overall','Fatima delivered an exceptional year at Store 4 in Macon. She maintained zero inventory discrepancies for the second consecutive year, piloted a cross-store book transfer program now being expanded network-wide, hosted a local author signing that drove a 22% foot traffic increase in September, and finished Q4 at 18% above revenue target — the highest quarterly result in the store''s history. She also informally mentored two assistant managers from neighboring stores during the holiday preparation period. Fatima is among the top performers in the entire Pendragon network.'),
(5,5,'2024-12-31',2024,7,'Overall','Priya showed meaningful improvement over the course of 2024 at Store 5 in Savannah. Following Q1 cash handling errors and additional training, she maintained an error-free register record for the remainder of the year. She volunteered for an after-hours inventory count in Q3 and trained a seasonal holiday hire in Q4. Her confidence and accuracy improved consistently and she is well-positioned for further growth in 2025.'),
(6,6,'2024-12-31',2024,9,'Overall','Elijah had an outstanding year as Inventory Specialist at Store 6 in Gainesville. He maintained a stock variance of under 0.5% all year, restructured the back-stock labeling system now adopted store-wide, flagged a supplier receiving error that saved an estimated $400 in overpayments, and managed the highest holiday shipment volume in store history without a single error. He volunteered extended hours during peak delivery weeks and was nominated for store-level Employee of the Quarter in Q4.'),
(7,7,'2024-12-31',2024,8,'Overall','Ingrid managed Store 7 in Dalton with steady professionalism throughout 2024. She implemented a returns processing workflow that reduced handling time by 20%, organized a holiday children''s story-time event that boosted family-category sales, and met every operational target in Q4. A slight Q3 sales dip below target was flagged; Ingrid responded with community engagement programming that delivered results in Q4. She ends the year with three written customer commendations and strong team feedback.'),
(8,9,'2024-12-31',2024,8,'Overall','Kofi had a strong and growth-filled year at Store 8 in Albany. He became fully self-sufficient in his closing duties by Q2, independently organized a voluntary in-store reading group that attracted loyal returning participants, and was the top-performing sales associate at his store during the holiday season with the highest personalized book recommendation conversion count. He also mentored a temporary holiday hire with patience and professionalism. His trajectory over the year is clearly upward.'),
(9,9,'2024-12-31',2024,10,'Overall','Mei delivered a flawless year at Store 9 in Evans and is the top-rated manager in the Georgia network for 2024. She recorded zero stock discrepancies all year, the highest customer satisfaction scores across all Georgia stores in Q1, navigated a mid-year double staffing absence without any visible customer impact, and led a best-practices workshop attended by three neighboring stores. She surpassed every Q4 target and has been formally shortlisted for a regional lead role consideration in early 2025. An exceptional performer by every measure.'),
(10,9,'2024-12-31',2024,8,'Overall','Aaliyah had a productive year in Customer Service at Store 10 in Swainsboro. She introduced a reservation follow-up call process that reduced no-show rates by 18%, managed the highest contact volume of the year during Q4 without a single escalated complaint, and handled multiple complex holiday return scenarios with diplomacy and precision. A brief Q2 email backlog was the only notable concern, resolved within two weeks. She is strongly recommended for a senior customer service designation.'),
(11,11,'2024-12-31',2024,7,'Overall','Rashid showed steady improvement throughout 2024 at Store 11 in Columbus. After Q1 register void issues and retraining, he maintained error-free accuracy for the remainder of the year. He was observed going above expectations with a visually impaired customer in Q3 and received two written customer compliments by name in Q4. His composure during holiday checkout lines was noted positively. Continued growth into 2025 is expected and encouraged.'),
-- Alabama employees
(12,12,'2024-12-31',2024,9,'Overall','Imani launched Store 12 in Birmingham to strong community reception and maintained that momentum all year. She drove above-forecast foot traffic through local outreach and bookclub partnerships, adapted well to early delegation feedback by Q3, and organized a community holiday reading event with an elementary school that generated significant positive press for the Pendragon brand. The store exceeded its holiday sales target by 14% and Imani enters 2025 as one of the strongest new store managers in the Alabama expansion.'),
(13,12,'2024-12-31',2024,8,'Overall','Devon had a solid first full year at Store 12 in Birmingham. He progressed from needing frequent system guidance in Q1 to operating independently by Q3 and flagging a recurring inventory miscount in the Biography section on his own initiative. His holiday performance was strong — he led all associates at his store in membership sign-ups. A clear upward trajectory with good product knowledge and growing customer confidence.'),
(14,14,'2024-12-31',2024,9,'Overall','Yolanda managed Store 13 in Montgomery with consistency and cultural awareness throughout 2024. She coordinated a well-received Spanish-language Heritage Month display that measurably increased non-English title sales, ran structured monthly one-on-ones with her associate that visibly improved engagement, and submitted a detailed 2025 staffing proposal ahead of schedule. The store hit its Q4 target and Yolanda is regarded as a methodical, communicative, and reliable leader.'),
(15,14,'2024-12-31',2024,7,'Overall','Marcus had a growth-oriented year at Store 13 in Montgomery. After a rough Q1 adjustment period, he became error-free at the register by April and maintained that standard all year. He demonstrated composure during a register system outage in Q3, processing transactions manually without complaints. While his book catalog knowledge is still developing, his punctuality, accuracy, and patience with customers are consistent strengths. On track for continued improvement in 2025.'),
(16,16,'2024-12-31',2024,10,'Overall','Priyanka is the highest-rated manager in the Alabama network for 2024 and one of the standout performers company-wide. Her Huntsville store posted the highest Alabama revenue for the year, she coordinated a STEM reading display tied to the city''s aerospace identity that increased science and technology sales by 31%, created an onboarding checklist now shared across all Alabama stores, and earned the highest customer satisfaction scores in the Alabama network for three consecutive quarters. She has been recommended for a regional mentorship role in 2025.'),
(17,16,'2024-12-31',2024,8,'Overall','Elliot delivered reliable and precise inventory work throughout 2024 at Store 14 in Huntsville. He developed a color-coded shelf label system adopted permanently by the store, maintained a stock accuracy rate above 99% all year, solo-managed a large mid-year shipment arrival during a manager conflict, and worked two voluntary days off during peak holiday weeks to ensure readiness. His accuracy, reliability, and quiet initiative are among the strongest inventory specialist qualities in the network.'),
(18,18,'2024-12-31',2024,9,'Overall','Celeste built an impressive community presence for Store 15 in Mobile during 2024. Her monthly book club partnership with a local community center grew to over 30 active members. She achieved 107% of Q4 revenue target, and her holiday display design was featured as a visual merchandising best practice in the regional newsletter. A minor reservation backlog in Q3 was the only area flagged and was resolved promptly.'),
(19,18,'2024-12-31',2024,7,'Overall','Jordan had a developmental year at Store 15 in Mobile. Q1 presented system learning challenges, but after coaching and retraining, he processed all subsequent returns correctly and improved his communication quality noticeably. By Q4 his reservation follow-up rate reached 100% — a significant turnaround from the year''s start. He managed Q4 customer service volume independently and with confidence. Celeste has recommended him for a formal Customer Service certification program in 2025.'),
(20,20,'2024-12-31',2024,9,'Overall','Amara managed Store 16 in Tuscaloosa with intelligence and adaptability in 2024. She capitalized on the university demographic effectively during the academic year, developed community outreach to offset the summer slowdown, and prepared welcome-back promotions that drove strong Q3 opening-semester results. Her end-of-year performance review process was praised by the team in the internal survey. Hassan''s visible improvement over the year reflects well on her mentorship and patience as a leader.'),
(21,20,'2024-12-31',2024,7,'Overall','Hassan grew considerably throughout 2024 at Store 16 in Tuscaloosa. He entered the year needing frequent shelf guidance and limited product knowledge; by year-end he was independently maintaining his sections, confidently answering genre-specific customer questions, and recording the highest number of membership conversions among associates at his store during the holiday season. His first written customer compliment arrived in Q4. A strong growth arc and a promising foundation for 2025.'),
(22,22,'2024-12-31',2024,9,'Overall','Saoirse managed Store 17 in Auburn with creativity and discipline throughout 2024. She introduced a pre-shift shelf audit routine that cut misplaced books by 40%, coordinated the store''s participation in a citywide summer reading challenge, managed solo store operations during a two-week associate absence with no service quality drop, and coordinated a holiday gift pairing display that drove a 23% lift in accessory attachment sales. Her operational and creative contributions alike were outstanding.'),
(23,22,'2024-12-31',2024,7,'Overall','Tobias had a year with some turbulence but finished strongly at Store 17 in Auburn. His register performance was consistently accurate outside of a Q3 personal absence period. Upon returning he reintegrated quickly with Saoirse''s support and managed the new holiday gift card redemption system without any additional instruction. His self-sufficiency and confidence have both clearly grown from the beginning of the year to the end. A positive foundation going into 2025.'),
(24,24,'2024-12-31',2024,8,'Overall','Nneka established Store 18 in Decatur as a stable and well-run location in its opening year. She focused early on operational fundamentals, developed a strong receiving workflow, and began community outreach in Q2 through partnerships with local libraries and civic organizations. She is methodical in her approach, communicates clearly with her team, and demonstrates consistent follow-through on both administrative and floor responsibilities. A reliable and growing presence in the Alabama network.'),
(25,24,'2024-12-31',2024,7,'Overall','Liam joined Store 18 in Decatur with enthusiasm and adapted to the bookstore environment steadily throughout the year. His customer interactions are warm and natural, he keeps his assigned sections tidy without prompting, and he has shown willingness to take on additional tasks when the store is short-handed. His product knowledge is expanding and Nneka has noted him as a dependable presence on the floor. On track for continued development in 2025.'),
(26,26,'2024-12-31',2024,9,'Overall','Fatou had an impressive year leading Store 19 in Gadsden. She leveraged her Chamber of Commerce relationship into a joint local business appreciation event that brought in new first-time customers, secured a part-time staffing approval and onboarded the hire efficiently ahead of the holiday peak, and saw the store featured in the local business journal. She is methodical, professional, and deeply connected to the Gadsden community. Store 19 hit its annual revenue target and finished the year in strong health.'),
(27,26,'2024-12-31',2024,8,'Overall','Rowan had a strong and well-rounded year at Store 19 in Gadsden. Their product knowledge grew from early-year development into genuine expertise by Q3, and they became Fatou''s informal go-to for customer recommendation questions. They also took on additional floor responsibilities during the staffing hire process and were instrumental in onboarding the part-time associate. Fatou has formally recommended Rowan for a senior associate designation and they are on a clear upward trajectory.'),
(28,28,'2024-12-31',2024,8,'Overall','Keiko managed Store 20 in Anniston with community-centered leadership throughout 2024. Her tailored initial stock selection resulted in a higher-than-average sell-through rate in Q1, her middle school summer reading partnership generated lasting community goodwill and repeat family customers, and she tightened up the receiving process effectively in Q3 following a minor discrepancy. Store 20 finished 9% above its cumulative annual revenue target, a result that reflects her careful and people-first management approach.'),
(29,28,'2024-12-31',2024,8,'Overall','Damien had a solid year as Inventory Specialist at Store 20 in Anniston. He completed his software onboarding fully in Q2, identified six mis-shelved titles during a self-initiated shelf audit, and thoroughly documented a vendor packing slip discrepancy in Q3 that supported a successful supplier dispute. His Q4 accuracy remained strong through the heaviest shipment period of the year and he proactively flagged a Children''s section overstock risk before it became a floor problem.'),
(30,30,'2024-12-31',2024,9,'Overall','Anaya had an outstanding year at Store 21 in Florence. She launched a local author series that grew across three quarterly installments and culminated in a holiday edition that set a single-day foot traffic and revenue record for the store. Her community programming approach is being studied for replication at other Alabama locations. Operationally she maintained high standards throughout, Felix thrived under her consistent leadership, and the store finished the year as a model for community engagement in the Alabama network.'),
(31,30,'2024-12-31',2024,9,'Overall','Felix had a standout first full year at Store 21 in Florence. His register accuracy was consistently high from the outset, he managed solo register operations during a high-attendance author event without errors, took on light supervisory duties during a scheduled manager absence, proactively flagged a register calibration issue before it could cause problems, and was formally recognized by Anaya in the year-end staff meeting for his consistency and customer care. An exceptional first-year performance.'),
(32,32,'2024-12-31',2024,8,'Overall','Miriam laid a disciplined operational foundation for Store 22 in Dothan in its opening year. She focused Q1 on establishing robust backend processes before moving into community programming, developed nonprofit partnerships in Q2 and Q3 that have brought genuine goodwill and return visits to the store, and finished the year 8% above annual revenue target. Kwame''s growth across the year is a notable product of her consistent mentorship.'),
(33,32,'2024-12-31',2024,7,'Overall','Kwame entered 2024 with limited retail experience and finished the year with a dependable skill set and genuine pride in his work. He went from needing frequent guidance on the shelf system in Q1 to independent operation and a self-initiated donation intake contribution by Q3. His holiday season performance required no prompting on any core duty and he recorded a membership conversion rate above the store average.'),
(34,34,'2024-12-31',2024,8,'Overall','Sienna opened Store 23 in Opelika with calm authority and strong attention to detail. She established productive supplier relationships early, maintained clean operational records throughout the year, and focused on building a loyal local customer base through personalized service and well-curated displays. Her associate onboarded late in the year and Sienna''s structured introduction of store procedures ensured a smooth integration.'),
(35,34,'2024-12-31',2024,6,'Overall','Caden joined Store 23 in Opelika in October and 2024 represents a short but foundational period. He adapted to the POS system faster than expected and showed genuine interest in the product catalog from day one. His customer interactions are polite and improving in confidence. Given his late-year start, a full performance picture will be available after 2025.'),
(36,36,'2024-12-31',2024,9,'Overall','Zuri managed Store 24 in Cullman with consistent excellence throughout 2024. She developed a strong rapport with the local community early in the year and channeled it into a steady stream of new memberships and repeat customers. Her operational discipline is strong — no stock discrepancies were recorded all year — and she supports her associate''s development with structured, patient feedback. The store met its annual revenue target.'),
(37,36,'2024-12-31',2024,7,'Overall','Elena had a productive first full year at Store 24 in Cullman. She grew her product knowledge steadily under Zuri''s structured guidance and is now able to engage customers across multiple genres with confidence. Her shelf maintenance and documentation habits are consistent and she has demonstrated reliability during busy floor periods. She is encouraged to take more initiative in customer approach interactions.'),
(38,38,'2024-12-31',2024,8,'Overall','Tariq led Store 25 in Jasper with experience and calm professionalism throughout 2024. He established operational systems quickly, maintained a clean inventory record, and built the kind of quiet, reliable floor culture that retains customers. His associate is early in development and Tariq has been deliberate in structuring Amina''s growth. The store performed consistently against its targets all year.'),
(39,38,'2024-12-31',2024,6,'Overall','Amina joined Store 25 in Jasper in May and spent 2024 in an active learning phase. Her register accuracy is acceptable and improving, her customer manner is friendly, and she takes feedback well. She required more hands-on guidance than average in her first few months, particularly around the inventory log, but made real progress by Q4. Tariq sees meaningful potential and expects a more complete performance picture in 2025.'),
(40,40,'2024-12-31',2024,8,'Overall','Darius managed Store 26 in Alabaster with practicality and customer focus throughout 2024. He built a reliable daily routine early in the year that kept operations running smoothly and invested time in learning the local customer base''s reading preferences to inform the store''s display rotations. His associate joined late in the year and Darius has been thorough in introducing store systems and expectations.'),
(41,40,'2024-12-31',2024,6,'Overall','Yuki joined Store 26 in Alabaster in November and 2024 captures only their first two months on the floor. They showed enthusiasm from day one and picked up the POS process more quickly than expected. Customer feedback in their early weeks has been positive. A full performance assessment will be available after they have completed a full quarter.'),
(42,42,'2024-12-31',2024,8,'Overall','Chidinma opened Store 27 in Enterprise with energy and community awareness. She identified that Enterprise has a strong military community connection given the proximity to Fort Novosel and used this insight to curate a relevant reading display that drove higher-than-average engagement from new customers. She is organized, communicative, and proactive in her approach to both operations and community outreach.'),
(43,42,'2024-12-31',2024,6,'Overall','Rafael joined Store 27 in Enterprise in September and finished 2024 in an active onboarding phase. His register training was completed on schedule and he has shown genuine curiosity about the book catalog, frequently asking questions about titles and genres on his own initiative. Customer interactions are warm if sometimes brief. Chidinma expects a more complete performance picture after Q1 2025.'),
(44,44,'2024-12-31',2024,9,'Overall','Nadia managed Store 28 in Talladega with strong leadership and a clear focus on customer experience throughout 2024. She developed a consistent floor culture of product knowledge and proactive service, coordinated a local reading display tied to the Talladega Superspeedway fan community that drove meaningful seasonal traffic, and maintained strong operational discipline all year. The store finished the year above its revenue target.'),
(45,44,'2024-12-31',2024,7,'Overall','Kofi had a steady first full year at Store 28 in Talladega. He adapted to the role with good humility and a willingness to learn, grew his product knowledge considerably under Nadia''s guidance, and became reliably self-sufficient in his core duties by mid-year. His customer interactions are warm and increasingly confident. He is encouraged to take more initiative in recommending titles without waiting for customers to ask first.'),
(46,46,'2024-12-31',2024,8,'Overall','Leila has led Store 29 in Moody with consistency and operational focus since the store''s opening. She is one of the longer-tenured Alabama managers and her experience shows in the calm, efficient environment she maintains. She is methodical in her approach to scheduling, inventory, and community outreach, and her associate has responded well to her structured management style. The store delivered against its annual revenue target.'),
(47,46,'2024-12-31',2024,6,'Overall','Matteo joined Store 29 in Moody in June and spent the second half of 2024 developing his foundation in the role. His register accuracy improved meaningfully after Q3 coaching from Leila and he has become comfortable with daily floor duties. Customer-facing skills are growing — he is encouraged to extend conversations beyond the transaction itself. Leila is planning a structured development roadmap for Matteo heading into 2025.'),
(48,48,'2024-12-31',2024,8,'Overall','Seun opened Store 30 in Andalusia with a thoughtful and unhurried approach that suits the community well. He prioritized relationship-building early in the year and has developed genuine connections with local repeat customers and civic organizations. Operationally the store has been clean and well-documented all year. His associate is early in her tenure and Seun has been patient and deliberate in her onboarding.'),
(49,48,'2024-12-31',2024,6,'Overall','Cleo joined Store 30 in Andalusia in August and her 2024 performance reflects an early but encouraging start. She learned the POS system within two weeks of joining, keeps her assigned area tidy without prompting, and responds to customer queries with a friendly and genuine warmth that Seun has noted positively. Her independent work habits are still forming and she will be the subject of a more comprehensive review after completing a full year in 2025.'),
(50,50,'2024-12-31',2024,9,'Overall','Adaeze managed Store 31 in Selma with cultural sensitivity and strong community instinct throughout 2024. Selma carries significant historical weight and Adaeze embraced this thoughtfully, organizing commemorative reading displays tied to local heritage events that were deeply appreciated by the community and drove meaningful engagement. Operationally she maintained high standards all year and her associate''s development reflected the care she puts into her mentorship.'),
(51,50,'2024-12-31',2024,7,'Overall','Jerome joined Store 31 in Selma in March and had a solid developmental year under Adaeze''s mentorship. He progressed from needing support on basic register and shelving tasks in Q1 to operating independently with good accuracy by Q3. He assisted with the heritage reading display setups with attention and care, demonstrating pride in the store''s community role. His customer service confidence is growing and Adaeze expects him to step more fully into the role''s potential through 2025.');

-- ============================================================
-- FINAL VERIFICATION QUERIES
-- ============================================================
SELECT * FROM Locations    ORDER BY State, City;
SELECT * FROM Stores       ORDER BY StoreID;
SELECT * FROM Employees    ORDER BY WorkState, StoreID, EmployeeID;
SELECT * FROM Customers    ORDER BY CustomerID;
SELECT * FROM Publishers   ORDER BY PublisherID;
SELECT * FROM Authors      ORDER BY AuthorID;
SELECT * FROM Books        ORDER BY BookID;
SELECT * FROM Book_Authors ORDER BY BookID;
SELECT * FROM Inventory    ORDER BY StoreID, BookID;
SELECT * FROM Orders       ORDER BY OrderID;
SELECT * FROM Order_Items  ORDER BY OrderItemID;
SELECT * FROM Payments     ORDER BY PaymentID;
SELECT * FROM Returns      ORDER BY ReturnID;
SELECT * FROM Reservations ORDER BY ReservationID;
SELECT * FROM Genres       ORDER BY GenreID;
SELECT * FROM Genre_Books  ORDER BY GenreID, IsReal DESC;
SELECT * FROM Accessory_Categories ORDER BY CategoryID;
SELECT * FROM Accessories          ORDER BY CategoryID, AccessoryID;
SELECT * FROM Accessory_Inventory  ORDER BY StoreID, AccessoryID;
SELECT * FROM Accessory_Order_Items ORDER BY AccessoryOrderItemID;
SELECT * FROM Employee_Performance ORDER BY Rating DESC, EmployeeID;

-- Row count summary — all 20 tables
SELECT 'Locations'              AS TableName, COUNT(*) AS TotalRows FROM Locations              UNION ALL
SELECT 'Stores'                 AS TableName, COUNT(*) AS TotalRows FROM Stores                 UNION ALL
SELECT 'Employees'              AS TableName, COUNT(*) AS TotalRows FROM Employees              UNION ALL
SELECT 'Customers'              AS TableName, COUNT(*) AS TotalRows FROM Customers              UNION ALL
SELECT 'Publishers'             AS TableName, COUNT(*) AS TotalRows FROM Publishers             UNION ALL
SELECT 'Authors'                AS TableName, COUNT(*) AS TotalRows FROM Authors                UNION ALL
SELECT 'Books'                  AS TableName, COUNT(*) AS TotalRows FROM Books                  UNION ALL
SELECT 'Book_Authors'           AS TableName, COUNT(*) AS TotalRows FROM Book_Authors           UNION ALL
SELECT 'Inventory'              AS TableName, COUNT(*) AS TotalRows FROM Inventory              UNION ALL
SELECT 'Orders'                 AS TableName, COUNT(*) AS TotalRows FROM Orders                 UNION ALL
SELECT 'Order_Items'            AS TableName, COUNT(*) AS TotalRows FROM Order_Items            UNION ALL
SELECT 'Payments'               AS TableName, COUNT(*) AS TotalRows FROM Payments              UNION ALL
SELECT 'Returns'                AS TableName, COUNT(*) AS TotalRows FROM Returns                UNION ALL
SELECT 'Reservations'           AS TableName, COUNT(*) AS TotalRows FROM Reservations           UNION ALL
SELECT 'Genres'                 AS TableName, COUNT(*) AS TotalRows FROM Genres                 UNION ALL
SELECT 'Genre_Books'            AS TableName, COUNT(*) AS TotalRows FROM Genre_Books            UNION ALL
SELECT 'Accessory_Categories'   AS TableName, COUNT(*) AS TotalRows FROM Accessory_Categories   UNION ALL
SELECT 'Accessories'            AS TableName, COUNT(*) AS TotalRows FROM Accessories            UNION ALL
SELECT 'Accessory_Inventory'    AS TableName, COUNT(*) AS TotalRows FROM Accessory_Inventory    UNION ALL
SELECT 'Accessory_Order_Items'  AS TableName, COUNT(*) AS TotalRows FROM Accessory_Order_Items  UNION ALL
SELECT 'Employee_Performance'   AS TableName, COUNT(*) AS TotalRows FROM Employee_Performance;