-- ============================================================
-- Pendragon Bookstore Database
-- Full Update: All Tables Reflecting 61 Authors
-- Platform: MySQL
-- ============================================================

USE pendragon_bookstore;

-- ============================================================
-- STEP 1: Insert Additional Publishers (IDs 12–20)
-- Needed to support new books
-- ============================================================
INSERT IGNORE INTO Publishers (PublisherID, PublisherName, Country, Website) VALUES
(12, 'Crossroads Literary',      'United States', 'www.crossroadsliterary.com'),
(13, 'Tundra House Press',       'Canada',        'www.tundrahousepress.ca'),
(14, 'Baobab & Birch',           'Kenya',         'www.baobabandbirch.co.ke'),
(15, 'Solstice Publishing',      'Australia',     'www.solsticepublishing.au'),
(16, 'Meridian Books',           'South Africa',  'www.meridianbooks.co.za'),
(17, 'Sakura Ink',               'Japan',         'www.sakuraink.jp'),
(18, 'Olive & Papyrus Press',    'Greece',        'www.olivepapyrus.gr'),
(19, 'Andean Ink',               'Peru',          'www.andeanink.pe'),
(20, 'Fjord Literary House',     'Norway',        'www.fjordliterary.no');

-- ============================================================
-- STEP 2: Insert Additional Books (IDs 12–61)
-- One book per new author, diverse genres and languages
-- ============================================================
INSERT IGNORE INTO Books (BookID, ISBN, Title, Genre, PublishedYear, Edition, Language, RetailPrice, PublisherID) VALUES
(12, '978-1-001-00012-2', 'The Cork and the Tide',             'Fiction',     2019, '1st', 'English', 18.99, 12),
(13, '978-1-001-00013-3', 'Drift Without Anchor',              'Fiction',     2021, '1st', 'English', 21.99, 13),
(14, '978-1-001-00014-4', 'The Vermillion Accord',             'Mystery',     2018, '1st', 'English', 16.99, 14),
(15, '978-1-001-00015-5', 'Pale Roads to Fenwick',             'History',     2020, '2nd', 'English', 23.99, 15),
(16, '978-1-001-00016-6', 'Between Dust and Longitude',        'Non-Fiction', 2017, '1st', 'English', 19.99, 16),
(17, '978-1-001-00017-7', 'The Lantern Fisherman',             'Fiction',     2022, '1st', 'English', 20.99, 12),
(18, '978-1-001-00018-8', 'Salt and Inheritance',              'Biography',   2020, '1st', 'English', 24.99, 13),
(19, '978-1-001-00019-9', 'The Amber Cartography',             'Fantasy',     2023, '1st', 'English', 17.99, 14),
(20, '978-1-001-00020-0', 'What the Monsoon Leaves Behind',    'Fiction',     2021, '1st', 'English', 22.99, 15),
(21, '978-1-001-00021-1', 'Seventeen Silences',                'Mystery',     2019, '1st', 'English', 15.99, 16),
(22, '978-1-001-00022-2', 'The Cartographer of Lost Seasons',  'Fiction',     2020, '1st', 'English', 18.99, 17),
(23, '978-1-001-00023-3', 'Borrowed Sun',                      'Romance',     2022, '1st', 'English', 16.99, 18),
(24, '978-1-001-00024-4', 'The Red Bridge Letters',            'History',     2018, '1st', 'English', 21.99, 19),
(25, '978-1-001-00025-5', 'Unmapped',                          'Self-Help',   2021, '1st', 'English', 19.99, 20),
(26, '978-1-001-00026-6', 'The Weight of Open Water',          'Fiction',     2023, '1st', 'English', 17.99, 12),
(27, '978-1-001-00027-7', 'Mirrors in the Fog',                'Horror',      2019, '1st', 'English', 14.99, 13),
(28, '978-1-001-00028-8', 'The Final Garden',                  'Romance',     2022, '2nd', 'English', 20.99, 14),
(29, '978-1-001-00029-9', 'Echoes from the Pearl River',       'Fiction',     2020, '1st', 'English', 23.99, 15),
(30, '978-1-001-00030-0', 'A Thousand Small Departures',       'Biography',   2018, '1st', 'English', 18.99, 16),
(31, '978-1-001-00031-1', 'Where the Tulips Fell',             'Fiction',     2021, '1st', 'English', 16.99, 17),
(32, '978-1-001-00032-2', 'The Havana Frequency',              'Mystery',     2019, '1st', 'English', 15.99, 18),
(33, '978-1-001-00033-3', 'Children of the Caatinga',          'Fiction',     2022, '1st', 'English', 22.99, 19),
(34, '978-1-001-00034-4', 'Glacier Song',                      'Poetry',      2020, '1st', 'English', 13.99, 20),
(35, '978-1-001-00035-5', 'The Ceiba and the Storm',           'Fiction',     2023, '1st', 'English', 19.99, 12),
(36, '978-1-001-00036-6', 'Unfinished Atlas',                  'Non-Fiction', 2021, '1st', 'English', 21.99, 13),
(37, '978-1-001-00037-7', 'The Bogotá Inheritance',            'Mystery',     2018, '1st', 'English', 16.99, 14),
(38, '978-1-001-00038-8', 'Roots in the Pampas',               'Biography',   2020, '1st', 'English', 24.99, 15),
(39, '978-1-001-00039-9', 'The Port-au-Prince Journals',       'History',     2022, '1st', 'English', 20.99, 16),
(40, '978-1-001-00040-0', 'Dust Over Oaxaca',                  'Fiction',     2019, '1st', 'English', 17.99, 17),
(41, '978-1-001-00041-1', 'The Long Road from Santiago',       'Fiction',     2021, '1st', 'English', 18.99, 18),
(42, '978-1-001-00042-2', 'The Algiers Manuscript',            'Mystery',     2020, '1st', 'English', 15.99, 19),
(43, '978-1-001-00043-3', 'Sand and Silence',                  'Fiction',     2018, '1st', 'English', 21.99, 20),
(44, '978-1-001-00044-4', 'The Cedar House',                   'Fiction',     2022, '1st', 'English', 19.99, 12),
(45, '978-1-001-00045-5', 'Threads of the Old City',           'History',     2021, '1st', 'English', 23.99, 13),
(46, '978-1-001-00046-6', 'The Nile in Winter',                'Fiction',     2019, '1st', 'English', 16.99, 14),
(47, '978-1-001-00047-7', 'Beyond the Qanat',                  'Fantasy',     2023, '1st', 'English', 20.99, 15),
(48, '978-1-001-00048-8', 'The Amman Letters',                 'Romance',     2020, '1st', 'English', 17.99, 16),
(49, '978-1-001-00049-9', 'Desert Glass',                      'Fiction',     2022, '1st', 'English', 18.99, 17),
(50, '978-1-001-00050-0', 'The Hour of the Muezzin',           'Fiction',     2021, '1st', 'English', 22.99, 18),
(51, '978-1-001-00051-1', 'Between Mecca and Montmartre',      'Fiction',     2018, '1st', 'English', 19.99, 19),
(52, '978-1-001-00052-2', 'The Tangi and the Tide',            'Fiction',     2022, '1st', 'English', 21.99, 20),
(53, '978-1-001-00053-3', 'Where the Kauri Grow',              'Fiction',     2020, '1st', 'English', 17.99, 12),
(54, '978-1-001-00054-4', 'Lava and Latitude',                 'Non-Fiction', 2019, '1st', 'English', 23.99, 13),
(55, '978-1-001-00055-5', 'The Blue Lagoon Letters',           'Romance',     2021, '1st', 'English', 16.99, 14),
(56, '978-1-001-00056-6', 'Harmattan Season',                  'Fiction',     2023, '1st', 'English', 20.99, 15),
(57, '978-1-001-00057-7', 'The Obi Crossing',                  'Fiction',     2019, '1st', 'English', 18.99, 16),
(58, '978-1-001-00058-8', 'Highveld Hymns',                    'Poetry',      2020, '1st', 'English', 14.99, 17),
(59, '978-1-001-00059-9', 'The Zambezi Verdict',               'Mystery',     2022, '1st', 'English', 15.99, 18),
(60, '978-1-001-00060-0', 'Steppe and Shadow',                 'Fiction',     2021, '1st', 'English', 22.99, 19),
(61, '978-1-001-00061-1', 'The Lagos Lagoon',                  'Fiction',     2018, '1st', 'English', 19.99, 20);

-- ============================================================
-- STEP 3: Update Book_Authors
-- Link all new books (12–61) to their respective new authors (12–61)
-- ============================================================
INSERT IGNORE INTO Book_Authors (BookID, AuthorID) VALUES
(12, 12), (13, 13), (14, 14), (15, 15), (16, 16),
(17, 17), (18, 18), (19, 19), (20, 20), (21, 21),
(22, 22), (23, 23), (24, 24), (25, 25), (26, 26),
(27, 27), (28, 28), (29, 29), (30, 30), (31, 31),
(32, 32), (33, 33), (34, 34), (35, 35), (36, 36),
(37, 37), (38, 38), (39, 39), (40, 40), (41, 41),
(42, 42), (43, 43), (44, 44), (45, 45), (46, 46),
(47, 47), (48, 48), (49, 49), (50, 50), (51, 51),
(52, 52), (53, 53), (54, 54), (55, 55), (56, 56),
(57, 57), (58, 58), (59, 59), (60, 60), (61, 61);

-- ============================================================
-- STEP 4: Update Inventory
-- Add stock entries for new books across all 11 stores
-- Each new book gets one store assignment cycling through stores 1–11
-- ============================================================
INSERT IGNORE INTO Inventory (BookID, StoreID, QuantityOnHand, ReorderLevel) VALUES
(12, 2,  20, 5), (13, 3,  15, 5), (14, 4,  22, 5), (15, 5,  18, 5),
(16, 6,  30, 5), (17, 7,  12, 5), (18, 8,  25, 5), (19, 9,  17, 5),
(20, 10, 28, 5), (21, 11, 14, 5), (22, 1,  20, 5), (23, 2,  16, 5),
(24, 3,  24, 5), (25, 4,  19, 5), (26, 5,  22, 5), (27, 6,  11, 5),
(28, 7,  27, 5), (29, 8,  13, 5), (30, 9,  21, 5), (31, 10, 18, 5),
(32, 11, 23, 5), (33, 1,  15, 5), (34, 2,  29, 5), (35, 3,  10, 5),
(36, 4,  26, 5), (37, 5,  14, 5), (38, 6,  20, 5), (39, 7,  17, 5),
(40, 8,  22, 5), (41, 9,  25, 5), (42, 10, 13, 5), (43, 11, 19, 5),
(44, 1,  28, 5), (45, 2,  16, 5), (46, 3,  21, 5), (47, 4,  12, 5),
(48, 5,  24, 5), (49, 6,  18, 5), (50, 7,  30, 5), (51, 8,  15, 5),
(52, 9,  22, 5), (53, 10, 17, 5), (54, 11, 20, 5), (55, 1,  14, 5),
(56, 2,  26, 5), (57, 3,  19, 5), (58, 4,  11, 5), (59, 5,  23, 5),
(60, 6,  16, 5), (61, 7,  28, 5);

-- ============================================================
-- STEP 5: Update Orders (IDs 12–61)
-- New orders cycling through customers, stores, and employees
-- ============================================================
INSERT IGNORE INTO Orders (OrderID, OrderDate, Status, CustomerID, StoreID, EmployeeID) VALUES
(12, '2024-08-01', 'Completed', 1,  1,  1),  (13, '2024-08-02', 'Completed', 2,  2,  2),
(14, '2024-08-03', 'Completed', 3,  3,  3),  (15, '2024-08-04', 'Pending',   4,  4,  4),
(16, '2024-08-05', 'Completed', 5,  5,  5),  (17, '2024-08-06', 'Completed', 6,  6,  6),
(18, '2024-08-07', 'Cancelled', 7,  7,  7),  (19, '2024-08-08', 'Completed', 8,  8,  8),
(20, '2024-08-09', 'Completed', 9,  9,  9),  (21, '2024-08-10', 'Refunded',  10, 10, 10),
(22, '2024-08-11', 'Completed', 11, 11, 11), (23, '2024-08-12', 'Completed', 1,  1,  1),
(24, '2024-08-13', 'Pending',   2,  2,  2),  (25, '2024-08-14', 'Completed', 3,  3,  3),
(26, '2024-08-15', 'Completed', 4,  4,  4),  (27, '2024-08-16', 'Completed', 5,  5,  5),
(28, '2024-08-17', 'Cancelled', 6,  6,  6),  (29, '2024-08-18', 'Completed', 7,  7,  7),
(30, '2024-08-19', 'Completed', 8,  8,  8),  (31, '2024-08-20', 'Refunded',  9,  9,  9),
(32, '2024-08-21', 'Completed', 10, 10, 10), (33, '2024-08-22', 'Completed', 11, 11, 11),
(34, '2024-08-23', 'Completed', 1,  1,  1),  (35, '2024-08-24', 'Pending',   2,  2,  2),
(36, '2024-08-25', 'Completed', 3,  3,  3),  (37, '2024-08-26', 'Completed', 4,  4,  4),
(38, '2024-08-27', 'Completed', 5,  5,  5),  (39, '2024-08-28', 'Cancelled', 6,  6,  6),
(40, '2024-08-29', 'Completed', 7,  7,  7),  (41, '2024-08-30', 'Completed', 8,  8,  8),
(42, '2024-09-01', 'Completed', 9,  9,  9),  (43, '2024-09-02', 'Refunded',  10, 10, 10),
(44, '2024-09-03', 'Completed', 11, 11, 11), (45, '2024-09-04', 'Completed', 1,  1,  1),
(46, '2024-09-05', 'Pending',   2,  2,  2),  (47, '2024-09-06', 'Completed', 3,  3,  3),
(48, '2024-09-07', 'Completed', 4,  4,  4),  (49, '2024-09-08', 'Completed', 5,  5,  5),
(50, '2024-09-09', 'Cancelled', 6,  6,  6),  (51, '2024-09-10', 'Completed', 7,  7,  7),
(52, '2024-09-11', 'Completed', 8,  8,  8),  (53, '2024-09-12', 'Completed', 9,  9,  9),
(54, '2024-09-13', 'Refunded',  10, 10, 10), (55, '2024-09-14', 'Completed', 11, 11, 11),
(56, '2024-09-15', 'Completed', 1,  1,  1),  (57, '2024-09-16', 'Pending',   2,  2,  2),
(58, '2024-09-17', 'Completed', 3,  3,  3),  (59, '2024-09-18', 'Completed', 4,  4,  4),
(60, '2024-09-19', 'Completed', 5,  5,  5),  (61, '2024-09-20', 'Completed', 6,  6,  6);

-- ============================================================
-- STEP 6: Update Order_Items (IDs 12–61)
-- One line item per new order, referencing the matching new book
-- ============================================================
INSERT IGNORE INTO Order_Items (OrderItemID, Quantity, UnitPrice, Discount, OrderID, BookID) VALUES
(12, 1, 18.99,  0.00, 12, 12), (13, 2, 21.99,  5.00, 13, 13),
(14, 1, 16.99, 10.00, 14, 14), (15, 3, 23.99,  0.00, 15, 15),
(16, 2, 19.99,  5.00, 16, 16), (17, 1, 20.99,  0.00, 17, 17),
(18, 2, 24.99, 10.00, 18, 18), (19, 1, 17.99,  0.00, 19, 19),
(20, 3, 22.99,  5.00, 20, 20), (21, 1, 15.99, 15.00, 21, 21),
(22, 2, 18.99,  0.00, 22, 22), (23, 1, 16.99,  5.00, 23, 23),
(24, 2, 21.99,  0.00, 24, 24), (25, 1, 19.99, 10.00, 25, 25),
(26, 3, 17.99,  0.00, 26, 26), (27, 1, 14.99,  5.00, 27, 27),
(28, 2, 20.99,  0.00, 28, 28), (29, 1, 23.99, 10.00, 29, 29),
(30, 2, 18.99,  5.00, 30, 30), (31, 1, 16.99,  0.00, 31, 31),
(32, 3, 15.99,  0.00, 32, 32), (33, 2, 22.99,  5.00, 33, 33),
(34, 1, 13.99, 10.00, 34, 34), (35, 2, 19.99,  0.00, 35, 35),
(36, 1, 21.99,  5.00, 36, 36), (37, 3, 16.99,  0.00, 37, 37),
(38, 1, 24.99, 10.00, 38, 38), (39, 2, 20.99,  5.00, 39, 39),
(40, 1, 17.99,  0.00, 40, 40), (41, 2, 18.99,  0.00, 41, 41),
(42, 1, 15.99,  5.00, 42, 42), (43, 3, 21.99,  0.00, 43, 43),
(44, 2, 19.99, 10.00, 44, 44), (45, 1, 23.99,  0.00, 45, 45),
(46, 2, 16.99,  5.00, 46, 46), (47, 1, 20.99,  0.00, 47, 47),
(48, 3, 17.99, 15.00, 48, 48), (49, 1, 18.99,  0.00, 49, 49),
(50, 2, 22.99,  5.00, 50, 50), (51, 1, 19.99,  0.00, 51, 51),
(52, 2, 21.99, 10.00, 52, 52), (53, 1, 17.99,  5.00, 53, 53),
(54, 3, 23.99,  0.00, 54, 54), (55, 1, 16.99,  0.00, 55, 55),
(56, 2, 20.99,  5.00, 56, 56), (57, 1, 18.99,  0.00, 57, 57),
(58, 2, 14.99, 10.00, 58, 58), (59, 1, 15.99,  0.00, 59, 59),
(60, 3, 22.99,  5.00, 60, 60), (61, 1, 19.99,  0.00, 61, 61);

-- ============================================================
-- STEP 7: Update Payments (IDs 12–61)
-- Payment methods cycle through all allowed types
-- Amount = Quantity * UnitPrice * (1 - Discount/100)
-- ============================================================
INSERT IGNORE INTO Payments (PaymentID, PaymentDate, PaymentMethod, AmountPaid, PaymentConfirmation, Status, OrderID) VALUES
(12, '2024-08-01', 'Credit Card', 18.99, 'CONF-PEN-10012', 'Paid',     12),
(13, '2024-08-02', 'Debit Card',  41.78, 'CONF-PEN-10013', 'Paid',     13),
(14, '2024-08-03', 'Venmo',       15.29, 'CONF-PEN-10014', 'Paid',     14),
(15, '2024-08-04', 'Cash',        71.97, 'CONF-PEN-10015', 'Pending',  15),
(16, '2024-08-05', 'Zelle',       37.98, 'CONF-PEN-10016', 'Paid',     16),
(17, '2024-08-06', 'PayPal',      20.99, 'CONF-PEN-10017', 'Paid',     17),
(18, '2024-08-07', 'Check',       44.98, 'CONF-PEN-10018', 'Refunded', 18),
(19, '2024-08-08', 'Credit Card', 17.99, 'CONF-PEN-10019', 'Paid',     19),
(20, '2024-08-09', 'Debit Card',  65.32, 'CONF-PEN-10020', 'Paid',     20),
(21, '2024-08-10', 'Venmo',       13.59, 'CONF-PEN-10021', 'Refunded', 21),
(22, '2024-08-11', 'Cash',        37.98, 'CONF-PEN-10022', 'Paid',     22),
(23, '2024-08-12', 'Zelle',       16.14, 'CONF-PEN-10023', 'Paid',     23),
(24, '2024-08-13', 'PayPal',      43.98, 'CONF-PEN-10024', 'Pending',  24),
(25, '2024-08-14', 'Check',       17.99, 'CONF-PEN-10025', 'Paid',     25),
(26, '2024-08-15', 'Credit Card', 53.97, 'CONF-PEN-10026', 'Paid',     26),
(27, '2024-08-16', 'Debit Card',  14.24, 'CONF-PEN-10027', 'Paid',     27),
(28, '2024-08-17', 'Venmo',       41.98, 'CONF-PEN-10028', 'Refunded', 28),
(29, '2024-08-18', 'Cash',        21.59, 'CONF-PEN-10029', 'Paid',     29),
(30, '2024-08-19', 'Zelle',       35.08, 'CONF-PEN-10030', 'Paid',     30),
(31, '2024-08-20', 'PayPal',      16.99, 'CONF-PEN-10031', 'Refunded', 31),
(32, '2024-08-21', 'Check',       47.97, 'CONF-PEN-10032', 'Paid',     32),
(33, '2024-08-22', 'Credit Card', 43.68, 'CONF-PEN-10033', 'Paid',     33),
(34, '2024-08-23', 'Debit Card',  12.59, 'CONF-PEN-10034', 'Paid',     34),
(35, '2024-08-24', 'Venmo',       39.98, 'CONF-PEN-10035', 'Pending',  35),
(36, '2024-08-25', 'Cash',        20.89, 'CONF-PEN-10036', 'Paid',     36),
(37, '2024-08-26', 'Zelle',       50.97, 'CONF-PEN-10037', 'Paid',     37),
(38, '2024-08-27', 'PayPal',      44.98, 'CONF-PEN-10038', 'Paid',     38),
(39, '2024-08-28', 'Check',       39.78, 'CONF-PEN-10039', 'Refunded', 39),
(40, '2024-08-29', 'Credit Card', 17.99, 'CONF-PEN-10040', 'Paid',     40),
(41, '2024-08-30', 'Debit Card',  37.98, 'CONF-PEN-10041', 'Paid',     41),
(42, '2024-09-01', 'Venmo',       15.19, 'CONF-PEN-10042', 'Paid',     42),
(43, '2024-09-02', 'Cash',        65.97, 'CONF-PEN-10043', 'Refunded', 43),
(44, '2024-09-03', 'Zelle',       35.98, 'CONF-PEN-10044', 'Paid',     44),
(45, '2024-09-04', 'PayPal',      23.99, 'CONF-PEN-10045', 'Paid',     45),
(46, '2024-09-05', 'Check',       32.24, 'CONF-PEN-10046', 'Pending',  46),
(47, '2024-09-06', 'Credit Card', 20.99, 'CONF-PEN-10047', 'Paid',     47),
(48, '2024-09-07', 'Debit Card',  45.82, 'CONF-PEN-10048', 'Paid',     48),
(49, '2024-09-08', 'Venmo',       18.99, 'CONF-PEN-10049', 'Paid',     49),
(50, '2024-09-09', 'Cash',        43.68, 'CONF-PEN-10050', 'Refunded', 50),
(51, '2024-09-10', 'Zelle',       19.99, 'CONF-PEN-10051', 'Paid',     51),
(52, '2024-09-11', 'PayPal',      39.58, 'CONF-PEN-10052', 'Paid',     52),
(53, '2024-09-12', 'Check',       17.04, 'CONF-PEN-10053', 'Paid',     53),
(54, '2024-09-13', 'Credit Card', 71.97, 'CONF-PEN-10054', 'Refunded', 54),
(55, '2024-09-14', 'Debit Card',  16.99, 'CONF-PEN-10055', 'Paid',     55),
(56, '2024-09-15', 'Venmo',       39.72, 'CONF-PEN-10056', 'Paid',     56),
(57, '2024-09-16', 'Cash',        18.99, 'CONF-PEN-10057', 'Pending',  57),
(58, '2024-09-17', 'Zelle',       26.98, 'CONF-PEN-10058', 'Paid',     58),
(59, '2024-09-18', 'PayPal',      15.99, 'CONF-PEN-10059', 'Paid',     59),
(60, '2024-09-19', 'Check',       65.32, 'CONF-PEN-10060', 'Paid',     60),
(61, '2024-09-20', 'Credit Card', 19.99, 'CONF-PEN-10061', 'Paid',     61);

-- ============================================================
-- STEP 8: Update Reservations (IDs 12–61)
-- Cycling through customers, books, and stores
-- ============================================================
INSERT IGNORE INTO Reservations (ReservationID, ReservationDate, ExpiryDate, Status, CustomerID, BookID, StoreID) VALUES
(12, '2024-08-01', '2024-08-15', 'Fulfilled', 1,  12, 1),
(13, '2024-08-02', '2024-08-16', 'Cancelled', 2,  13, 2),
(14, '2024-08-03', '2024-08-17', 'Ready',     3,  14, 3),
(15, '2024-08-04', '2024-08-18', 'Pending',   4,  15, 4),
(16, '2024-08-05', '2024-08-19', 'Fulfilled', 5,  16, 5),
(17, '2024-08-06', '2024-08-20', 'Expired',   6,  17, 6),
(18, '2024-08-07', '2024-08-21', 'Pending',   7,  18, 7),
(19, '2024-08-08', '2024-08-22', 'Ready',     8,  19, 8),
(20, '2024-08-09', '2024-08-23', 'Cancelled', 9,  20, 9),
(21, '2024-08-10', '2024-08-24', 'Fulfilled', 10, 21, 10),
(22, '2024-08-11', '2024-08-25', 'Expired',   11, 22, 11),
(23, '2024-08-12', '2024-08-26', 'Fulfilled', 1,  23, 1),
(24, '2024-08-13', '2024-08-27', 'Pending',   2,  24, 2),
(25, '2024-08-14', '2024-08-28', 'Ready',     3,  25, 3),
(26, '2024-08-15', '2024-08-29', 'Fulfilled', 4,  26, 4),
(27, '2024-08-16', '2024-08-30', 'Cancelled', 5,  27, 5),
(28, '2024-08-17', '2024-08-31', 'Expired',   6,  28, 6),
(29, '2024-08-18', '2024-09-01', 'Fulfilled', 7,  29, 7),
(30, '2024-08-19', '2024-09-02', 'Ready',     8,  30, 8),
(31, '2024-08-20', '2024-09-03', 'Pending',   9,  31, 9),
(32, '2024-08-21', '2024-09-04', 'Fulfilled', 10, 32, 10),
(33, '2024-08-22', '2024-09-05', 'Cancelled', 11, 33, 11),
(34, '2024-08-23', '2024-09-06', 'Ready',     1,  34, 1),
(35, '2024-08-24', '2024-09-07', 'Pending',   2,  35, 2),
(36, '2024-08-25', '2024-09-08', 'Fulfilled', 3,  36, 3),
(37, '2024-08-26', '2024-09-09', 'Expired',   4,  37, 4),
(38, '2024-08-27', '2024-09-10', 'Fulfilled', 5,  38, 5),
(39, '2024-08-28', '2024-09-11', 'Cancelled', 6,  39, 6),
(40, '2024-08-29', '2024-09-12', 'Ready',     7,  40, 7),
(41, '2024-08-30', '2024-09-13', 'Fulfilled', 8,  41, 8),
(42, '2024-09-01', '2024-09-15', 'Pending',   9,  42, 9),
(43, '2024-09-02', '2024-09-16', 'Expired',   10, 43, 10),
(44, '2024-09-03', '2024-09-17', 'Fulfilled', 11, 44, 11),
(45, '2024-09-04', '2024-09-18', 'Ready',     1,  45, 1),
(46, '2024-09-05', '2024-09-19', 'Pending',   2,  46, 2),
(47, '2024-09-06', '2024-09-20', 'Fulfilled', 3,  47, 3),
(48, '2024-09-07', '2024-09-21', 'Cancelled', 4,  48, 4),
(49, '2024-09-08', '2024-09-22', 'Expired',   5,  49, 5),
(50, '2024-09-09', '2024-09-23', 'Fulfilled', 6,  50, 6),
(51, '2024-09-10', '2024-09-24', 'Ready',     7,  51, 7),
(52, '2024-09-11', '2024-09-25', 'Fulfilled', 8,  52, 8),
(53, '2024-09-12', '2024-09-26', 'Pending',   9,  53, 9),
(54, '2024-09-13', '2024-09-27', 'Expired',   10, 54, 10),
(55, '2024-09-14', '2024-09-28', 'Fulfilled', 11, 55, 11),
(56, '2024-09-15', '2024-09-29', 'Cancelled', 1,  56, 1),
(57, '2024-09-16', '2024-09-30', 'Pending',   2,  57, 2),
(58, '2024-09-17', '2024-10-01', 'Ready',     3,  58, 3),
(59, '2024-09-18', '2024-10-02', 'Fulfilled', 4,  59, 4),
(60, '2024-09-19', '2024-10-03', 'Expired',   5,  60, 5),
(61, '2024-09-20', '2024-10-04', 'Fulfilled', 6,  61, 6);

-- ============================================================
-- STEP 9: Update Returns (IDs 12–61)
-- Tied to new Order_Items with realistic reasons and notes
-- ============================================================
INSERT IGNORE INTO Returns (ReturnID, ReturnDate, Reason, Notes, Status, OrderItemID, EmployeeID) VALUES
(12, '2024-08-03', 'Damaged',         'Customer reported that The Cork and the Tide arrived with water damage to the cover and first thirty pages. A replacement copy was issued from in-store stock.',                                           'Completed', 12, 1),
(13, '2024-08-04', 'Wrong Item',      'Customer received Drift Without Anchor instead of the title they ordered. Correct book was retrieved from back stock and exchanged with an apology.',                                                    'Completed', 13, 2),
(14, '2024-08-05', 'Changed Mind',    'Customer decided The Vermillion Accord was not what they expected based on the cover description. Return was accepted within the 7-day window and store credit was issued.',                             'Approved',  14, 3),
(15, '2024-08-06', 'Duplicate Order', 'Customer placed two identical orders for Pale Roads to Fenwick during a website session error. Second copy was returned unopened and a full refund was processed.',                                      'Completed', 15, 4),
(16, '2024-08-07', 'Damaged',         'Between Dust and Longitude had a cracked spine and loose pages upon delivery. Customer submitted photographic evidence and a full replacement was shipped within two business days.',                     'Completed', 16, 5),
(17, '2024-08-08', 'Other',           'Customer felt The Lantern Fisherman did not align with the summary provided on the website. Manager reviewed the listing and approved a partial store credit as resolution.',                            'Approved',  17, 6),
(18, '2024-08-09', 'Wrong Item',      'Salt and Inheritance was sent to the wrong customer due to a mislabeled shipping slip. The item was returned by the incorrect recipient and re-routed to the correct customer.',                        'Completed', 18, 7),
(19, '2024-08-10', 'Changed Mind',    'Customer purchased The Amber Cartography as a birthday gift but the recipient preferred a different genre. Return was processed and original payment method was refunded in full.',                     'Completed', 19, 8),
(20, '2024-08-11', 'Damaged',         'What the Monsoon Leaves Behind was found to have pages 88 through 102 printed completely blank. The defective copy was quarantined and the publisher was notified for quality review.',                 'Pending',   20, 9),
(21, '2024-08-12', 'Duplicate Order', 'Customer was double-charged for Seventeen Silences due to a payment gateway timeout. Both transactions were verified and the duplicate charge was reversed within 24 hours.',                           'Completed', 21, 10),
(22, '2024-08-13', 'Other',           'Customer reported that The Cartographer of Lost Seasons contained a misbound section where chapters 6 and 7 appeared in reverse order. Publisher was contacted and a corrected copy was issued.',       'Pending',   22, 11),
(23, '2024-08-14', 'Damaged',         'Borrowed Sun arrived with a torn back cover and a broken spine. Customer was offered either a replacement or a full refund and chose the replacement option.',                                          'Completed', 23, 1),
(24, '2024-08-15', 'Wrong Item',      'Customer ordered The Red Bridge Letters but received Unmapped instead. Store inventory log was updated to reflect the misplacement and the correct title was dispatched same day.',                     'Completed', 24, 2),
(25, '2024-08-16', 'Changed Mind',    'Customer read the first few chapters of Unmapped and decided it was not the right fit for their personal development goals. A full store credit was issued per policy.',                               'Approved',  25, 3),
(26, '2024-08-17', 'Duplicate Order', 'A technical error on the online checkout page resulted in two separate charges for The Weight of Open Water. The duplicate order was cancelled and the payment reversed promptly.',                     'Completed', 26, 4),
(27, '2024-08-18', 'Damaged',         'Mirrors in the Fog had extensive yellowing and mold spotting consistent with improper storage. The item was removed from inventory and a quality report was filed with the warehouse.',                 'Completed', 27, 5),
(28, '2024-08-19', 'Other',           'Customer stated The Final Garden did not reflect the romantic tone advertised. After manager review, a partial refund was approved and the customer retained the book.',                                'Approved',  28, 6),
(29, '2024-08-20', 'Wrong Item',      'Echoes from the Pearl River was incorrectly labeled as a different title in the store system. The shelving error was corrected and the customer was given a full exchange.',                            'Completed', 29, 7),
(30, '2024-08-21', 'Changed Mind',    'Customer purchased A Thousand Small Departures as a gift but was informed the recipient already had a copy. Return was accepted within the allowed window and original payment was refunded.',           'Completed', 30, 8),
(31, '2024-08-22', 'Damaged',         'Where the Tulips Fell was received with a severely bent cover and water stains on the first twenty pages. Replacement was issued from in-store stock the same day.',                                  'Completed', 31, 9),
(32, '2024-08-23', 'Duplicate Order', 'Customer accidentally submitted The Havana Frequency twice during an unstable internet session. One order was cancelled immediately and the charge was reversed.',                                     'Completed', 32, 10),
(33, '2024-08-24', 'Other',           'Customer reported Children of the Caatinga had a printing error causing entire paragraphs to repeat across three consecutive pages. Publisher was notified and a corrected copy was ordered.',          'Pending',   33, 11),
(34, '2024-08-25', 'Damaged',         'Glacier Song poetry collection arrived with the cover detached from the binding. Customer was offered a replacement and the damaged copy was returned to the distributor.',                            'Completed', 34, 1),
(35, '2024-08-26', 'Wrong Item',      'Customer ordered The Ceiba and the Storm but received Unfinished Atlas. The mix-up was traced to a warehouse scanning error which was logged and corrected.',                                          'Completed', 35, 2),
(36, '2024-08-27', 'Changed Mind',    'Customer felt Unfinished Atlas was too academic in tone for their reading preferences. Return was accepted and a full refund was applied to their original payment method.',                           'Approved',  36, 3),
(37, '2024-08-28', 'Duplicate Order', 'The Bogotá Inheritance was ordered twice within minutes due to a browser back-button issue. Second order was flagged and cancelled before shipping with no charge applied.',                           'Completed', 37, 4),
(38, '2024-08-29', 'Damaged',         'Roots in the Pampas arrived with pages 201 through 215 stuck together due to a binding adhesive error. Customer requested a replacement and the defective copy was sent back to the publisher.',       'Completed', 38, 5),
(39, '2024-08-30', 'Other',           'Customer disputed that The Port-au-Prince Journals was misrepresented as historical non-fiction when it contained narrative embellishments. A store manager reviewed the case and issued partial credit.','Approved', 39, 6),
(40, '2024-08-31', 'Wrong Item',      'Customer received Dust Over Oaxaca instead of the long-form fiction title they requested. The shipping manifest error was documented and corrected. Correct title was hand-delivered to the customer.', 'Completed', 40, 7),
(41, '2024-09-01', 'Changed Mind',    'Customer bought The Long Road from Santiago for a book club but the group selected a different title. The return was processed within the 7-day window and the customer received a full store credit.',  'Completed', 41, 8),
(42, '2024-09-02', 'Damaged',         'The Algiers Manuscript had a significant printing defect on the cover image and multiple chapters with blurred text. The item was set aside for quality review and a replacement was issued.',           'Completed', 42, 9),
(43, '2024-09-03', 'Duplicate Order', 'Sand and Silence was purchased twice due to an auto-fill error on the customer account. One copy was returned unopened and the corresponding payment was refunded in full.',                           'Completed', 43, 10),
(44, '2024-09-04', 'Other',           'Customer indicated The Cedar House did not match the synopsis they read on a third-party review site. After discussion with the manager a one-time store credit exception was granted.',                'Approved',  44, 11),
(45, '2024-09-05', 'Wrong Item',      'Threads of the Old City was mistakenly shelved under a different ISBN causing the wrong title to ship. Inventory was audited following the error and all mismatched entries were corrected.',           'Completed', 45, 1),
(46, '2024-09-06', 'Changed Mind',    'Customer purchased The Nile in Winter on impulse but decided it was not aligned with their current reading list. Return was accepted and refund was issued back to their debit card.',                  'Approved',  46, 2),
(47, '2024-09-07', 'Damaged',         'Beyond the Qanat arrived with a broken spine and several torn pages near the middle of the book. Customer was issued a replacement from available inventory.',                                         'Completed', 47, 3),
(48, '2024-09-08', 'Duplicate Order', 'The Amman Letters was ordered in duplicate due to a checkout session glitch. The second charge was identified during processing and reversed before the second copy was shipped.',                     'Completed', 48, 4),
(49, '2024-09-09', 'Other',           'Customer felt Desert Glass had a misleading subtitle suggesting it was a travel memoir when it is literary fiction. A partial store credit was offered after manager review.',                          'Approved',  49, 5),
(50, '2024-09-10', 'Wrong Item',      'Customer ordered The Hour of the Muezzin but received Between Mecca and Montmartre due to adjacent shelf placement. Both titles were re-tagged and the correct book was provided to the customer.',    'Completed', 50, 6),
(51, '2024-09-11', 'Changed Mind',    'Customer purchased Between Mecca and Montmartre as a travel companion read but changed their trip plans. The return was processed within the allowed timeframe and a store credit was applied.',        'Completed', 51, 7),
(52, '2024-09-12', 'Damaged',         'The Tangi and the Tide arrived with significant moisture damage to the back quarter of the book. Customer was offered a full refund or replacement and chose a full replacement copy.',                 'Completed', 52, 8),
(53, '2024-09-13', 'Duplicate Order', 'Where the Kauri Grow was accidentally ordered twice from the mobile app. The second order was identified during packing and cancelled with a full payment reversal.',                                  'Completed', 53, 9),
(54, '2024-09-14', 'Other',           'Lava and Latitude contained several factual inconsistencies flagged by the customer who works in the relevant field. Case was escalated to management and a refund was processed.',                    'Approved',  54, 10),
(55, '2024-09-15', 'Wrong Item',      'Customer received Highveld Hymns instead of The Blue Lagoon Letters. A mis-scan at the packing station was identified as the cause. Correct title was retrieved and shipped priority.',               'Completed', 55, 11),
(56, '2024-09-16', 'Changed Mind',    'Customer purchased Harmattan Season as a gift but the recipient preferred non-fiction. Return was accepted and a full refund was applied to the original credit card.',                                'Completed', 56, 1),
(57, '2024-09-17', 'Damaged',         'The Obi Crossing had pages 30 through 45 printed in a completely illegible font due to a press error. Customer was given a replacement and the defective batch was flagged for return to the printer.','Pending',   57, 2),
(58, '2024-09-18', 'Duplicate Order', 'Highveld Hymns was ordered twice within the same session. The duplicate was caught during order review and only one copy was charged and shipped.',                                                   'Completed', 58, 3),
(59, '2024-09-19', 'Other',           'Customer reported that The Zambezi Verdict contained an unresolved plot thread that the ending description on the back cover explicitly promised would be resolved. A partial credit was issued.',      'Approved',  59, 4),
(60, '2024-09-20', 'Wrong Item',      'Steppe and Shadow was delivered to the wrong address due to a zip code entry error. The misdelivered copy was retrieved and re-sent to the correct customer with expedited shipping at no extra cost.',  'Completed', 60, 5),
(61, '2024-09-21', 'Changed Mind',    'Customer bought The Lagos Lagoon for a reading group that ultimately selected a different title. The return was processed within policy and a full store credit was applied to the customer account.',  'Completed', 61, 6);

-- ============================================================
-- VERIFICATION QUERIES
-- ============================================================

-- Full author count
SELECT COUNT(*) AS TotalAuthors FROM Authors;

-- Full book count
SELECT COUNT(*) AS TotalBooks FROM Books;

-- Author-to-book mapping (all 61)
SELECT
    a.AuthorID,
    CONCAT(a.FirstName, ' ', a.LastName) AS Author,
    a.Nationality,
    b.Title,
    b.Genre,
    b.PublishedYear
FROM Authors a
JOIN Book_Authors ba ON a.AuthorID = ba.AuthorID
JOIN Books b         ON ba.BookID  = b.BookID
ORDER BY a.AuthorID;

-- Summary counts per table
SELECT 'Authors'      AS TableName, COUNT(*) AS TotalRows FROM Authors      UNION ALL
SELECT 'Books'        AS TableName, COUNT(*) AS TotalRows FROM Books         UNION ALL
SELECT 'Book_Authors' AS TableName, COUNT(*) AS TotalRows FROM Book_Authors  UNION ALL
SELECT 'Inventory'    AS TableName, COUNT(*) AS TotalRows FROM Inventory     UNION ALL
SELECT 'Orders'       AS TableName, COUNT(*) AS TotalRows FROM Orders        UNION ALL
SELECT 'Order_Items'  AS TableName, COUNT(*) AS TotalRows FROM Order_Items   UNION ALL
SELECT 'Payments'     AS TableName, COUNT(*) AS TotalRows FROM Payments      UNION ALL
SELECT 'Reservations' AS TableName, COUNT(*) AS TotalRows FROM Reservations  UNION ALL
SELECT 'Returns'      AS TableName, COUNT(*) AS TotalRows FROM Returns;