-- ============================================================
-- Pendragon Bookstore Database
-- Complete Compiled Script with All Revisions
-- Platform: MySQL
-- ============================================================

DROP SCHEMA IF EXISTS pendragon_bookstore;
CREATE SCHEMA pendragon_bookstore;
USE pendragon_bookstore;

-- ============================================================
-- Table: Locations
-- ============================================================
CREATE TABLE Locations (
    ZipCode     VARCHAR(10)  NOT NULL,
    City        VARCHAR(100) NOT NULL,
    State       VARCHAR(50)  NOT NULL,
    CONSTRAINT pk_Locations PRIMARY KEY (ZipCode)
);

-- ============================================================
-- Table: Stores
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_Stores_Phone
        CHECK (PhoneNumber REGEXP '^[0-9\\-\\+\\(\\) ]+$'),
    CONSTRAINT chk_Stores_Email
        CHECK (Email LIKE '%@%.%')
);

CREATE INDEX idx_Stores_ZipCode ON Stores(ZipCode);

-- ============================================================
-- Table: Employees
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
    CONSTRAINT pk_Employees PRIMARY KEY (EmployeeID),
    CONSTRAINT uq_Employees_Email UNIQUE (Email),
    CONSTRAINT fk_Employees_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_Employees_Email
        CHECK (Email LIKE '%@%.%'),
    CONSTRAINT chk_Employees_Role
        CHECK (Role IN ('Store Manager', 'Assistant Manager', 'Sales Associate',
                        'Cashier', 'Inventory Specialist', 'Customer Service'))
);

CREATE INDEX idx_Employees_StoreID ON Employees(StoreID);

-- ============================================================
-- Table: Customers
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_Customers_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
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
-- Table: Publishers
-- ============================================================
CREATE TABLE Publishers (
    PublisherID   INT          NOT NULL AUTO_INCREMENT,
    PublisherName VARCHAR(150) NOT NULL,
    Country       VARCHAR(100) NOT NULL,
    Website       VARCHAR(255) NULL,
    CONSTRAINT pk_Publishers PRIMARY KEY (PublisherID)
);

-- ============================================================
-- Table: Authors
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
-- Table: Books
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
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
-- Table: Book_Authors
-- ============================================================
CREATE TABLE Book_Authors (
    BookID   INT NOT NULL,
    AuthorID INT NOT NULL,
    CONSTRAINT pk_Book_Authors PRIMARY KEY (BookID, AuthorID),
    CONSTRAINT fk_BookAuthors_BookID FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_BookAuthors_AuthorID FOREIGN KEY (AuthorID)
        REFERENCES Authors(AuthorID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ============================================================
-- Table: Inventory
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_Inventory_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_Inventory_Quantity
        CHECK (QuantityOnHand >= 0)
);

CREATE INDEX idx_Inventory_BookID  ON Inventory(BookID);
CREATE INDEX idx_Inventory_StoreID ON Inventory(StoreID);

-- ============================================================
-- Table: Orders
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_Orders_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_Orders_EmployeeID FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_Orders_Status
        CHECK (Status IN ('Pending', 'Completed', 'Cancelled', 'Refunded'))
);

CREATE INDEX idx_Orders_CustomerID ON Orders(CustomerID);
CREATE INDEX idx_Orders_StoreID    ON Orders(StoreID);
CREATE INDEX idx_Orders_EmployeeID ON Orders(EmployeeID);

-- ============================================================
-- Table: Order_Items
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_OrderItems_BookID FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_OrderItems_Quantity
        CHECK (Quantity > 0),
    CONSTRAINT chk_OrderItems_Price
        CHECK (UnitPrice > 0),
    CONSTRAINT chk_OrderItems_Discount
        CHECK (Discount >= 0 AND Discount < 100)
);

CREATE INDEX idx_OrderItems_OrderID ON Order_Items(OrderID);
CREATE INDEX idx_OrderItems_BookID  ON Order_Items(BookID);

-- ============================================================
-- Table: Payments
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
    CONSTRAINT uq_Payments_OrderID UNIQUE (OrderID),
    CONSTRAINT fk_Payments_OrderID FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
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
-- Table: Returns
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_Returns_EmployeeID FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_Returns_Reason
        CHECK (Reason IN ('Damaged', 'Wrong Item', 'Changed Mind',
                          'Duplicate Order', 'Other')),
    CONSTRAINT chk_Returns_Status
        CHECK (Status IN ('Pending', 'Approved', 'Rejected', 'Completed'))
);

CREATE INDEX idx_Returns_OrderItemID ON Returns(OrderItemID);
CREATE INDEX idx_Returns_EmployeeID  ON Returns(EmployeeID);

-- ============================================================
-- Table: Reservations
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_Reservations_BookID FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_Reservations_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_Reservations_Status
        CHECK (Status IN ('Pending', 'Ready', 'Fulfilled', 'Cancelled', 'Expired')),
    CONSTRAINT chk_Reservations_Dates
        CHECK (ExpiryDate > ReservationDate)
);

CREATE INDEX idx_Reservations_CustomerID ON Reservations(CustomerID);
CREATE INDEX idx_Reservations_BookID     ON Reservations(BookID);
CREATE INDEX idx_Reservations_StoreID    ON Reservations(StoreID);

-- ============================================================
-- INSERT: Locations
-- ============================================================
INSERT IGNORE INTO Locations (ZipCode, City, State) VALUES
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
('31901', 'Columbus',    'Georgia');

-- ============================================================
-- INSERT: Stores
-- ============================================================
INSERT IGNORE INTO Stores (StoreID, StoreName, PhoneNumber, Email, Street, ZipCode) VALUES
(1,  'Pendragon Bookstore', '(404) 100-2001', 'atlanta@pendragon.com',     '100 Peachtree St NW', '30301'),
(2,  'Pendragon Bookstore', '(706) 100-2002', 'athens@pendragon.com',      '200 College Ave',      '30601'),
(3,  'Pendragon Bookstore', '(706) 100-2003', 'augusta@pendragon.com',     '300 Broad St',         '30901'),
(4,  'Pendragon Bookstore', '(478) 100-2004', 'macon@pendragon.com',       '400 Cherry St',        '31201'),
(5,  'Pendragon Bookstore', '(912) 100-2005', 'savannah@pendragon.com',    '500 River St',         '31401'),
(6,  'Pendragon Bookstore', '(770) 100-2006', 'gainesville@pendragon.com', '600 Main St',          '30501'),
(7,  'Pendragon Bookstore', '(706) 100-2007', 'dalton@pendragon.com',      '700 Waugh St',         '30701'),
(8,  'Pendragon Bookstore', '(229) 100-2008', 'albany@pendragon.com',      '800 Pine Ave',         '31701'),
(9,  'Pendragon Bookstore', '(706) 100-2009', 'evans@pendragon.com',       '900 Harlem Rd',        '30801'),
(10, 'Pendragon Bookstore', '(478) 100-2010', 'swainsboro@pendragon.com',  '1000 South Main St',   '30401'),
(11, 'Pendragon Bookstore', '(706) 100-2011', 'columbus@pendragon.com',    '1100 Broadway',        '31901');

-- ============================================================
-- INSERT: Employees
-- ============================================================
INSERT IGNORE INTO Employees (EmployeeID, FirstName, LastName, Email, PhoneNumber, HireDate, Role, StoreID) VALUES
(1,  'Yukihiro', 'Souma',      'yukihiro.souma@pendragon.com',     '(404) 201-3001', '2021-03-15', 'Store Manager',        1),
(2,  'Amara',    'Mensah',     'amara.mensah@pendragon.com',       '(706) 201-3002', '2020-07-22', 'Assistant Manager',    2),
(3,  'Diego',    'Reyes',      'diego.reyes@pendragon.com',        '(706) 201-3003', '2022-01-10', 'Sales Associate',      3),
(4,  'Fatima',   'Al-Rashid',  'fatima.alrashid@pendragon.com',    '(478) 201-3004', '2019-05-18', 'Store Manager',        4),
(5,  'Priya',    'Nair',       'priya.nair@pendragon.com',         '(912) 201-3005', '2023-02-28', 'Cashier',              5),
(6,  'Elijah',   'Washington', 'elijah.washington@pendragon.com',  '(770) 201-3006', '2021-09-14', 'Inventory Specialist', 6),
(7,  'Ingrid',   'Sorensen',   'ingrid.sorensen@pendragon.com',    '(706) 201-3007', '2020-11-03', 'Assistant Manager',    7),
(8,  'Kofi',     'Asante',     'kofi.asante@pendragon.com',        '(229) 201-3008', '2022-06-20', 'Sales Associate',      8),
(9,  'Mei',      'Lin',        'mei.lin@pendragon.com',            '(706) 201-3009', '2018-04-11', 'Store Manager',        9),
(10, 'Aaliyah',  'Baptiste',   'aaliyah.baptiste@pendragon.com',   '(478) 201-3010', '2023-08-05', 'Customer Service',    10),
(11, 'Rashid',   'Okonkwo',    'rashid.okonkwo@pendragon.com',     '(706) 201-3011', '2019-12-17', 'Cashier',             11);

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
-- INSERT: Publishers
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
(11, 'Pemberton Publishing',  'United Kingdom','www.pembertonpublishing.co.uk');

-- ============================================================
-- INSERT: Authors
-- ============================================================
INSERT IGNORE INTO Authors (AuthorID, FirstName, LastName, Nationality, BirthDate) VALUES
(1,  'Tiffany',   'Ngozi',     'Nigerian-American', '1985-03-12'),
(2,  'James',     'Whitmore',  'American',          '1972-07-04'),
(3,  'Amara',     'Osei',      'Ghanaian',          '1990-11-22'),
(4,  'Carlos',    'Vega',      'Mexican',           '1968-05-30'),
(5,  'Sophie',    'Beaumont',  'French',            '1983-09-15'),
(6,  'Kenji',     'Nakamura',  'Japanese',          '1975-01-08'),
(7,  'Priya',     'Sharma',    'Indian',            '1992-06-25'),
(8,  'Liam',      'O''Brien',  'Irish',             '1965-04-17'),
(9,  'Elena',     'Vasquez',   'Spanish',           '1988-12-03'),
(10, 'Marcus',    'Okafor',    'Nigerian',          '1979-08-19'),
(11, 'Charlotte', 'Pemberton', 'British',           '1995-02-28');

-- ============================================================
-- INSERT: Books
-- ============================================================
INSERT IGNORE INTO Books (BookID, ISBN, Title, Genre, PublishedYear, Edition, Language, RetailPrice, PublisherID) VALUES
(1,  '978-1-001-00001-1', 'Echoes of the Savanna',      'Fiction',     2018, '1st', 'English', 19.99,  1),
(2,  '978-1-001-00002-2', 'The Cartographer''s Secret', 'Mystery',     2015, '2nd', 'English', 14.99,  2),
(3,  '978-1-001-00003-3', 'Roots of Gold',              'Biography',   2020, '1st', 'English', 24.99,  3),
(4,  '978-1-001-00004-4', 'Beneath the Agave Moon',     'Romance',     2019, '1st', 'Spanish', 17.99,  4),
(5,  '978-1-001-00005-5', 'The Lavender District',      'Fiction',     2021, '1st', 'French',  22.99,  5),
(6,  '978-1-001-00006-6', 'Storm of Cherry Blossoms',   'Fantasy',     2017, '3rd', 'English', 16.99,  6),
(7,  '978-1-001-00007-7', 'The Saffron Path',           'Self-Help',   2022, '1st', 'English', 18.99,  7),
(8,  '978-1-001-00008-8', 'Cliffs of Connemara',        'History',     2014, '2nd', 'English', 21.99,  8),
(9,  '978-1-001-00009-9', 'Shadows Over Seville',       'Horror',      2023, '1st', 'English', 15.99,  9),
(10, '978-1-001-00010-0', 'The Lagos Chronicles',       'Non-Fiction', 2016, '1st', 'English', 23.99, 10),
(11, '978-1-001-00011-1', 'A Garden in Devonshire',     'Romance',     2020, '2nd', 'English', 13.99, 11);

-- ============================================================
-- INSERT: Book_Authors
-- ============================================================
INSERT IGNORE INTO Book_Authors (BookID, AuthorID) VALUES
(1,  1),
(2,  2),
(3,  3),
(4,  4),
(5,  5),
(6,  6),
(7,  7),
(8,  8),
(9,  9),
(10, 10),
(11, 11);

-- ============================================================
-- INSERT: Inventory
-- ============================================================
INSERT IGNORE INTO Inventory (InventoryID, BookID, StoreID, QuantityOnHand, ReorderLevel) VALUES
(1,  1,  1,  25, 5),
(2,  2,  2,  18, 5),
(3,  3,  3,  30, 5),
(4,  4,  4,  12, 5),
(5,  5,  5,  22, 5),
(6,  6,  6,  8,  5),
(7,  7,  7,  35, 5),
(8,  8,  8,  15, 5),
(9,  9,  9,  20, 5),
(10, 10, 10, 10, 5),
(11, 11, 11, 28, 5);

-- ============================================================
-- INSERT: Orders
-- ============================================================
INSERT IGNORE INTO Orders (OrderID, OrderDate, Status, CustomerID, StoreID, EmployeeID) VALUES
(1,  '2024-07-01', 'Completed', 1,  1,  1),
(2,  '2024-07-03', 'Completed', 2,  2,  2),
(3,  '2024-07-05', 'Completed', 3,  3,  3),
(4,  '2024-07-08', 'Cancelled', 4,  4,  4),
(5,  '2024-07-10', 'Completed', 5,  5,  5),
(6,  '2024-07-12', 'Completed', 6,  6,  6),
(7,  '2024-07-15', 'Pending',   7,  7,  7),
(8,  '2024-07-18', 'Completed', 8,  8,  8),
(9,  '2024-07-20', 'Refunded',  9,  9,  9),
(10, '2024-07-22', 'Completed', 10, 10, 10),
(11, '2024-07-25', 'Pending',   11, 11, 11);

-- ============================================================
-- INSERT: Order_Items
-- ============================================================
INSERT IGNORE INTO Order_Items (OrderItemID, Quantity, UnitPrice, Discount, OrderID, BookID) VALUES
(1,  2, 19.99,  0.00, 1,  1),
(2,  1, 14.99,  5.00, 2,  2),
(3,  3, 24.99, 10.00, 3,  3),
(4,  1, 17.99,  0.00, 4,  4),
(5,  2, 22.99,  5.00, 5,  5),
(6,  4, 16.99, 15.00, 6,  6),
(7,  1, 18.99,  0.00, 7,  7),
(8,  2, 21.99,  5.00, 8,  8),
(9,  1, 15.99, 10.00, 9,  9),
(10, 3, 23.99,  0.00, 10, 10),
(11, 2, 13.99,  5.00, 11, 11);

-- ============================================================
-- INSERT: Payments
-- ============================================================
INSERT IGNORE INTO Payments (PaymentID, PaymentDate, PaymentMethod, AmountPaid, PaymentConfirmation, Status, OrderID) VALUES
(1,  '2024-07-01', 'Debit Card',  39.98, 'CONF-PEN-10001', 'Paid',     1),
(2,  '2024-07-03', 'Venmo',       14.24, 'CONF-PEN-10002', 'Paid',     2),
(3,  '2024-07-05', 'Credit Card', 67.47, 'CONF-PEN-10003', 'Paid',     3),
(4,  '2024-07-08', 'Cash',        17.99, 'CONF-PEN-10004', 'Refunded', 4),
(5,  '2024-07-10', 'Zelle',       43.68, 'CONF-PEN-10005', 'Paid',     5),
(6,  '2024-07-12', 'PayPal',      57.76, 'CONF-PEN-10006', 'Paid',     6),
(7,  '2024-07-15', 'Debit Card',  18.99, 'CONF-PEN-10007', 'Pending',  7),
(8,  '2024-07-18', 'Check',       41.78, 'CONF-PEN-10008', 'Paid',     8),
(9,  '2024-07-20', 'Credit Card', 14.39, 'CONF-PEN-10009', 'Refunded', 9),
(10, '2024-07-22', 'Venmo',       71.97, 'CONF-PEN-10010', 'Paid',     10),
(11, '2024-07-25', 'Cash',        26.58, 'CONF-PEN-10011', 'Pending',  11);

-- ============================================================
-- INSERT: Reservations
-- ============================================================
INSERT IGNORE INTO Reservations (ReservationID, ReservationDate, ExpiryDate, Status, CustomerID, BookID, StoreID) VALUES
(1,  '2024-07-01', '2024-07-15', 'Fulfilled', 1,  1,  1),
(2,  '2024-07-03', '2024-07-17', 'Cancelled', 2,  2,  2),
(3,  '2024-07-05', '2024-07-19', 'Ready',     3,  3,  3),
(4,  '2024-07-08', '2024-07-22', 'Pending',   4,  4,  4),
(5,  '2024-07-10', '2024-07-24', 'Fulfilled', 5,  5,  5),
(6,  '2024-07-12', '2024-07-26', 'Expired',   6,  6,  6),
(7,  '2024-07-15', '2024-07-29', 'Pending',   7,  7,  7),
(8,  '2024-07-18', '2024-08-01', 'Ready',     8,  8,  8),
(9,  '2024-07-20', '2024-08-03', 'Cancelled', 9,  9,  9),
(10, '2024-07-22', '2024-08-05', 'Fulfilled', 10, 10, 10),
(11, '2024-07-25', '2024-08-08', 'Expired',   11, 11, 11);

-- ============================================================
-- INSERT: Returns
-- ============================================================
INSERT IGNORE INTO Returns (ReturnID, ReturnDate, Reason, Notes, Status, OrderItemID, EmployeeID) VALUES
(1,  '2024-07-03', 'Damaged',         'Customer reported that the book arrived with a torn cover and several water-damaged pages. Replacement was issued and damaged copy was pulled from inventory.',                                          'Completed', 1,  1),
(2,  '2024-07-05', 'Wrong Item',      'Customer received a copy of Cliffs of Connemara instead of the ordered title The Cartographer''s Secret. Correct book was located in store and exchanged immediately.',                               'Completed', 2,  2),
(3,  '2024-07-07', 'Changed Mind',    'Customer decided they were no longer interested in Roots of Gold after reading the first chapter. Return was accepted within the 7-day return window and a store credit was issued.',                 'Approved',  3,  3),
(4,  '2024-07-10', 'Duplicate Order', 'Customer accidentally placed two separate orders for Beneath the Agave Moon on the same day. Second order was identified as a duplicate and fully refunded upon return of the unopened copy.',        'Completed', 4,  4),
(5,  '2024-07-12', 'Damaged',         'Spine of The Lavender District was cracked and pages were loose upon opening the package. Customer provided photos as evidence. Full refund was processed and item was removed from active inventory.','Completed', 5,  5),
(6,  '2024-07-14', 'Other',           'Customer stated the book Storm of Cherry Blossoms did not match the online description and felt misrepresented. Manager reviewed the complaint and approved a partial store credit as resolution.',    'Approved',  6,  6),
(7,  '2024-07-17', 'Wrong Item',      'Customer ordered The Saffron Path but received A Garden in Devonshire instead. Inventory discrepancy was logged and reported to the Inventory Specialist. Correct title was shipped same day.',       'Completed', 7,  7),
(8,  '2024-07-19', 'Changed Mind',    'Customer purchased Cliffs of Connemara as a gift but recipient already owned a copy. Return was processed within the allowed return period. Original payment method was refunded in full.',           'Completed', 8,  8),
(9,  '2024-07-21', 'Damaged',         'Customer found Shadows Over Seville had missing pages between chapters 4 and 7. Defective copy was quarantined and sent back to publisher for review. Customer was offered a replacement or refund.', 'Pending',   9,  9),
(10, '2024-07-23', 'Duplicate Order', 'Customer''s online session timed out mid-checkout causing a duplicate charge for The Lagos Chronicles. Both transactions were verified and the duplicate payment was reversed promptly.',              'Completed', 10, 10),
(11, '2024-07-26', 'Other',           'Customer reported that A Garden in Devonshire contained a printing error where pages 45 through 60 were repeated twice and pages 61 through 75 were missing entirely. Publisher was notified.',       'Pending',   11, 11);

-- ============================================================
-- Verify All Tables
-- ============================================================
SELECT * FROM Locations;
SELECT * FROM Stores;
SELECT * FROM Employees;
SELECT * FROM Customers;
SELECT * FROM Publishers;
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Book_Authors;
SELECT * FROM Inventory;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Payments;
SELECT * FROM Reservations;
SELECT * FROM Returns;