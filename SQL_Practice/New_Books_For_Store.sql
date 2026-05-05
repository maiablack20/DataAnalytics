-- ============================================================
-- Pendragon Bookstore Database
-- Standalone Genre Reference Table with Book Listings
-- Platform: MySQL
-- ============================================================

USE pendragon_bookstore;

-- ============================================================
-- Table: Genres
-- Standalone reference table — no foreign key changes to Books
-- ============================================================
DROP TABLE IF EXISTS Genre_Books;
DROP TABLE IF EXISTS Genres;

CREATE TABLE Genres (
    GenreID       INT          NOT NULL AUTO_INCREMENT,
    GenreName     VARCHAR(100) NOT NULL,
    Description   TEXT         NULL,
    CONSTRAINT pk_Genres PRIMARY KEY (GenreID),
    CONSTRAINT uq_Genres_Name UNIQUE (GenreName)
);

-- ============================================================
-- Table: Genre_Books
-- Links genres to book titles and authors (standalone reference)
-- Mix of real and fictional titles per genre
-- ============================================================
CREATE TABLE Genre_Books (
    GenreBookID   INT           NOT NULL AUTO_INCREMENT,
    GenreID       INT           NOT NULL,
    Title         VARCHAR(255)  NOT NULL,
    Author        VARCHAR(150)  NOT NULL,
    PublishedYear YEAR          NULL,
    IsReal        TINYINT(1)    NOT NULL DEFAULT 1
                  COMMENT '1 = real published title, 0 = fictional/invented title',
    CONSTRAINT pk_Genre_Books PRIMARY KEY (GenreBookID),
    CONSTRAINT fk_GenreBooks_GenreID FOREIGN KEY (GenreID)
        REFERENCES Genres(GenreID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE INDEX idx_GenreBooks_GenreID ON Genre_Books(GenreID);

-- ============================================================
-- INSERT: Genres
-- ============================================================
INSERT INTO Genres (GenreID, GenreName, Description) VALUES
(1, 'Classical Literature', 'Enduring works of literary fiction and prose widely regarded as foundational to the Western and world literary canon, typically published before the 20th century.'),
(2, 'Science Fiction',      'Speculative fiction exploring futuristic science, technology, space travel, time, parallel universes, and extraterrestrial life.'),
(3, 'Mystery & Thriller',   'Fiction centered on suspense, crime, and the solving of puzzles or dangerous situations, often featuring detectives, spies, or ordinary people in peril.'),
(4, 'Romance',              'Fiction focused on romantic relationships and emotional journeys, typically ending with an optimistic or happy conclusion.'),
(5, 'Fantasy',              'Fiction set in imaginary worlds with magical systems, mythical creatures, and epic quests beyond the bounds of reality.'),
(6, 'Horror',               'Fiction designed to frighten, unsettle, or disturb through supernatural elements, psychological terror, or graphic violence.'),
(7, 'Self-Help / Non-Fiction', 'Non-fiction works aimed at personal development, productivity, psychology, and practical life improvement.');

-- ============================================================
-- INSERT: Genre_Books — Classical Literature (15 titles)
-- 8 real | 7 fictional
-- ============================================================
INSERT INTO Genre_Books (GenreID, Title, Author, PublishedYear, IsReal) VALUES

-- Real titles
(1, 'Pride and Prejudice',                    'Jane Austen',            1813, 1),
(1, 'Crime and Punishment',                   'Fyodor Dostoevsky',       1866, 1),
(1, 'Don Quixote',                            'Miguel de Cervantes',     1605, 1),
(1, 'Madame Bovary',                          'Gustave Flaubert',        1857, 1),
(1, 'Anna Karenina',                          'Leo Tolstoy',             1878, 1),
(1, 'Great Expectations',                     'Charles Dickens',         1861, 1),
(1, 'The Scarlet Letter',                     'Nathaniel Hawthorne',     1850, 1),
(1, 'Jane Eyre',                              'Charlotte Brontë',        1847, 1),

-- Fictional (invented) titles
(1, 'The Hollow Cathedral',                   'Edmund Ashworth',         1872, 0),
(1, 'Letters to No One in Particular',        'Marguerite Fontenay',     1849, 0),
(1, 'A Season of Dust and Silence',           'Tobias Grenville',        1903, 0),
(1, 'The Governess of Aldermoor House',       'Helena Voss',             1861, 0),
(1, 'Beneath the Ivory Clock',                'Sebastien Moreau',        1888, 0),
(1, 'The Wandering Sons of Castile',          'Rafael Dominguez',        1834, 0),
(1, 'When Rivers Forget Their Names',         'Cecilia Hartwell',        1891, 0);

-- ============================================================
-- INSERT: Genre_Books — Science Fiction (15 titles)
-- 8 real | 7 fictional
-- ============================================================
INSERT INTO Genre_Books (GenreID, Title, Author, PublishedYear, IsReal) VALUES

-- Real titles
(2, 'Dune',                                   'Frank Herbert',           1965, 1),
(2, 'Neuromancer',                            'William Gibson',          1984, 1),
(2, 'The Left Hand of Darkness',              'Ursula K. Le Guin',       1969, 1),
(2, 'Ender''s Game',                          'Orson Scott Card',        1985, 1),
(2, 'The Martian Chronicles',                 'Ray Bradbury',            1950, 1),
(2, 'Foundation',                             'Isaac Asimov',            1951, 1),
(2, 'Childhood''s End',                       'Arthur C. Clarke',        1953, 1),
(2, 'The Hitchhiker''s Guide to the Galaxy',  'Douglas Adams',           1979, 1),

-- Fictional (invented) titles
(2, 'Signal Ghost',                           'Petra Osei-Kuffour',      2031, 0),
(2, 'The Helium Gardens of Titan',            'Ravi Subramaniam',        2019, 0),
(2, 'Last Orbit',                             'Cade Morrow',             2022, 0),
(2, 'Echoes from the Outer Drift',            'Yuna Holloway',           2028, 0),
(2, 'When the Sun Blinks Twice',              'Desmond Farquhar',        2015, 0),
(2, 'The Synthetic Shepherd',                 'Lena Volkov',             2020, 0),
(2, 'Beyond the Kessler Belt',                'Omar Adekunle',           2033, 0);

-- ============================================================
-- INSERT: Genre_Books — Mystery & Thriller (15 titles)
-- 8 real | 7 fictional
-- ============================================================
INSERT INTO Genre_Books (GenreID, Title, Author, PublishedYear, IsReal) VALUES

-- Real titles
(3, 'The Hound of the Baskervilles',          'Arthur Conan Doyle',      1902, 1),
(3, 'And Then There Were None',               'Agatha Christie',         1939, 1),
(3, 'The Girl with the Dragon Tattoo',        'Stieg Larsson',           2005, 1),
(3, 'Gone Girl',                              'Gillian Flynn',           2012, 1),
(3, 'In the Woods',                           'Tana French',             2007, 1),
(3, 'The Big Sleep',                          'Raymond Chandler',        1939, 1),
(3, 'Rebecca',                                'Daphne du Maurier',       1938, 1),
(3, 'Sharp Objects',                          'Gillian Flynn',           2006, 1),

-- Fictional (invented) titles
(3, 'The Meridian Confession',                'Harper Langley',          2018, 0),
(3, 'Cold Harbor',                            'Nadia Sinclair',          2021, 0),
(3, 'The Last Witness on Rue Devlin',         'Thierry Beaumont',        2014, 0),
(3, 'Ink and Bone',                           'Cassidy Marlowe',         2019, 0),
(3, 'The Harrow Files',                       'Winston Okeke',           2023, 0),
(3, 'Stillwater',                             'Fiona Callahan',          2016, 0),
(3, 'No Exit from Elmsdale',                  'Reid Ashford',            2020, 0);

-- ============================================================
-- INSERT: Genre_Books — Romance (15 titles)
-- 8 real | 7 fictional
-- ============================================================
INSERT INTO Genre_Books (GenreID, Title, Author, PublishedYear, IsReal) VALUES

-- Real titles
(4, 'Outlander',                              'Diana Gabaldon',          1991, 1),
(4, 'The Notebook',                           'Nicholas Sparks',         1996, 1),
(4, 'Me Before You',                          'Jojo Moyes',              2012, 1),
(4, 'The Hating Game',                        'Sally Thorne',            2016, 1),
(4, 'It Ends with Us',                        'Colleen Hoover',          2016, 1),
(4, 'Bridgerton: The Duke and I',             'Julia Quinn',             2000, 1),
(4, 'The Kiss Quotient',                      'Helen Hoang',             2018, 1),
(4, 'Beach Read',                             'Emily Henry',             2020, 1),

-- Fictional (invented) titles
(4, 'Every Summer Until Now',                 'Isabelle Marchetti',      2021, 0),
(4, 'The Space Between Our Silences',         'Priya Anand',             2022, 0),
(4, 'When We Were Strangers in Paris',        'Chloe Fontenot',          2019, 0),
(4, 'A Letter Left in October',               'Jada Whitmore',           2023, 0),
(4, 'The Tide Remembers You',                 'Ethan Calloway',          2020, 0),
(4, 'Borrowed Tuesdays',                      'Miriam Osei',             2018, 0),
(4, 'Wildflower Wreckage',                    'Sadie Brennan',           2024, 0);

-- ============================================================
-- INSERT: Genre_Books — Fantasy (15 titles)
-- 8 real | 7 fictional
-- ============================================================
INSERT INTO Genre_Books (GenreID, Title, Author, PublishedYear, IsReal) VALUES

-- Real titles
(5, 'The Fellowship of the Ring',             'J.R.R. Tolkien',          1954, 1),
(5, 'A Game of Thrones',                      'George R.R. Martin',      1996, 1),
(5, 'The Name of the Wind',                   'Patrick Rothfuss',        2007, 1),
(5, 'The Way of Kings',                       'Brandon Sanderson',       2010, 1),
(5, 'American Gods',                          'Neil Gaiman',             2001, 1),
(5, 'The Lies of Locke Lamora',               'Scott Lynch',             2006, 1),
(5, 'Mistborn: The Final Empire',             'Brandon Sanderson',       2006, 1),
(5, 'Jonathan Strange & Mr Norrell',          'Susanna Clarke',          2004, 1),

-- Fictional (invented) titles
(5, 'The Crown of Ash and Ember',             'Solène Vaubrun',          2022, 0),
(5, 'Tides of the Unmade World',              'Callum Braith',           2020, 0),
(5, 'Where the Warden Walks',                 'Nyima Oduya',             2023, 0),
(5, 'The Gilded Labyrinth',                   'Aurelia Cross',           2019, 0),
(5, 'Bloodroot and Iron',                     'Soren Halverson',         2021, 0),
(5, 'The Pale Cartographer',                  'Wren Ashby',              2018, 0),
(5, 'Seven Spells for the Forgotten King',    'Isadora Venn',            2024, 0);

-- ============================================================
-- INSERT: Genre_Books — Horror (15 titles)
-- 8 real | 7 fictional
-- ============================================================
INSERT INTO Genre_Books (GenreID, Title, Author, PublishedYear, IsReal) VALUES

-- Real titles
(6, 'The Shining',                            'Stephen King',            1977, 1),
(6, 'Dracula',                                'Bram Stoker',             1897, 1),
(6, 'Frankenstein',                           'Mary Shelley',            1818, 1),
(6, 'House of Leaves',                        'Mark Z. Danielewski',     2000, 1),
(6, 'It',                                     'Stephen King',            1986, 1),
(6, 'Mexican Gothic',                         'Silvia Moreno-Garcia',    2020, 1),
(6, 'The Haunting of Hill House',             'Shirley Jackson',         1959, 1),
(6, 'Bird Box',                               'Josh Malerman',           2014, 1),

-- Fictional (invented) titles
(6, 'The Pale Below',                         'Alistair Gorm',           2021, 0),
(6, 'Nest of the Hollow Men',                 'Dara Vane',               2019, 0),
(6, 'What Lives in the Salting House',        'Colm Devereux',           2022, 0),
(6, 'The Tenant in Room Nine',                'Mara Aldridge',           2017, 0),
(6, 'Teeth of the Old Forest',                'Sasha Weir',              2020, 0),
(6, 'The Undertow Hour',                      'Felix Crane',             2023, 0),
(6, 'Nothing Comes Back from Millbrook Lane', 'Niamh Cassidy',           2018, 0);

-- ============================================================
-- INSERT: Genre_Books — Self-Help / Non-Fiction (15 titles)
-- 8 real | 7 fictional
-- ============================================================
INSERT INTO Genre_Books (GenreID, Title, Author, PublishedYear, IsReal) VALUES

-- Real titles
(7, 'Atomic Habits',                          'James Clear',             2018, 1),
(7, 'Thinking, Fast and Slow',                'Daniel Kahneman',         2011, 1),
(7, 'The Power of Now',                       'Eckhart Tolle',           1997, 1),
(7, 'Educated',                               'Tara Westover',           2018, 1),
(7, 'Becoming',                               'Michelle Obama',          2018, 1),
(7, 'Deep Work',                              'Cal Newport',             2016, 1),
(7, 'Man''s Search for Meaning',              'Viktor E. Frankl',        1946, 1),
(7, 'The Body Keeps the Score',               'Bessel van der Kolk',     2014, 1),

-- Fictional (invented) titles
(7, 'The Quiet Overhaul',                     'Renata Solano',           2022, 0),
(7, 'Unlearn the Noise',                      'Jerome Whitfield',        2020, 0),
(7, 'Margins: Making Space for What Matters', 'Adaeze Nwosu',            2021, 0),
(7, 'The Deliberate Life',                    'Suki Tanaka',             2023, 0),
(7, 'Small Pivots, Big Shifts',               'Marcus Oyelaran',         2019, 0),
(7, 'The Art of Not Knowing',                 'Elaine Broderick',        2022, 0),
(7, 'Anchored: Finding Focus in Chaos',       'Damien Cross',            2024, 0);

-- ============================================================
-- Verify
-- ============================================================
SELECT
    g.GenreID,
    g.GenreName,
    COUNT(gb.GenreBookID)                                        AS TotalBooks,
    SUM(gb.IsReal)                                               AS RealTitles,
    COUNT(gb.GenreBookID) - SUM(gb.IsReal)                       AS FictionalTitles
FROM Genres g
JOIN Genre_Books gb ON g.GenreID = gb.GenreID
GROUP BY g.GenreID, g.GenreName
ORDER BY g.GenreID;

SELECT
    g.GenreName,
    gb.Title,
    gb.Author,
    gb.PublishedYear,
    IF(gb.IsReal = 1, 'Real', 'Fictional') AS TitleType
FROM Genre_Books gb
JOIN Genres g ON gb.GenreID = g.GenreID
ORDER BY g.GenreID, gb.IsReal DESC, gb.PublishedYear;
