-- ============================================================
-- Pendragon Bookstore Database
-- Expanded Authors Table — Additional Entries
-- Platform: MySQL
-- ============================================================

USE pendragon_bookstore;

-- ============================================================
-- INSERT: Additional Authors (IDs 12–61)
-- Diverse names spanning many nationalities and backgrounds
-- No stereotypical name-nationality pairings
-- ============================================================
INSERT IGNORE INTO Authors (AuthorID, FirstName, LastName, Nationality, BirthDate) VALUES

-- 12–21: Mixed backgrounds, varied regions
(12, 'Saoirse',    'Oduya',        'Irish-Nigerian',        '1987-06-14'),
(13, 'Dmitri',     'Nakashima',    'Russian-Japanese',      '1974-11-02'),
(14, 'Valentina',  'Achebe',       'Italian-Ghanaian',      '1993-03-27'),
(15, 'Eamon',      'Delacroix',    'Canadian',              '1969-08-19'),
(16, 'Zara',       'Lindström',    'Swedish-Somali',        '1991-01-30'),
(17, 'Kwabena',    'Ferreira',     'Ghanaian-Brazilian',    '1982-05-11'),
(18, 'Adaeze',     'Svensson',     'Nigerian-Swedish',      '1996-09-08'),
(19, 'Tomás',      'Ikeda',        'Irish-Japanese',        '1978-12-22'),
(20, 'Nneka',      'Ostrowski',    'Nigerian-Polish',       '1985-07-04'),
(21, 'Rowan',      'Mbeki',        'Scottish-South African','1990-04-16'),

-- 22–31: East Asian, South Asian, Southeast Asian backgrounds
(22, 'Haruki',     'Solberg',      'Japanese-Norwegian',    '1976-02-09'),
(23, 'Divya',      'Castellanos',  'Indian-Spanish',        '1988-10-23'),
(24, 'Minh',       'Abara',        'Vietnamese-Nigerian',   '1994-06-05'),
(25, 'Sunita',     'Kowalczyk',    'Indian-Polish',         '1971-03-18'),
(26, 'Jae-won',    'Osei',         'Korean-Ghanaian',       '1983-08-30'),
(27, 'Laleh',      'Christiansen', 'Iranian-Danish',        '1995-01-12'),
(28, 'Ravi',       'Johansson',    'Sri Lankan-Swedish',    '1967-11-27'),
(29, 'Ying',       'Nkemdirim',    'Chinese-Nigerian',      '1992-04-03'),
(30, 'Farrukh',    'Brennan',      'Uzbek-Irish',           '1980-09-15'),
(31, 'Ananya',     'Visser',       'Indian-Dutch',          '1997-07-21'),

-- 32–41: Latin American, Caribbean, and Afro-Latin backgrounds
(32, 'Xiomara',    'Lindqvist',    'Cuban-Swedish',         '1986-12-08'),
(33, 'Danilo',     'Eze',          'Brazilian-Nigerian',    '1973-05-24'),
(34, 'Yara',       'Björk',        'Venezuelan-Icelandic',  '1991-02-17'),
(35, 'Marisol',    'Takahashi',    'Puerto Rican-Japanese', '1984-10-01'),
(36, 'Emeka',      'Rodrigues',    'Nigerian-Portuguese',   '1977-06-29'),
(37, 'Catalina',   'Okafor',       'Colombian-Nigerian',    '1998-03-14'),
(38, 'Leandro',    'Mensah',       'Argentine-Ghanaian',    '1969-08-06'),
(39, 'Simone',     'Abubakar',     'Haitian-Nigerian',      '1993-11-19'),
(40, 'Rafael',     'Anand',        'Mexican-Indian',        '1981-01-08'),
(41, 'Nadia',      'Ferreira',     'Dominican-Brazilian',   '1975-04-22'),

-- 42–51: Middle Eastern, Central Asian, and North African backgrounds
(42, 'Yasmine',    'Petrov',       'Algerian-Russian',      '1989-07-17'),
(43, 'Tariq',      'Holmberg',     'Moroccan-Swedish',      '1972-09-03'),
(44, 'Leila',      'Okonkwo',      'Lebanese-Nigerian',     '1994-12-26'),
(45, 'Arash',      'Nwosu',        'Iranian-Nigerian',      '1968-05-09'),
(46, 'Nour',       'Christiansen', 'Egyptian-Danish',       '1996-02-14'),
(47, 'Cyrus',      'Abiodun',      'Persian-Yoruba',        '1980-10-31'),
(48, 'Dina',       'Magnusson',    'Jordanian-Swedish',     '1987-06-22'),
(49, 'Samir',      'Kowalski',     'Tunisian-Polish',       '1976-03-05'),
(50, 'Farida',     'Nakamura',     'Afghan-Japanese',       '1991-08-18'),
(51, 'Khalid',     'Dubois',       'Saudi-French',          '1983-01-29'),

-- 52–61: Indigenous, Pacific Islander, and further mixed backgrounds
(52, 'Aroha',      'Mensah',       'Māori-Ghanaian',        '1992-04-11'),
(53, 'Tūhoe',      'Petersen',     'Māori-Danish',          '1978-09-25'),
(54, 'Kainoa',     'Abebe',        'Hawaiian-Ethiopian',    '1985-12-03'),
(55, 'Moana',      'Ferreira',     'Polynesian-Brazilian',  '1997-06-17'),
(56, 'Ezinne',     'Larsson',      'Igbo-Swedish',          '1974-02-28'),
(57, 'Chisom',     'Andersen',     'Nigerian-Danish',       '1990-10-14'),
(58, 'Amahle',     'Kowalczyk',    'Zulu-Polish',           '1988-07-07'),
(59, 'Tendai',     'Björnsson',    'Zimbabwean-Icelandic',  '1971-03-21'),
(60, 'Oluwaseun',  'Petrov',       'Yoruba-Russian',        '1995-11-09'),
(61, 'Kehinde',    'Sørensen',     'Nigerian-Danish',       '1982-05-30');

-- ============================================================
-- Verify: Full Author roster after expansion
-- ============================================================
SELECT
    AuthorID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Nationality,
    BirthDate
FROM Authors
ORDER BY AuthorID;

-- Count summary
SELECT COUNT(*) AS TotalAuthors FROM Authors;