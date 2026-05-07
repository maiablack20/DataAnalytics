-- ============================================================
-- Pendragon Bookstore Database
-- REVISED: Alabama Full Expansion (20 major cities)
--          + Employee_Performance (Annual Reviews)
-- Platform: MySQL
-- ============================================================

USE pendragon_bookstore;

-- ============================================================
-- CLEANUP: Drop previous Alabama attempt if re-running
-- ============================================================
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Employee_Performance;
SET FOREIGN_KEY_CHECKS = 1;

-- Remove previously inserted Alabama data if re-running
DELETE FROM Employees WHERE StoreID BETWEEN 12 AND 31;
DELETE FROM Stores    WHERE StoreID BETWEEN 12 AND 31;
DELETE FROM Locations WHERE State = 'Alabama';

-- ============================================================
-- PART A — ALABAMA LOCATIONS (20 major cities)
-- Real ZIP codes for each city
-- Area codes:
--   205 → Birmingham, Gadsden, Anniston, Cullman, Jasper,
--          Clanton, Talladega
--   256 → Huntsville, Florence, Decatur, Albertville,
--          Scottsboro, Fort Payne, Athens
--   334 → Montgomery, Tuscaloosa, Auburn, Dothan,
--          Opelika, Selma, Troy, Phenix City
--   251 → Mobile, Daphne
-- ============================================================
INSERT IGNORE INTO Locations (ZipCode, City, State) VALUES
('35203', 'Birmingham',   'Alabama'),
('36104', 'Montgomery',   'Alabama'),
('35801', 'Huntsville',   'Alabama'),
('36602', 'Mobile',       'Alabama'),
('35401', 'Tuscaloosa',   'Alabama'),
('36830', 'Auburn',       'Alabama'),
('35601', 'Decatur',      'Alabama'),
('35901', 'Gadsden',      'Alabama'),
('36201', 'Anniston',     'Alabama'),
('35630', 'Florence',     'Alabama'),
('36301', 'Dothan',       'Alabama'),
('36801', 'Opelika',      'Alabama'),
('35055', 'Cullman',      'Alabama'),
('35501', 'Jasper',       'Alabama'),
('35007', 'Alabaster',    'Alabama'),
('36330', 'Enterprise',   'Alabama'),
('35150', 'Talladega',    'Alabama'),
('35004', 'Moody',        'Alabama'),
('36420', 'Andalusia',    'Alabama'),
('36701', 'Selma',        'Alabama');

-- ============================================================
-- PART B — ALABAMA STORES (StoreIDs 12–31)
-- Real street names per city, correct area codes
-- ============================================================
INSERT IGNORE INTO Stores (StoreID, StoreName, PhoneNumber, Email, Street, ZipCode) VALUES
(12,  'Pendragon Bookstore', '(205) 300-4012', 'birmingham@pendragon.com',  '1200 Morris Ave',            '35203'),
(13,  'Pendragon Bookstore', '(334) 300-4013', 'montgomery@pendragon.com',  '1301 Commerce St',           '36104'),
(14,  'Pendragon Bookstore', '(256) 300-4014', 'huntsville@pendragon.com',  '1400 Church St NW',          '35801'),
(15,  'Pendragon Bookstore', '(251) 300-4015', 'mobile@pendragon.com',      '1500 Dauphin St',            '36602'),
(16,  'Pendragon Bookstore', '(334) 300-4016', 'tuscaloosa@pendragon.com',  '1600 University Blvd',       '35401'),
(17,  'Pendragon Bookstore', '(334) 300-4017', 'auburn@pendragon.com',      '1700 College St',            '36830'),
(18,  'Pendragon Bookstore', '(256) 300-4018', 'decatur@pendragon.com',     '1800 Bank St NE',            '35601'),
(19,  'Pendragon Bookstore', '(205) 300-4019', 'gadsden@pendragon.com',     '1900 Broad St',              '35901'),
(20,  'Pendragon Bookstore', '(205) 300-4020', 'anniston@pendragon.com',    '2000 Noble St',              '36201'),
(21,  'Pendragon Bookstore', '(256) 300-4021', 'florence@pendragon.com',    '2100 N Court St',            '35630'),
(22,  'Pendragon Bookstore', '(334) 300-4022', 'dothan@pendragon.com',      '2200 W Main St',             '36301'),
(23,  'Pendragon Bookstore', '(334) 300-4023', 'opelika@pendragon.com',     '2300 S Railroad Ave',        '36801'),
(24,  'Pendragon Bookstore', '(205) 300-4024', 'cullman@pendragon.com',     '2400 4th Ave SW',            '35055'),
(25,  'Pendragon Bookstore', '(205) 300-4025', 'jasper@pendragon.com',      '2500 Highway 78 E',          '35501'),
(26,  'Pendragon Bookstore', '(205) 300-4026', 'alabaster@pendragon.com',   '2600 US-31',                 '35007'),
(27,  'Pendragon Bookstore', '(334) 300-4027', 'enterprise@pendragon.com',  '2700 Boll Weevil Cir',       '36330'),
(28,  'Pendragon Bookstore', '(205) 300-4028', 'talladega@pendragon.com',   '2800 Battle St E',           '35150'),
(29,  'Pendragon Bookstore', '(205) 300-4029', 'moody@pendragon.com',       '2900 Moody Pkwy',            '35004'),
(30,  'Pendragon Bookstore', '(334) 300-4030', 'andalusia@pendragon.com',   '3000 Bypass Dr E',           '36420'),
(31,  'Pendragon Bookstore', '(334) 300-4031', 'selma@pendragon.com',       '3100 Broad St',              '36701');

-- ============================================================
-- PART C — ALABAMA EMPLOYEES (EmployeeIDs 12–51)
-- 2 employees per store (manager + floor role)
-- Diverse names, correct area codes for phone numbers
-- ============================================================
INSERT IGNORE INTO Employees (EmployeeID, FirstName, LastName, Email, PhoneNumber, HireDate, Role, StoreID) VALUES

-- Store 12: Birmingham
(12, 'Imani',     'Osei-Mensah',   'imani.oseim@pendragon.com',       '(205) 401-5012', '2022-03-07', 'Store Manager',        12),
(13, 'Devon',     'Calloway',      'devon.calloway@pendragon.com',     '(205) 401-5013', '2023-06-14', 'Sales Associate',      12),

-- Store 13: Montgomery
(14, 'Yolanda',   'Trujillo',      'yolanda.trujillo@pendragon.com',   '(334) 401-5014', '2021-11-01', 'Store Manager',        13),
(15, 'Marcus',    'Lindqvist',     'marcus.lindqvist@pendragon.com',   '(334) 401-5015', '2022-08-19', 'Cashier',              13),

-- Store 14: Huntsville
(16, 'Priyanka',  'Okonkwo',       'priyanka.okonkwo@pendragon.com',   '(256) 401-5016', '2020-04-22', 'Store Manager',        14),
(17, 'Elliot',    'Nakashima',     'elliot.nakashima@pendragon.com',   '(256) 401-5017', '2023-01-09', 'Inventory Specialist', 14),

-- Store 15: Mobile
(18, 'Celeste',   'Abubakar',      'celeste.abubakar@pendragon.com',   '(251) 401-5018', '2021-07-30', 'Store Manager',        15),
(19, 'Jordan',    'Ferreira',      'jordan.ferreira@pendragon.com',    '(251) 401-5019', '2022-10-11', 'Customer Service',     15),

-- Store 16: Tuscaloosa
(20, 'Amara',     'Petrov',        'amara.petrov@pendragon.com',       '(334) 401-5020', '2019-09-03', 'Store Manager',        16),
(21, 'Hassan',    'Beaumont',      'hassan.beaumont@pendragon.com',    '(334) 401-5021', '2023-04-17', 'Sales Associate',      16),

-- Store 17: Auburn
(22, 'Saoirse',   'Nakamura',      'saoirse.nakamura@pendragon.com',   '(334) 401-5022', '2022-01-25', 'Assistant Manager',    17),
(23, 'Tobias',    'Mensah',        'tobias.mensah@pendragon.com',      '(334) 401-5023', '2023-08-02', 'Cashier',              17),

-- Store 18: Decatur
(24, 'Nneka',     'Johansson',     'nneka.johansson@pendragon.com',    '(256) 401-5024', '2022-05-16', 'Store Manager',        18),
(25, 'Liam',      'Oduya',         'liam.oduya@pendragon.com',         '(256) 401-5025', '2023-07-03', 'Sales Associate',      18),

-- Store 19: Gadsden
(26, 'Fatou',     'Christensen',   'fatou.christensen@pendragon.com',  '(205) 401-5026', '2020-12-15', 'Store Manager',        19),
(27, 'Rowan',     'Adeyemi',       'rowan.adeyemi@pendragon.com',      '(205) 401-5027', '2023-03-28', 'Sales Associate',      19),

-- Store 20: Anniston
(28, 'Keiko',     'Oduya',         'keiko.oduya@pendragon.com',        '(205) 401-5028', '2021-05-10', 'Store Manager',        20),
(29, 'Damien',    'Vasquez',       'damien.vasquez@pendragon.com',     '(205) 401-5029', '2022-11-23', 'Inventory Specialist', 20),

-- Store 21: Florence
(30, 'Anaya',     'Sorensen',      'anaya.sorensen@pendragon.com',     '(256) 401-5030', '2020-06-08', 'Store Manager',        21),
(31, 'Felix',     'Okafor',        'felix.okafor@pendragon.com',       '(256) 401-5031', '2023-09-16', 'Cashier',              21),

-- Store 22: Dothan
(32, 'Miriam',    'Halvorsen',     'miriam.halvorsen@pendragon.com',   '(334) 401-5032', '2021-02-14', 'Store Manager',        22),
(33, 'Kwame',     'Delacroix',     'kwame.delacroix@pendragon.com',    '(334) 401-5033', '2022-07-05', 'Sales Associate',      22),

-- Store 23: Opelika
(34, 'Sienna',    'Abara',         'sienna.abara@pendragon.com',       '(334) 401-5034', '2022-04-11', 'Store Manager',        23),
(35, 'Caden',     'Osei',          'caden.osei@pendragon.com',         '(334) 401-5035', '2023-10-02', 'Cashier',              23),

-- Store 24: Cullman
(36, 'Zuri',      'Magnusson',     'zuri.magnusson@pendragon.com',     '(205) 401-5036', '2021-08-23', 'Store Manager',        24),
(37, 'Elena',     'Nwosu',         'elena.nwosu@pendragon.com',        '(205) 401-5037', '2023-02-07', 'Sales Associate',      24),

-- Store 25: Jasper
(38, 'Tariq',     'Lindqvist',     'tariq.lindqvist@pendragon.com',    '(205) 401-5038', '2020-10-19', 'Store Manager',        25),
(39, 'Amina',     'Petersen',      'amina.petersen@pendragon.com',     '(205) 401-5039', '2023-05-30', 'Cashier',              25),

-- Store 26: Alabaster
(40, 'Darius',    'Volkov',        'darius.volkov@pendragon.com',      '(205) 401-5040', '2021-03-25', 'Store Manager',        26),
(41, 'Yuki',      'Mensah',        'yuki.mensah@pendragon.com',        '(205) 401-5041', '2023-11-06', 'Sales Associate',      26),

-- Store 27: Enterprise
(42, 'Chidinma',  'Sorensen',      'chidinma.sorensen@pendragon.com',  '(334) 401-5042', '2022-06-13', 'Store Manager',        27),
(43, 'Rafael',    'Osei-Kuffour',  'rafael.oseik@pendragon.com',       '(334) 401-5043', '2023-09-01', 'Cashier',              27),

-- Store 28: Talladega
(44, 'Nadia',     'Brennan',       'nadia.brennan@pendragon.com',      '(205) 401-5044', '2021-07-08', 'Store Manager',        28),
(45, 'Kofi',      'Andersen',      'kofi.andersen@pendragon.com',      '(205) 401-5045', '2023-04-22', 'Sales Associate',      28),

-- Store 29: Moody
(46, 'Leila',     'Okonkwo',       'leila.okonkwo@pendragon.com',      '(205) 401-5046', '2020-09-14', 'Store Manager',        29),
(47, 'Matteo',    'Abiodun',       'matteo.abiodun@pendragon.com',     '(205) 401-5047', '2023-06-27', 'Cashier',              29),

-- Store 30: Andalusia
(48, 'Seun',      'Holmberg',      'seun.holmberg@pendragon.com',      '(334) 401-5048', '2022-02-28', 'Store Manager',        30),
(49, 'Cleo',      'Nakamura',      'cleo.nakamura@pendragon.com',      '(334) 401-5049', '2023-08-14', 'Sales Associate',      30),

-- Store 31: Selma
(50, 'Adaeze',    'Petrov',        'adaeze.petrov@pendragon.com',      '(334) 401-5050', '2021-11-30', 'Store Manager',        31),
(51, 'Jerome',    'Osei',          'jerome.osei@pendragon.com',        '(334) 401-5051', '2023-03-15', 'Cashier',              31);

-- ============================================================
-- PART D — EMPLOYEE_PERFORMANCE TABLE
-- Annual reviews (one per employee per review year)
-- Rating: 1–10 | Category: Overall only for annual cadence
-- ReviewerID = the manager of each employee's store
-- ============================================================
CREATE TABLE Employee_Performance (
    PerformanceID   INT          NOT NULL AUTO_INCREMENT,
    EmployeeID      INT          NOT NULL,
    ReviewerID      INT          NOT NULL
                    COMMENT 'EmployeeID of the reviewing manager',
    ReviewDate      DATE         NOT NULL,
    ReviewYear      YEAR         NOT NULL,
    Rating          TINYINT      NOT NULL,
    Category        VARCHAR(50)  NOT NULL DEFAULT 'Overall',
    Notes           TEXT         NULL,
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
-- INSERT: Annual Performance Reviews (ReviewYear 2024)
-- All 51 employees — Georgia (1–11) + Alabama (12–51)
-- Managers self-review; associates reviewed by their manager
-- ============================================================

-- ----------------------------------------------------------
-- GEORGIA EMPLOYEES (1–11)
-- ----------------------------------------------------------
INSERT INTO Employee_Performance (EmployeeID, ReviewerID, ReviewDate, ReviewYear, Rating, Category, Notes) VALUES
(1,  1,  '2024-12-31', 2024, 9,  'Overall', 'Yukihiro delivered a consistently strong year at Store 1 in Atlanta. He maintained inventory accuracy above 98% all four quarters, introduced a new end-of-day reconciliation checklist that reduced discrepancies by 15%, and managed the holiday rush with exceptional planning. The store achieved its highest single-day revenue on record in Q4. His mentorship of junior staff was a noted strength and he is regarded as one of the most reliable store managers in the Georgia network.'),

(2,  2,  '2024-12-31', 2024, 8,  'Overall', 'Amara had a well-rounded year as Assistant Manager at Store 2 in Athens. She navigated a mid-year inventory backlog and resolved it without escalation, introduced a staff briefing routine that improved team cohesion, and coordinated a seasonal book drive that generated positive local press. A Q2 dip in inventory processing speed was the only notable area of concern, which she addressed promptly and did not recur. She ended the year with strong sales figures and team morale scores.'),

(3,  4,  '2024-12-31', 2024, 8,  'Overall', 'Diego showed clear growth across 2024 at Store 3 in Augusta. His product knowledge deepened significantly, his shelf management became more proactive, and his performance during the holiday season was commendable. He independently reorganized the Fiction section by sub-genre to positive customer feedback. Two missed training sessions in Q3 were noted, addressed professionally, and did not recur. His attitude and customer rapport are consistent strengths heading into 2025.'),

(4,  4,  '2024-12-31', 2024, 10, 'Overall', 'Fatima delivered an exceptional year at Store 4 in Macon. She maintained zero inventory discrepancies for the second consecutive year, piloted a cross-store book transfer program now being expanded network-wide, hosted a local author signing that drove a 22% foot traffic increase in September, and finished Q4 at 18% above revenue target — the highest quarterly result in the store''s history. She also informally mentored two assistant managers from neighboring stores during the holiday preparation period. Fatima is among the top performers in the entire Pendragon network.'),

(5,  5,  '2024-12-31', 2024, 7,  'Overall', 'Priya showed meaningful improvement over the course of 2024 at Store 5 in Savannah. Following Q1 cash handling errors and additional training, she maintained an error-free register record for the remainder of the year. She volunteered for an after-hours inventory count in Q3 and trained a seasonal holiday hire in Q4. Her confidence and accuracy improved consistently and she is well-positioned for further growth in 2025.'),

(6,  6,  '2024-12-31', 2024, 9,  'Overall', 'Elijah had an outstanding year as Inventory Specialist at Store 6 in Gainesville. He maintained a stock variance of under 0.5% all year, restructured the back-stock labeling system now adopted store-wide, flagged a supplier receiving error that saved an estimated $400 in overpayments, and managed the highest holiday shipment volume in store history without a single error. He volunteered extended hours during peak delivery weeks and was nominated for store-level Employee of the Quarter in Q4.'),

(7,  7,  '2024-12-31', 2024, 8,  'Overall', 'Ingrid managed Store 7 in Dalton with steady professionalism throughout 2024. She implemented a returns processing workflow that reduced handling time by 20%, organized a holiday children''s story-time event that boosted family-category sales, and met every operational target in Q4. A slight Q3 sales dip below target was flagged; Ingrid responded with community engagement programming that delivered results in Q4. She ends the year with three written customer commendations and strong team feedback.'),

(8,  9,  '2024-12-31', 2024, 8,  'Overall', 'Kofi had a strong and growth-filled year at Store 8 in Albany. He became fully self-sufficient in his closing duties by Q2, independently organized a voluntary in-store reading group that attracted loyal returning participants, and was the top-performing sales associate at his store during the holiday season with the highest personalized book recommendation conversion count. He also mentored a temporary holiday hire with patience and professionalism. His trajectory over the year is clearly upward.'),

(9,  9,  '2024-12-31', 2024, 10, 'Overall', 'Mei delivered a flawless year at Store 9 in Evans and is the top-rated manager in the Georgia network for 2024. She recorded zero stock discrepancies all year, the highest customer satisfaction scores across all Georgia stores in Q1, navigated a mid-year double staffing absence without any visible customer impact, and led a best-practices workshop attended by three neighboring stores. She surpassed every Q4 target and has been formally shortlisted for a regional lead role consideration in early 2025. An exceptional performer by every measure.'),

(10, 9,  '2024-12-31', 2024, 8,  'Overall', 'Aaliyah had a productive year in Customer Service at Store 10 in Swainsboro. She introduced a reservation follow-up call process that reduced no-show rates by 18%, managed the highest contact volume of the year during Q4 without a single escalated complaint, and handled multiple complex holiday return scenarios with diplomacy and precision. A brief Q2 email backlog was the only notable concern, resolved within two weeks. She is strongly recommended for a senior customer service designation.'),

(11, 11, '2024-12-31', 2024, 7,  'Overall', 'Rashid showed steady improvement throughout 2024 at Store 11 in Columbus. After Q1 register void issues and retraining, he maintained error-free accuracy for the remainder of the year. He was observed going above expectations with a visually impaired customer in Q3 and received two written customer compliments by name in Q4. His composure during holiday checkout lines was noted positively. Continued growth into 2025 is expected and encouraged.');

-- ----------------------------------------------------------
-- ALABAMA EMPLOYEES (12–51)
-- ----------------------------------------------------------
INSERT INTO Employee_Performance (EmployeeID, ReviewerID, ReviewDate, ReviewYear, Rating, Category, Notes) VALUES
-- Store 12: Birmingham
(12, 12, '2024-12-31', 2024, 9,  'Overall', 'Imani launched Store 12 in Birmingham to strong community reception and maintained that momentum all year. She drove above-forecast foot traffic through local outreach and bookclub partnerships, adapted well to early delegation feedback by Q3, and organized a community holiday reading event with an elementary school that generated significant positive press for the Pendragon brand. The store exceeded its holiday sales target by 14% and Imani enters 2025 as one of the strongest new store managers in the Alabama expansion.'),

(13, 12, '2024-12-31', 2024, 8,  'Overall', 'Devon had a solid first full year at Store 12 in Birmingham. He progressed from needing frequent system guidance in Q1 to operating independently by Q3 and flagging a recurring inventory miscount in the Biography section on his own initiative. His holiday performance was strong — he led all associates at his store in membership sign-ups. A clear upward trajectory with good product knowledge and growing customer confidence.'),

-- Store 13: Montgomery
(14, 14, '2024-12-31', 2024, 9,  'Overall', 'Yolanda managed Store 13 in Montgomery with consistency and cultural awareness throughout 2024. She coordinated a well-received Spanish-language Heritage Month display that measurably increased non-English title sales, ran structured monthly one-on-ones with her associate that visibly improved engagement, and submitted a detailed 2025 staffing proposal ahead of schedule. The store hit its Q4 target and Yolanda is regarded as a methodical, communicative, and reliable leader.'),

(15, 14, '2024-12-31', 2024, 7,  'Overall', 'Marcus had a growth-oriented year at Store 13 in Montgomery. After a rough Q1 adjustment period, he became error-free at the register by April and maintained that standard all year. He demonstrated composure during a register system outage in Q3, processing transactions manually without complaints. While his book catalog knowledge is still developing, his punctuality, accuracy, and patience with customers are consistent strengths. On track for continued improvement in 2025.'),

-- Store 14: Huntsville
(16, 16, '2024-12-31', 2024, 10, 'Overall', 'Priyanka is the highest-rated manager in the Alabama network for 2024 and one of the standout performers company-wide. Her Huntsville store posted the highest Alabama revenue for the year, she coordinated a STEM reading display tied to the city''s aerospace identity that increased science and technology sales by 31%, created an onboarding checklist now shared across all Alabama stores, and earned the highest customer satisfaction scores in the Alabama network for three consecutive quarters. She has been recommended for a regional mentorship role in 2025.'),

(17, 16, '2024-12-31', 2024, 8,  'Overall', 'Elliot delivered reliable and precise inventory work throughout 2024 at Store 14 in Huntsville. He developed a color-coded shelf label system adopted permanently by the store, maintained a stock accuracy rate above 99% all year, solo-managed a large mid-year shipment arrival during a manager conflict, and worked two voluntary days off during peak holiday weeks to ensure readiness. His accuracy, reliability, and quiet initiative are among the strongest inventory specialist qualities in the network.'),

-- Store 15: Mobile
(18, 18, '2024-12-31', 2024, 9,  'Overall', 'Celeste built an impressive community presence for Store 15 in Mobile during 2024. Her monthly book club partnership with a local community center grew to over 30 active members, whose patronage represents a measurable share of the store''s repeat customer base. She achieved 107% of Q4 revenue target, and her holiday display design was featured as a visual merchandising best practice in the regional newsletter. A minor reservation backlog in Q3 was the only area flagged and was resolved promptly.'),

(19, 18, '2024-12-31', 2024, 7,  'Overall', 'Jordan had a developmental year at Store 15 in Mobile. Q1 presented system learning challenges, but after coaching and retraining, he processed all subsequent returns correctly and improved his communication quality noticeably. By Q4 his reservation follow-up rate reached 100% — a significant turnaround from the year''s start. He managed Q4 customer service volume independently and with confidence. Celeste has recommended him for a formal Customer Service certification program in 2025.'),

-- Store 16: Tuscaloosa
(20, 20, '2024-12-31', 2024, 9,  'Overall', 'Amara managed Store 16 in Tuscaloosa with intelligence and adaptability in 2024. She capitalized on the university demographic effectively during the academic year, developed community outreach to offset the summer slowdown, and prepared welcome-back promotions that drove strong Q3 opening-semester results. Her end-of-year performance review process was praised by the team in the internal survey. Hassan''s visible improvement over the year reflects well on her mentorship and patience as a leader.'),

(21, 20, '2024-12-31', 2024, 7,  'Overall', 'Hassan grew considerably throughout 2024 at Store 16 in Tuscaloosa. He entered the year needing frequent shelf guidance and limited product knowledge; by year-end he was independently maintaining his sections, confidently answering genre-specific customer questions, and recording the highest number of membership conversions among associates at his store during the holiday season. His first written customer compliment arrived in Q4. A strong growth arc and a promising foundation for 2025.'),

-- Store 17: Auburn
(22, 22, '2024-12-31', 2024, 9,  'Overall', 'Saoirse managed Store 17 in Auburn with creativity and discipline throughout 2024. She introduced a pre-shift shelf audit routine that cut misplaced books by 40%, coordinated the store''s participation in a citywide summer reading challenge, managed solo store operations during a two-week associate absence with no service quality drop, and coordinated a holiday gift pairing display that drove a 23% lift in accessory attachment sales. Her operational and creative contributions alike were outstanding.'),

(23, 22, '2024-12-31', 2024, 7,  'Overall', 'Tobias had a year with some turbulence but finished strongly at Store 17 in Auburn. His register performance was consistently accurate outside of a Q3 personal absence period. Upon returning he reintegrated quickly with Saoirse''s support and managed the new holiday gift card redemption system without any additional instruction. His self-sufficiency and confidence have both clearly grown from the beginning of the year to the end. A positive foundation going into 2025.'),

-- Store 18: Decatur
(24, 24, '2024-12-31', 2024, 8,  'Overall', 'Nneka established Store 18 in Decatur as a stable and well-run location in its opening year. She focused early on operational fundamentals, developed a strong receiving workflow, and began community outreach in Q2 through partnerships with local libraries and civic organizations. She is methodical in her approach, communicates clearly with her team, and demonstrates consistent follow-through on both administrative and floor responsibilities. A reliable and growing presence in the Alabama network.'),

(25, 24, '2024-12-31', 2024, 7,  'Overall', 'Liam joined Store 18 in Decatur with enthusiasm and adapted to the bookstore environment steadily throughout the year. His customer interactions are warm and natural, he keeps his assigned sections tidy without prompting, and he has shown willingness to take on additional tasks when the store is short-handed. His product knowledge is expanding and Nneka has noted him as a dependable presence on the floor. On track for continued development in 2025.'),

-- Store 19: Gadsden
(26, 26, '2024-12-31', 2024, 9,  'Overall', 'Fatou had an impressive year leading Store 19 in Gadsden. She leveraged her Chamber of Commerce relationship into a joint local business appreciation event that brought in new first-time customers, secured a part-time staffing approval and onboarded the hire efficiently ahead of the holiday peak, and saw the store featured in the local business journal. She is methodical, professional, and deeply connected to the Gadsden community. Store 19 hit its annual revenue target and finished the year in strong health.'),

(27, 26, '2024-12-31', 2024, 8,  'Overall', 'Rowan had a strong and well-rounded year at Store 19 in Gadsden. Their product knowledge grew from early-year development into genuine expertise by Q3, and they became Fatou''s informal go-to for customer recommendation questions. They also took on additional floor responsibilities during the staffing hire process and were instrumental in onboarding the part-time associate. Fatou has formally recommended Rowan for a senior associate designation and they are on a clear upward trajectory.'),

-- Store 20: Anniston
(28, 28, '2024-12-31', 2024, 8,  'Overall', 'Keiko managed Store 20 in Anniston with community-centered leadership throughout 2024. Her tailored initial stock selection resulted in a higher-than-average sell-through rate in Q1, her middle school summer reading partnership generated lasting community goodwill and repeat family customers, and she tightened up the receiving process effectively in Q3 following a minor discrepancy. Store 19 finished 9% above its cumulative annual revenue target, a result that reflects her careful and people-first management approach.'),

(29, 28, '2024-12-31', 2024, 8,  'Overall', 'Damien had a solid year as Inventory Specialist at Store 20 in Anniston. He completed his software onboarding fully in Q2, identified six mis-shelved titles during a self-initiated shelf audit, and thoroughly documented a vendor packing slip discrepancy in Q3 that supported a successful supplier dispute. His Q4 accuracy remained strong through the heaviest shipment period of the year and he proactively flagged a Children''s section overstock risk before it became a floor problem. Encouraged to communicate issues more immediately rather than resolving first.'),

-- Store 21: Florence
(30, 30, '2024-12-31', 2024, 9,  'Overall', 'Anaya had an outstanding year at Store 21 in Florence. She launched a local author series that grew across three quarterly installments and culminated in a holiday edition that set a single-day foot traffic and revenue record for the store. Her community programming approach is being studied for replication at other Alabama locations. Operationally she maintained high standards throughout, Felix thrived under her consistent leadership, and the store finished the year as a model for community engagement in the Alabama network.'),

(31, 30, '2024-12-31', 2024, 9,  'Overall', 'Felix had a standout first full year at Store 21 in Florence. His register accuracy was consistently high from the outset, he managed solo register operations during a high-attendance author event without errors, took on light supervisory duties during a scheduled manager absence, proactively flagged a register calibration issue before it could cause problems, and was formally recognized by Anaya in the year-end staff meeting for his consistency and customer care. An exceptional first-year performance.'),

-- Store 22: Dothan
(32, 32, '2024-12-31', 2024, 8,  'Overall', 'Miriam laid a disciplined operational foundation for Store 22 in Dothan in its opening year. She focused Q1 on establishing robust backend processes before moving into community programming, developed nonprofit partnerships in Q2 and Q3 that have brought genuine goodwill and return visits to the store, and finished the year 8% above annual revenue target. Kwame''s growth across the year is a notable product of her consistent mentorship. Miriam is a thoughtful and steady leader with a clear long-term view.'),

(33, 32, '2024-12-31', 2024, 7,  'Overall', 'Kwame entered 2024 with limited retail experience and finished the year with a dependable skill set and genuine pride in his work. He went from needing frequent guidance on the shelf system in Q1 to independent operation and a self-initiated donation intake contribution by Q3. His holiday season performance required no prompting on any core duty and he recorded a membership conversion rate above the store average. Miriam sees real potential for a senior associate role in 2025 if a second hire joins the team.'),

-- Store 23: Opelika
(34, 34, '2024-12-31', 2024, 8,  'Overall', 'Sienna opened Store 23 in Opelika with calm authority and strong attention to detail. She established productive supplier relationships early, maintained clean operational records throughout the year, and focused on building a loyal local customer base through personalized service and well-curated displays. Her associate onboarded late in the year and Sienna''s structured introduction of store procedures ensured a smooth integration. She is regarded as a reliable and organized manager with a clear operational instinct.'),

(35, 34, '2024-12-31', 2024, 6,  'Overall', 'Caden joined Store 23 in Opelika in October and 2024 represents a short but foundational period. He adapted to the POS system faster than expected and showed genuine interest in the product catalog from day one. His customer interactions are polite and improving in confidence. Given his late-year start, a full performance picture will be available after 2025. Sienna''s initial assessment is encouraging and she expects him to develop steadily through Q1 and Q2 of next year.'),

-- Store 24: Cullman
(36, 36, '2024-12-31', 2024, 9,  'Overall', 'Zuri managed Store 24 in Cullman with consistent excellence throughout 2024. She developed a strong rapport with the local community early in the year and channeled it into a steady stream of new memberships and repeat customers. Her operational discipline is strong — no stock discrepancies were recorded all year — and she supports her associate''s development with structured, patient feedback. The store met its annual revenue target and Zuri is widely regarded as one of the more dependable managers in the Alabama network.'),

(37, 36, '2024-12-31', 2024, 7,  'Overall', 'Elena had a productive first full year at Store 24 in Cullman. She grew her product knowledge steadily under Zuri''s structured guidance and is now able to engage customers across multiple genres with confidence. Her shelf maintenance and documentation habits are consistent and she has demonstrated reliability during busy floor periods. She is encouraged to take more initiative in customer approach interactions rather than waiting to be spoken to. Good foundation for continued development in 2025.'),

-- Store 25: Jasper
(38, 38, '2024-12-31', 2024, 8,  'Overall', 'Tariq led Store 25 in Jasper with experience and calm professionalism throughout 2024. He established operational systems quickly, maintained a clean inventory record, and built the kind of quiet, reliable floor culture that retains customers. His associate is early in development and Tariq has been deliberate in structuring Amina''s growth. The store performed consistently against its targets all year. Tariq is a steady, unflashy manager whose value is reflected in the store''s operational health.'),

(39, 38, '2024-12-31', 2024, 6,  'Overall', 'Amina joined Store 25 in Jasper in May and spent 2024 in an active learning phase. Her register accuracy is acceptable and improving, her customer manner is friendly, and she takes feedback well. She required more hands-on guidance than average in her first few months, particularly around the inventory log, but made real progress by Q4. Tariq sees meaningful potential and expects a more complete performance picture in 2025 as Amina develops her independent working style.'),

-- Store 26: Alabaster
(40, 40, '2024-12-31', 2024, 8,  'Overall', 'Darius managed Store 26 in Alabaster with practicality and customer focus throughout 2024. He built a reliable daily routine early in the year that kept operations running smoothly and invested time in learning the local customer base''s reading preferences to inform the store''s display rotations. His associate joined late in the year and Darius has been thorough in introducing store systems and expectations. A consistent and dependable manager who delivers results without fanfare.'),

(41, 40, '2024-12-31', 2024, 6,  'Overall', 'Yuki joined Store 26 in Alabaster in November and 2024 captures only their first two months on the floor. They showed enthusiasm from day one and picked up the POS process more quickly than expected. Customer feedback in their early weeks has been positive. A full performance assessment will be available after they have completed a full quarter. Darius'' early impression is favorable and he anticipates strong development through the first half of 2025.'),

-- Store 27: Enterprise
(42, 42, '2024-12-31', 2024, 8,  'Overall', 'Chidinma opened Store 27 in Enterprise with energy and community awareness. She identified early that Enterprise has a strong military community connection given the proximity to Fort Novosel and used this insight to curate a relevant reading display that drove higher-than-average engagement from new customers. She is organized, communicative, and proactive in her approach to both operations and community outreach. A strong start to what appears to be a long-term contributor to the Alabama network.'),

(43, 42, '2024-12-31', 2024, 6,  'Overall', 'Rafael joined Store 27 in Enterprise in September and finished 2024 in an active onboarding phase. His register training was completed on schedule and he has shown genuine curiosity about the book catalog, frequently asking questions about titles and genres on his own initiative. Customer interactions are warm if sometimes brief. Chidinma expects a more complete performance picture after Q1 2025 and sees promise in his engaged and curious approach to the role.'),

-- Store 28: Talladega
(44, 44, '2024-12-31', 2024, 9,  'Overall', 'Nadia managed Store 28 in Talladega with strong leadership and a clear focus on customer experience throughout 2024. She developed a consistent floor culture of product knowledge and proactive service, coordinated a local reading display tied to the Talladega Superspeedway fan community that drove meaningful seasonal traffic, and maintained strong operational discipline all year. Her associate''s development under her guidance has been a highlight and the store finished the year above its revenue target. Nadia is a standout manager in the mid-Alabama network.'),

(45, 44, '2024-12-31', 2024, 7,  'Overall', 'Kofi had a steady first full year at Store 28 in Talladega. He adapted to the role with good humility and a willingness to learn, grew his product knowledge considerably under Nadia''s guidance, and became reliably self-sufficient in his core duties by mid-year. His customer interactions are warm and increasingly confident. He is encouraged to take more initiative in recommending titles without waiting for customers to ask first. A solid year with a good trajectory heading into 2025.'),

-- Store 29: Moody
(46, 46, '2024-12-31', 2024, 8,  'Overall', 'Leila has led Store 29 in Moody with consistency and operational focus since the store''s opening. She is one of the longer-tenured Alabama managers and her experience shows in the calm, efficient environment she maintains. She is methodical in her approach to scheduling, inventory, and community outreach, and her associate has responded well to her structured management style. The store delivered against its annual revenue target and Leila ends 2024 as a dependable pillar of the central Alabama store cluster.'),

(47, 46, '2024-12-31', 2024, 6,  'Overall', 'Matteo joined Store 29 in Moody in June and spent the second half of 2024 developing his foundation in the role. His register accuracy improved meaningfully after Q3 coaching from Leila and he has become comfortable with daily floor duties. Customer-facing skills are growing — he is encouraged to extend conversations beyond the transaction itself. Leila sees potential and is planning a structured development roadmap for Matteo heading into the first half of 2025.'),

-- Store 30: Andalusia
(48, 48, '2024-12-31', 2024, 8,  'Overall', 'Seun opened Store 30 in Andalusia with a thoughtful and unhurried approach that suits the community well. He prioritized relationship-building early in the year and has developed genuine connections with local repeat customers and civic organizations. Operationally the store has been clean and well-documented all year. His associate is early in their tenure and Seun has been patient and deliberate in her onboarding. The store is tracking positively and Seun is a manager whose quiet effectiveness should not be underestimated.'),

(49, 48, '2024-12-31', 2024, 6,  'Overall', 'Cleo joined Store 30 in Andalusia in August and her 2024 performance reflects an early but encouraging start. She learned the POS system within two weeks of joining, keeps her assigned area tidy without prompting, and responds to customer queries with a friendly and genuine warmth that Seun has noted positively. Her independent work habits are still forming and she will be the subject of a more comprehensive review after completing a full year in 2025. The early signs are good.'),

-- Store 31: Selma
(50, 50, '2024-12-31', 2024, 9,  'Overall', 'Adaeze managed Store 31 in Selma with cultural sensitivity and strong community instinct throughout 2024. Selma carries significant historical weight and Adaeze embraced this thoughtfully, organizing commemorative reading displays tied to local heritage events that were deeply appreciated by the community and drove meaningful engagement. Operationally she maintained high standards all year and her associate''s development reflected the care she puts into her mentorship. The store exceeded expectations for its first full year and Adaeze is a valued and distinctive voice in the Alabama network.'),

(51, 50, '2024-12-31', 2024, 7,  'Overall', 'Jerome joined Store 31 in Selma in March and had a solid developmental year under Adaeze''s mentorship. He progressed from needing support on basic register and shelving tasks in Q1 to operating independently with good accuracy by Q3. He assisted with the heritage reading display setups with attention and care, demonstrating pride in the store''s community role. His customer service confidence is growing and Adaeze expects him to step more fully into the role''s potential through 2025 with continued structured guidance.');

-- ============================================================
-- VERIFICATION QUERIES
-- ============================================================

-- All Alabama stores with city, address, phone, and email
SELECT
    s.StoreID,
    l.City,
    l.ZipCode,
    s.Street,
    s.PhoneNumber,
    s.Email
FROM Stores s
JOIN Locations l ON s.ZipCode = l.ZipCode
WHERE l.State = 'Alabama'
ORDER BY s.StoreID;

-- All Alabama employees with store city and role
SELECT
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS FullName,
    e.Role,
    l.City,
    e.PhoneNumber,
    e.HireDate
FROM Employees e
JOIN Stores    s ON e.StoreID  = s.StoreID
JOIN Locations l ON s.ZipCode  = l.ZipCode
WHERE l.State = 'Alabama'
ORDER BY e.StoreID, e.EmployeeID;

-- Annual performance rankings — all 51 employees, sorted by rating
SELECT
    p.Rating,
    CONCAT(e.FirstName, ' ', e.LastName)        AS FullName,
    e.Role,
    l.City,
    l.State,
    CONCAT(r.FirstName, ' ', r.LastName)        AS ReviewedBy,
    p.ReviewDate
FROM Employee_Performance p
JOIN Employees e  ON p.EmployeeID  = e.EmployeeID
JOIN Employees r  ON p.ReviewerID  = r.EmployeeID
JOIN Stores    s  ON e.StoreID     = s.StoreID
JOIN Locations l  ON s.ZipCode     = l.ZipCode
WHERE p.ReviewYear = 2024
ORDER BY p.Rating DESC, l.State, l.City;

-- Summary row counts
SELECT 'Locations'            AS TableName, COUNT(*) AS TotalRows FROM Locations            UNION ALL
SELECT 'Stores'               AS TableName, COUNT(*) AS TotalRows FROM Stores               UNION ALL
SELECT 'Employees'            AS TableName, COUNT(*) AS TotalRows FROM Employees            UNION ALL
SELECT 'Employee_Performance' AS TableName, COUNT(*) AS TotalRows FROM Employee_Performance;