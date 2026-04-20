USE pendragon_bookstore;
SELECT * FROM order_items; 
-- ============================================================
-- Pendragon Bookstore Database
-- Additional 20 Sample Records Per Table
-- ============================================================
USE pendragon_bookstore;

-- ============================================================
-- INSERT: Locations (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Locations (ZipCode, City, State) VALUES
('30002', 'Avondale Estates', 'Georgia'),
('30004', 'Alpharetta',       'Georgia'),
('30005', 'Alpharetta',       'Georgia'),
('30008', 'Marietta',         'Georgia'),
('30009', 'Alpharetta',       'Georgia'),
('30012', 'Conyers',          'Georgia'),
('30013', 'Conyers',          'Georgia'),
('30016', 'Covington',        'Georgia'),
('30017', 'Grayson',          'Georgia'),
('30019', 'Dacula',           'Georgia'),
('30021', 'Clarkston',        'Georgia'),
('30022', 'Alpharetta',       'Georgia'),
('30024', 'Suwanee',          'Georgia'),
('30025', 'Social Circle',    'Georgia'),
('30028', 'Cumming',          'Georgia'),
('30030', 'Decatur',          'Georgia'),
('30032', 'Decatur',          'Georgia'),
('30033', 'Decatur',          'Georgia'),
('30034', 'Decatur',          'Georgia'),
('30035', 'Decatur',          'Georgia');

-- ============================================================
-- INSERT: Stores (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Stores (StoreID, StoreName, PhoneNumber, Email, Street, ZipCode) VALUES
(12, 'Pendragon Bookstore', '(470) 100-2012', 'avondale@pendragon.com',      '12 Estate Dr',           '30002'),
(13, 'Pendragon Bookstore', '(470) 100-2013', 'alpharetta1@pendragon.com',   '13 Windward Pkwy',       '30004'),
(14, 'Pendragon Bookstore', '(470) 100-2014', 'alpharetta2@pendragon.com',   '14 Haynes Bridge Rd',    '30005'),
(15, 'Pendragon Bookstore', '(470) 100-2015', 'marietta@pendragon.com',      '15 Whitlock Ave',        '30008'),
(16, 'Pendragon Bookstore', '(470) 100-2016', 'alpharetta3@pendragon.com',   '16 Old Milton Pkwy',     '30009'),
(17, 'Pendragon Bookstore', '(470) 100-2017', 'conyers1@pendragon.com',      '17 Main St NE',          '30012'),
(18, 'Pendragon Bookstore', '(470) 100-2018', 'conyers2@pendragon.com',      '18 Flat Shoals Rd',      '30013'),
(19, 'Pendragon Bookstore', '(470) 100-2019', 'covington@pendragon.com',     '19 Floyd St NE',         '30016'),
(20, 'Pendragon Bookstore', '(470) 100-2020', 'grayson@pendragon.com',       '20 Grayson Pkwy',        '30017'),
(21, 'Pendragon Bookstore', '(470) 100-2021', 'dacula@pendragon.com',        '21 Fence Rd',            '30019'),
(22, 'Pendragon Bookstore', '(470) 100-2022', 'clarkston@pendragon.com',     '22 Church St',           '30021'),
(23, 'Pendragon Bookstore', '(470) 100-2023', 'alpharetta4@pendragon.com',   '23 Westside Pkwy',       '30022'),
(24, 'Pendragon Bookstore', '(470) 100-2024', 'suwanee@pendragon.com',       '24 Suwanee Dam Rd',      '30024'),
(25, 'Pendragon Bookstore', '(470) 100-2025', 'socialcircle@pendragon.com',  '25 Social Circle Hwy',   '30025'),
(26, 'Pendragon Bookstore', '(470) 100-2026', 'cumming@pendragon.com',       '26 Market Place Blvd',   '30028'),
(27, 'Pendragon Bookstore', '(470) 100-2027', 'decatur1@pendragon.com',      '27 Ponce De Leon Ave',   '30030'),
(28, 'Pendragon Bookstore', '(470) 100-2028', 'decatur2@pendragon.com',      '28 Candler Rd',          '30032'),
(29, 'Pendragon Bookstore', '(470) 100-2029', 'decatur3@pendragon.com',      '29 Lavista Rd',          '30033'),
(30, 'Pendragon Bookstore', '(470) 100-2030', 'decatur4@pendragon.com',      '30 Glenwood Ave',        '30034'),
(31, 'Pendragon Bookstore', '(470) 100-2031', 'decatur5@pendragon.com',      '31 Panthersville Rd',    '30035');

-- ============================================================
-- INSERT: Customers (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Street, ZipCode, JoinDate, MembershipType, Status, StoreID) VALUES
(12, 'Naomi',    'Fletcher',   'naomi.fletcher@gmail.com',    '470-201-3012', '12 Magnolia Ct',        '30002', '2024-07-05', 'Standard', 'Active',    12),
(13, 'Samuel',   'Adeyemi',    'samuel.adeyemi@yahoo.com',    '470-201-3013', '13 Windward Way',       '30004', '2024-07-08', 'Premium',  'Active',    13),
(14, 'Chloe',    'Harrington', 'chloe.harrington@gmail.com',  '470-201-3014', '14 Haynes Mill Rd',     '30005', '2024-07-10', 'Student',  'Active',    14),
(15, 'Darius',   'Monroe',     'darius.monroe@outlook.com',   '470-201-3015', '15 Whitlock Ct',        '30008', '2024-07-12', 'Standard', 'Active',    15),
(16, 'Isabelle', 'Tremblay',   'isabelle.tremblay@gmail.com', '470-201-3016', '16 Old Milton Ln',      '30009', '2024-07-15', 'Senior',   'Active',    16),
(17, 'Kwame',    'Asare',      'kwame.asare@yahoo.com',       '470-201-3017', '17 Main St NW',         '30012', '2024-07-18', 'Standard', 'Active',    17),
(18, 'Valentina','Cruz',       'valentina.cruz@gmail.com',    '470-201-3018', '18 Flat Shoals Ct',     '30013', '2024-07-20', 'Premium',  'Active',    18),
(19, 'Oliver',   'Bennett',    'oliver.bennett@outlook.com',  '470-201-3019', '19 Floyd St SW',        '30016', '2024-07-22', 'Standard', 'Inactive',  19),
(20, 'Zara',     'Osei',       'zara.osei@gmail.com',         '470-201-3020', '20 Grayson Way',        '30017', '2024-07-25', 'Student',  'Active',    20),
(21, 'Ethan',    'Calloway',   'ethan.calloway@yahoo.com',    '470-201-3021', '21 Fence Ct',           '30019', '2024-07-28', 'Standard', 'Active',    21),
(22, 'Amina',    'Diallo',     'amina.diallo@gmail.com',      '470-201-3022', '22 Church Ave',         '30021', '2024-08-01', 'Premium',  'Active',    22),
(23, 'Preston',  'Vaughn',     'preston.vaughn@outlook.com',  '470-201-3023', '23 Westside Way',       '30022', '2024-08-03', 'Senior',   'Active',    23),
(24, 'Nadia',    'Petrov',     'nadia.petrov@gmail.com',      '470-201-3024', '24 Suwanee Creek Rd',   '30024', '2024-08-05', 'Standard', 'Active',    24),
(25, 'Tobias',   'Eriksson',   'tobias.eriksson@yahoo.com',   '470-201-3025', '25 Social Circle Ln',   '30025', '2024-08-08', 'Student',  'Suspended', 25),
(26, 'Lena',     'Hoffman',    'lena.hoffman@gmail.com',      '470-201-3026', '26 Market Place Dr',    '30028', '2024-08-10', 'Premium',  'Active',    26),
(27, 'Jerome',   'Winters',    'jerome.winters@outlook.com',  '470-201-3027', '27 Ponce De Leon Ct',   '30030', '2024-08-12', 'Standard', 'Active',    27),
(28, 'Fatou',    'Diop',       'fatou.diop@gmail.com',        '470-201-3028', '28 Candler Ct',         '30032', '2024-08-15', 'Senior',   'Active',    28),
(29, 'Hiroshi',  'Tanaka',     'hiroshi.tanaka@yahoo.com',    '470-201-3029', '29 Lavista Ct',         '30033', '2024-08-18', 'Standard', 'Active',    29),
(30, 'Simone',   'Moreau',     'simone.moreau@gmail.com',     '470-201-3030', '30 Glenwood Ct',        '30034', '2024-08-20', 'Premium',  'Active',    30),
(31, 'Kolade',   'Adebayo',    'kolade.adebayo@outlook.com',  '470-201-3031', '31 Panthersville Ct',   '30035', '2024-08-22', 'Standard', 'Active',    31);

-- ============================================================
-- INSERT: Publishers (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Publishers (PublisherID, PublisherName, Country, Website) VALUES
(12, 'Blue Ridge Press',        'United States', 'www.blueridgepress.com'),
(13, 'Aurora Publishing',       'Canada',        'www.aurorapublishing.ca'),
(14, 'Nile Literary House',     'Egypt',         'www.nileliterary.eg'),
(15, 'Pacific Rim Books',       'Australia',     'www.pacificrimbooks.au'),
(16, 'Nordic Tales Press',      'Sweden',        'www.nordictalespres.se'),
(17, 'Serengeti Publishing',    'Kenya',         'www.serengetipub.ke'),
(18, 'Andean Literary Group',   'Peru',          'www.andeanliterary.pe'),
(19, 'Crimson Quill Press',     'United States', 'www.crimsonquill.com'),
(20, 'Lotus Books',             'China',         'www.lotusbooks.cn'),
(21, 'Emerald Isle Publishing', 'Ireland',       'www.emeraldislepub.ie'),
(22, 'Sahel Books',             'Senegal',       'www.sahelbooks.sn'),
(23, 'Alpine Press',            'Switzerland',   'www.alpinepress.ch'),
(24, 'Crescent Publishing',     'Turkey',        'www.crescentpub.tr'),
(25, 'Rainforest Books',        'Brazil',        'www.rainforestbooks.br'),
(26, 'Midnight Sun Press',      'Norway',        'www.midnightsunpress.no'),
(27, 'Ivory Tower Books',       'United Kingdom','www.ivorytowerbooks.co.uk'),
(28, 'Bamboo Literary Works',   'Japan',         'www.bambooliterary.jp'),
(29, 'Savanna Press',           'South Africa',  'www.savannapress.za'),
(30, 'Archipelago Publishing',  'Philippines',   'www.archipelagopub.ph'),
(31, 'Prairie Wind Books',      'Canada',        'www.prairiewindbooks.ca');

-- ============================================================
-- INSERT: Authors (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Authors (AuthorID, FirstName, LastName, Nationality, BirthDate) VALUES
(12, 'Yusuf',     'Abara',       'Nigerian',          '1980-04-22'),
(13, 'Celeste',   'Dupont',      'French',            '1975-08-14'),
(14, 'Ravi',      'Krishnan',    'Indian',            '1988-02-09'),
(15, 'Ingrid',    'Lindqvist',   'Swedish',           '1993-06-17'),
(16, 'Kwabena',   'Mensah',      'Ghanaian',          '1970-11-30'),
(17, 'Rosa',      'Delgado',     'Argentine',         '1985-03-25'),
(18, 'Jin',       'Wei',         'Chinese',           '1991-07-12'),
(19, 'Adeola',    'Fashola',     'Nigerian',          '1978-09-05'),
(20, 'Miriam',    'Goldstein',   'Israeli',           '1983-01-18'),
(21, 'Aleksei',   'Volkov',      'Russian',           '1967-05-22'),
(22, 'Fatimah',   'Hassan',      'Somali',            '1996-10-08'),
(23, 'Lukas',     'Bauer',       'German',            '1974-12-14'),
(24, 'Aisha',     'Kamara',      'Sierra Leonean',    '1989-04-03'),
(25, 'Hiroto',    'Yamamoto',    'Japanese',          '1982-08-27'),
(26, 'Siobhan',   'O''Sullivan', 'Irish',             '1971-02-19'),
(27, 'Emmanuel',  'Nwosu',       'Nigerian',          '1994-06-11'),
(28, 'Freya',     'Hansen',      'Danish',            '1986-09-29'),
(29, 'Alejandro', 'Reyes',       'Colombian',         '1977-03-16'),
(30, 'Yuki',      'Fujimoto',    'Japanese',          '1990-11-04'),
(31, 'Adaeze',    'Okonkwo',     'Nigerian',          '1998-07-23');

-- ============================================================
-- INSERT: Books (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Books (BookID, ISBN, Title, Genre, PublishedYear, Edition, Language, RetailPrice, PublisherID) VALUES
(12, '978-1-001-00012-2', 'The River Speaks',            'Fiction',     2019, '1st', 'English', 18.99, 12),
(13, '978-1-001-00013-3', 'Northern Lights Within',      'Self-Help',   2021, '1st', 'French',  20.99, 13),
(14, '978-1-001-00014-4', 'Sands of Alexandria',         'History',     2017, '2nd', 'English', 25.99, 14),
(15, '978-1-001-00015-5', 'Beyond the Coral Sea',        'Fiction',     2022, '1st', 'English', 17.99, 15),
(16, '978-1-001-00016-6', 'The Midnight Forest',         'Fantasy',     2018, '3rd', 'English', 21.99, 16),
(17, '978-1-001-00017-7', 'Whispers of the Savanna',     'Non-Fiction', 2020, '1st', 'English', 19.99, 17),
(18, '978-1-001-00018-8', 'Echoes of Machu Picchu',      'History',     2016, '2nd', 'Spanish', 23.99, 18),
(19, '978-1-001-00019-9', 'The Crimson Compass',         'Mystery',     2023, '1st', 'English', 15.99, 19),
(20, '978-1-001-00020-0', 'Lotus and Thunder',           'Romance',     2021, '1st', 'English', 14.99, 20),
(21, '978-1-001-00021-1', 'Fields of Connemara',         'Biography',   2019, '1st', 'English', 22.99, 21),
(22, '978-1-001-00022-2', 'The Sahel Chronicles',        'Non-Fiction', 2018, '2nd', 'English', 24.99, 22),
(23, '978-1-001-00023-3', 'Alpine Secrets',              'Mystery',     2020, '1st', 'German',  16.99, 23),
(24, '978-1-001-00024-4', 'Crescent and Star',           'Romance',     2022, '1st', 'English', 18.99, 24),
(25, '978-1-001-00025-5', 'Roots of the Amazon',         'Science',     2017, '1st', 'English', 27.99, 25),
(26, '978-1-001-00026-6', 'The Frozen Horizon',          'Fiction',     2021, '2nd', 'English', 19.99, 26),
(27, '978-1-001-00027-7', 'Towers of Learning',          'Reference',   2015, '3rd', 'English', 34.99, 27),
(28, '978-1-001-00028-8', 'Bamboo and Silk',             'Poetry',      2023, '1st', 'English', 13.99, 28),
(29, '978-1-001-00029-9', 'The Cape of Storms',          'Horror',      2020, '1st', 'English', 16.99, 29),
(30, '978-1-001-00030-0', 'Islands of the Morning',      'Fiction',     2022, '1st', 'English', 21.99, 30),
(31, '978-1-001-00031-1', 'Children of the Harmattan',   'Children',    2019, '2nd', 'English', 12.99, 31);

-- ============================================================
-- INSERT: Book_Authors (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Book_Authors (BookID, AuthorID) VALUES
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31);

-- ============================================================
-- INSERT: Inventory (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Inventory (InventoryID, BookID, StoreID, QuantityOnHand, ReorderLevel) VALUES
(12, 12, 12, 20, 5),
(13, 13, 13, 15, 5),
(14, 14, 14, 30, 5),
(15, 15, 15, 10, 5),
(16, 16, 16, 25, 5),
(17, 17, 17,  8, 5),
(18, 18, 18, 18, 5),
(19, 19, 19, 35, 5),
(20, 20, 20, 12, 5),
(21, 21, 21, 22, 5),
(22, 22, 22,  6, 5),
(23, 23, 23, 28, 5),
(24, 24, 24, 14, 5),
(25, 25, 25, 32, 5),
(26, 26, 26, 19, 5),
(27, 27, 27,  9, 5),
(28, 28, 28, 24, 5),
(29, 29, 29, 16, 5),
(30, 30, 30, 27, 5),
(31, 31, 31, 11, 5);

-- ============================================================
-- INSERT: Orders (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Orders (OrderID, OrderDate, Status, CustomerID, StoreID, EmployeeID) VALUES
(12, '2024-08-01', 'Completed', 12, 12, 1),
(13, '2024-08-03', 'Completed', 13, 13, 2),
(14, '2024-08-05', 'Pending',   14, 14, 3),
(15, '2024-08-07', 'Completed', 15, 15, 4),
(16, '2024-08-09', 'Cancelled', 16, 16, 5),
(17, '2024-08-11', 'Completed', 17, 17, 6),
(18, '2024-08-13', 'Refunded',  18, 18, 7),
(19, '2024-08-15', 'Completed', 19, 19, 8),
(20, '2024-08-17', 'Pending',   20, 20, 9),
(21, '2024-08-19', 'Completed', 21, 21, 10),
(22, '2024-08-21', 'Completed', 22, 22, 11),
(23, '2024-08-23', 'Cancelled', 23, 23, 1),
(24, '2024-08-25', 'Completed', 24, 24, 2),
(25, '2024-08-27', 'Refunded',  25, 25, 3),
(26, '2024-08-29', 'Completed', 26, 26, 4),
(27, '2024-09-01', 'Pending',   27, 27, 5),
(28, '2024-09-03', 'Completed', 28, 28, 6),
(29, '2024-09-05', 'Completed', 29, 29, 7),
(30, '2024-09-07', 'Cancelled', 30, 30, 8),
(31, '2024-09-09', 'Completed', 31, 31, 9);

-- ============================================================
-- INSERT: Order_Items (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Order_Items (OrderItemID, Quantity, UnitPrice, Discount, OrderID, BookID) VALUES
(12, 2, 18.99,  0.00, 12, 12),
(13, 1, 20.99,  5.00, 13, 13),
(14, 3, 25.99, 10.00, 14, 14),
(15, 1, 17.99,  0.00, 15, 15),
(16, 2, 21.99,  5.00, 16, 16),
(17, 4, 19.99, 15.00, 17, 17),
(18, 1, 23.99,  0.00, 18, 18),
(19, 2, 15.99,  5.00, 19, 19),
(20, 3, 14.99, 10.00, 20, 20),
(21, 1, 22.99,  0.00, 21, 21),
(22, 2, 24.99,  5.00, 22, 22),
(23, 1, 16.99,  0.00, 23, 23),
(24, 3, 18.99, 10.00, 24, 24),
(25, 2, 27.99,  5.00, 25, 25),
(26, 1, 19.99,  0.00, 26, 26),
(27, 4, 34.99, 15.00, 27, 27),
(28, 2, 13.99,  5.00, 28, 28),
(29, 1, 16.99,  0.00, 29, 29),
(30, 3, 21.99, 10.00, 30, 30),
(31, 2, 12.99,  5.00, 31, 31);

-- ============================================================
-- INSERT: Payments (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Payments (PaymentID, PaymentDate, PaymentMethod, AmountPaid, PaymentConfirmation, Status, OrderID) VALUES
(12, '2024-08-01', 'Credit Card', 37.98,  'CONF-PEN-10012', 'Paid',     12),
(13, '2024-08-03', 'Venmo',       19.94,  'CONF-PEN-10013', 'Paid',     13),
(14, '2024-08-05', 'Debit Card',  70.17,  'CONF-PEN-10014', 'Pending',  14),
(15, '2024-08-07', 'Cash',        17.99,  'CONF-PEN-10015', 'Paid',     15),
(16, '2024-08-09', 'Zelle',       41.78,  'CONF-PEN-10016', 'Refunded', 16),
(17, '2024-08-11', 'PayPal',      67.97,  'CONF-PEN-10017', 'Paid',     17),
(18, '2024-08-13', 'Credit Card', 23.99,  'CONF-PEN-10018', 'Refunded', 18),
(19, '2024-08-15', 'Debit Card',  30.38,  'CONF-PEN-10019', 'Paid',     19),
(20, '2024-08-17', 'Cash',        40.47,  'CONF-PEN-10020', 'Pending',  20),
(21, '2024-08-19', 'Check',       22.99,  'CONF-PEN-10021', 'Paid',     21),
(22, '2024-08-21', 'Venmo',       47.48,  'CONF-PEN-10022', 'Paid',     22),
(23, '2024-08-23', 'Zelle',       16.99,  'CONF-PEN-10023', 'Refunded', 23),
(24, '2024-08-25', 'Credit Card', 51.27,  'CONF-PEN-10024', 'Paid',     24),
(25, '2024-08-27', 'PayPal',      53.18,  'CONF-PEN-10025', 'Refunded', 25),
(26, '2024-08-29', 'Debit Card',  19.99,  'CONF-PEN-10026', 'Paid',     26),
(27, '2024-09-01', 'Cash',       118.97,  'CONF-PEN-10027', 'Pending',  27),
(28, '2024-09-03', 'Venmo',       26.58,  'CONF-PEN-10028', 'Paid',     28),
(29, '2024-09-05', 'Credit Card', 16.99,  'CONF-PEN-10029', 'Paid',     29),
(30, '2024-09-07', 'Check',       59.37,  'CONF-PEN-10030', 'Refunded', 30),
(31, '2024-09-09', 'Debit Card',  24.68,  'CONF-PEN-10031', 'Paid',     31);

-- ============================================================
-- INSERT: Reservations (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Reservations (ReservationID, ReservationDate, ExpiryDate, Status, CustomerID, BookID, StoreID) VALUES
(12, '2024-08-01', '2024-08-15', 'Fulfilled', 12, 12, 12),
(13, '2024-08-03', '2024-08-17', 'Pending',   13, 13, 13),
(14, '2024-08-05', '2024-08-19', 'Ready',     14, 14, 14),
(15, '2024-08-07', '2024-08-21', 'Cancelled', 15, 15, 15),
(16, '2024-08-09', '2024-08-23', 'Fulfilled', 16, 16, 16),
(17, '2024-08-11', '2024-08-25', 'Expired',   17, 17, 17),
(18, '2024-08-13', '2024-08-27', 'Pending',   18, 18, 18),
(19, '2024-08-15', '2024-08-29', 'Ready',     19, 19, 19),
(20, '2024-08-17', '2024-08-31', 'Fulfilled', 20, 20, 20),
(21, '2024-08-19', '2024-09-02', 'Cancelled', 21, 21, 21),
(22, '2024-08-21', '2024-09-04', 'Expired',   22, 22, 22),
(23, '2024-08-23', '2024-09-06', 'Pending',   23, 23, 23),
(24, '2024-08-25', '2024-09-08', 'Ready',     24, 24, 24),
(25, '2024-08-27', '2024-09-10', 'Fulfilled', 25, 25, 25),
(26, '2024-08-29', '2024-09-12', 'Cancelled', 26, 26, 26),
(27, '2024-09-01', '2024-09-15', 'Expired',   27, 27, 27),
(28, '2024-09-03', '2024-09-17', 'Pending',   28, 28, 28),
(29, '2024-09-05', '2024-09-19', 'Ready',     29, 29, 29),
(30, '2024-09-07', '2024-09-21', 'Fulfilled', 30, 30, 30),
(31, '2024-09-09', '2024-09-23', 'Cancelled', 31, 31, 31);

-- ============================================================
-- INSERT: Returns (Records 12-31)
-- ============================================================
INSERT IGNORE INTO Returns (ReturnID, ReturnDate, Reason, Notes, Status, OrderItemID, EmployeeID) VALUES
(12, '2024-08-03', 'Damaged',         'Customer reported The River Speaks arrived with a broken spine and torn pages throughout. Item was quarantined and a full replacement was issued from store inventory.',                                                          'Completed', 12, 1),
(13, '2024-08-05', 'Changed Mind',    'Customer purchased Northern Lights Within as a birthday gift but recipient already owned the title. Return was accepted within the 7-day window and store credit was issued to the customer''s account.',                         'Approved',  13, 2),
(14, '2024-08-07', 'Wrong Item',      'Customer ordered Sands of Alexandria but received Beyond the Coral Sea in its place. Shipping label mix-up was identified and logged. Correct title was dispatched same day with an apology note.',                              'Completed', 14, 3),
(15, '2024-08-09', 'Duplicate Order', 'Customer''s browser refreshed during checkout resulting in a duplicate purchase of The Midnight Forest. Second charge was confirmed and reversed. Duplicate copy was returned unopened and restocked.',                           'Completed', 15, 4),
(16, '2024-08-11', 'Damaged',         'Whispers of the Savanna was received with significant water damage rendering it unreadable. Customer submitted photos confirming the damage. Full refund was issued and item was flagged for supplier review.',                    'Completed', 16, 5),
(17, '2024-08-13', 'Other',           'Customer felt Echoes of Machu Picchu was significantly shorter than advertised and did not meet expectations. After manager review a partial store credit was issued as a goodwill gesture while the book was retained.',         'Approved',  17, 6),
(18, '2024-08-15', 'Wrong Item',      'Customer received The Crimson Compass instead of the ordered Lotus and Thunder. Inventory mismatch was escalated to the Inventory Specialist for audit. Customer received the correct title within 24 hours.',                    'Completed', 18, 7),
(19, '2024-08-17', 'Changed Mind',    'Customer decided Fields of Connemara was not the genre they expected based on the cover description. Return was processed within policy window. Full refund was applied to the original debit card on file.',                     'Completed', 19, 8),
(20, '2024-08-19', 'Damaged',         'The Sahel Chronicles was delivered with a deeply creased cover and highlighted text throughout suggesting a used copy was shipped in error. Full replacement of a new copy was provided and vendor was notified.',                'Pending',   20, 9),
(21, '2024-08-21', 'Duplicate Order', 'Customer placed two orders for Alpine Secrets within minutes due to a slow page load. Both orders were fulfilled before the duplicate was flagged. One copy was returned and payment reversed without issue.',                    'Completed', 21, 10),
(22, '2024-08-23', 'Other',           'Customer reported that Crescent and Star contained several chapters out of sequence due to a printing error. Publisher was contacted and acknowledged the defect. Customer received a corrected edition free of charge.',         'Approved',  22, 11),
(23, '2024-08-25', 'Damaged',         'Roots of the Amazon arrived with the cover completely detached and several interior pages missing. Customer was frustrated as the book was intended as a school resource. Replacement was expedited and apology was issued.',      'Completed', 23, 1),
(24, '2024-08-27', 'Changed Mind',    'Customer bought The Frozen Horizon on impulse but decided the subject matter was not of interest after reading the synopsis inside. Return was accepted and store credit was applied toward a future purchase.',                   'Approved',  24, 2),
(25, '2024-08-29', 'Wrong Item',      'Customer ordered Towers of Learning but received Bamboo and Silk instead. The mix-up was traced to a mislabeled shelf in the stockroom. Correct title was located and provided to the customer with a 10 percent discount.',     'Completed', 25, 3),
(26, '2024-09-01', 'Duplicate Order', 'Customer accidentally submitted two orders for The Cape of Storms after receiving an error message that did not confirm the first order. Duplicate was identified and refunded. Customer was satisfied with the resolution.',     'Completed', 26, 4),
(27, '2024-09-03', 'Damaged',         'Islands of the Morning was delivered in a crushed package causing significant damage to the hardcover and binding. Customer provided unboxing video as evidence. Full refund issued and shipping carrier was notified.',           'Pending',   27, 5),
(28, '2024-09-05', 'Other',           'Customer reported Children of the Harmattan contained inappropriate content on page 112 inconsistent with the children''s genre classification. Matter was escalated to management and the publisher was formally notified.',     'Pending',   28, 6),
(29, '2024-09-07', 'Wrong Item',      'Customer received The River Speaks instead of the ordered The Sahel Chronicles. Error was attributed to a barcode scanning mistake at the packing station. Correct book was shipped priority and an apology discount was offered.','Completed', 29, 7),
(30, '2024-09-09', 'Changed Mind',    'Customer purchased Northern Lights Within for personal development but found the content did not align with their specific goals. Return was accepted and full store credit was issued for use on any future Pendragon purchase.',  'Approved',  30, 8),
(31, '2024-09-11', 'Duplicate Order', 'Customer''s payment app submitted a duplicate transaction for Sands of Alexandria during a brief network outage. Finance team confirmed the double charge and reversed the second transaction within one business day.',           'Completed', 31, 9);
SELECT * FROM authors;
SELECT * FROM book_authors; 
SELECT * FROM books;
SELECT * FROM customers; 
SELECT * FROM employees; 
SELECT * FROM inventory;
SELECT * FROM locations;
SELECT * FROM order_items; 
SELECT * FROM orders; 
SELECT * FROM payments; 
SELECT * FROM publishers; 
SELECT * FROM reservations; 
SELECT * FROM returns; 
SELECT * FROM stores; 