-- ============================================================
-- Pendragon Bookstore Database
-- Part A: Returns Notes — Updated to Include Novel Title(s)
-- Part B: New Accessories Table with Inventory & Order Support
-- Platform: MySQL
-- ============================================================

USE pendragon_bookstore;

-- ============================================================
-- PART A: UPDATE Returns.Notes to include the novel title
-- All 61 return records updated — book title embedded naturally
-- ============================================================

UPDATE Returns SET Notes = 'Customer reported that "Echoes of the Savanna" arrived with a torn cover and several water-damaged pages. Replacement was issued and the damaged copy of "Echoes of the Savanna" was pulled from inventory.' WHERE ReturnID = 1;

UPDATE Returns SET Notes = 'Customer received a copy of "Cliffs of Connemara" instead of the ordered title "The Cartographer\'s Secret". The correct copy of "The Cartographer\'s Secret" was located in store and exchanged immediately.' WHERE ReturnID = 2;

UPDATE Returns SET Notes = 'Customer decided they were no longer interested in "Roots of Gold" after reading the first chapter. The return of "Roots of Gold" was accepted within the 7-day return window and a store credit was issued.' WHERE ReturnID = 3;

UPDATE Returns SET Notes = 'Customer accidentally placed two separate orders for "Beneath the Agave Moon" on the same day. The second order of "Beneath the Agave Moon" was identified as a duplicate and fully refunded upon return of the unopened copy.' WHERE ReturnID = 4;

UPDATE Returns SET Notes = 'The spine of "The Lavender District" was cracked and pages were loose upon opening the package. Customer provided photos as evidence. Full refund was processed and "The Lavender District" was removed from active inventory.' WHERE ReturnID = 5;

UPDATE Returns SET Notes = 'Customer stated "Storm of Cherry Blossoms" did not match the online description and felt misrepresented. Manager reviewed the complaint regarding "Storm of Cherry Blossoms" and approved a partial store credit as resolution.' WHERE ReturnID = 6;

UPDATE Returns SET Notes = 'Customer ordered "The Saffron Path" but received "A Garden in Devonshire" instead. An inventory discrepancy between "The Saffron Path" and "A Garden in Devonshire" was logged and reported to the Inventory Specialist. The correct title was shipped same day.' WHERE ReturnID = 7;

UPDATE Returns SET Notes = 'Customer purchased "Cliffs of Connemara" as a gift but the recipient already owned a copy. The return of "Cliffs of Connemara" was processed within the allowed return period and the original payment method was refunded in full.' WHERE ReturnID = 8;

UPDATE Returns SET Notes = 'Customer found "Shadows Over Seville" had missing pages between chapters 4 and 7. The defective copy of "Shadows Over Seville" was quarantined and sent back to the publisher for review. Customer was offered a replacement or refund.' WHERE ReturnID = 9;

UPDATE Returns SET Notes = 'Customer\'s online session timed out mid-checkout, causing a duplicate charge for "The Lagos Chronicles". Both transactions for "The Lagos Chronicles" were verified and the duplicate payment was reversed promptly.' WHERE ReturnID = 10;

UPDATE Returns SET Notes = 'Customer reported that "A Garden in Devonshire" contained a printing error where pages 45 through 60 were repeated twice and pages 61 through 75 were missing entirely. The publisher was notified about the defective run of "A Garden in Devonshire".' WHERE ReturnID = 11;

UPDATE Returns SET Notes = 'Customer reported that "The Cork and the Tide" arrived with water damage to the cover and first thirty pages. A replacement copy of "The Cork and the Tide" was issued from in-store stock.' WHERE ReturnID = 12;

UPDATE Returns SET Notes = 'Customer received "Drift Without Anchor" instead of the title they ordered. The correct book was retrieved from back stock and exchanged for "Drift Without Anchor" with an apology.' WHERE ReturnID = 13;

UPDATE Returns SET Notes = 'Customer decided "The Vermillion Accord" was not what they expected based on the cover description. The return of "The Vermillion Accord" was accepted within the 7-day window and store credit was issued.' WHERE ReturnID = 14;

UPDATE Returns SET Notes = 'Customer placed two identical orders for "Pale Roads to Fenwick" during a website session error. The second copy of "Pale Roads to Fenwick" was returned unopened and a full refund was processed.' WHERE ReturnID = 15;

UPDATE Returns SET Notes = '"Between Dust and Longitude" had a cracked spine and loose pages upon delivery. Customer submitted photographic evidence of the damage to "Between Dust and Longitude" and a full replacement was shipped within two business days.' WHERE ReturnID = 16;

UPDATE Returns SET Notes = 'Customer felt "The Lantern Fisherman" did not align with the summary provided on the website. Manager reviewed the listing for "The Lantern Fisherman" and approved a partial store credit as resolution.' WHERE ReturnID = 17;

UPDATE Returns SET Notes = '"Salt and Inheritance" was sent to the wrong customer due to a mislabeled shipping slip. The copy of "Salt and Inheritance" was returned by the incorrect recipient and re-routed to the correct customer.' WHERE ReturnID = 18;

UPDATE Returns SET Notes = 'Customer purchased "The Amber Cartography" as a birthday gift but the recipient preferred a different genre. The return of "The Amber Cartography" was processed and the original payment method was refunded in full.' WHERE ReturnID = 19;

UPDATE Returns SET Notes = '"What the Monsoon Leaves Behind" was found to have pages 88 through 102 printed completely blank. The defective copy of "What the Monsoon Leaves Behind" was quarantined and the publisher was notified for quality review.' WHERE ReturnID = 20;

UPDATE Returns SET Notes = 'Customer was double-charged for "Seventeen Silences" due to a payment gateway timeout. Both transactions for "Seventeen Silences" were verified and the duplicate charge was reversed within 24 hours.' WHERE ReturnID = 21;

UPDATE Returns SET Notes = 'Customer reported that "The Cartographer of Lost Seasons" contained a misbound section where chapters 6 and 7 appeared in reverse order. Publisher was contacted about "The Cartographer of Lost Seasons" and a corrected copy was issued.' WHERE ReturnID = 22;

UPDATE Returns SET Notes = '"Borrowed Sun" arrived with a torn back cover and a broken spine. Customer was offered either a replacement or a full refund for "Borrowed Sun" and chose the replacement option.' WHERE ReturnID = 23;

UPDATE Returns SET Notes = 'Customer ordered "The Red Bridge Letters" but received "Unmapped" instead. The store inventory log was updated to reflect the misplacement between "The Red Bridge Letters" and "Unmapped" and the correct title was dispatched same day.' WHERE ReturnID = 24;

UPDATE Returns SET Notes = 'Customer read the first few chapters of "Unmapped" and decided it was not the right fit for their personal development goals. A full store credit was issued for the return of "Unmapped" per policy.' WHERE ReturnID = 25;

UPDATE Returns SET Notes = 'A technical error on the online checkout page resulted in two separate charges for "The Weight of Open Water". The duplicate order of "The Weight of Open Water" was cancelled and the payment reversed promptly.' WHERE ReturnID = 26;

UPDATE Returns SET Notes = '"Mirrors in the Fog" had extensive yellowing and mold spotting consistent with improper storage. The copy of "Mirrors in the Fog" was removed from inventory and a quality report was filed with the warehouse.' WHERE ReturnID = 27;

UPDATE Returns SET Notes = 'Customer stated "The Final Garden" did not reflect the romantic tone advertised. After manager review of the return for "The Final Garden", a partial refund was approved and the customer retained the book.' WHERE ReturnID = 28;

UPDATE Returns SET Notes = '"Echoes from the Pearl River" was incorrectly labeled as a different title in the store system. The shelving error affecting "Echoes from the Pearl River" was corrected and the customer was given a full exchange.' WHERE ReturnID = 29;

UPDATE Returns SET Notes = 'Customer purchased "A Thousand Small Departures" as a gift but was informed the recipient already had a copy. The return of "A Thousand Small Departures" was accepted within the allowed window and the original payment was refunded.' WHERE ReturnID = 30;

UPDATE Returns SET Notes = '"Where the Tulips Fell" was received with a severely bent cover and water stains on the first twenty pages. A replacement copy of "Where the Tulips Fell" was issued from in-store stock the same day.' WHERE ReturnID = 31;

UPDATE Returns SET Notes = 'Customer accidentally submitted "The Havana Frequency" twice during an unstable internet session. One order of "The Havana Frequency" was cancelled immediately and the charge was reversed.' WHERE ReturnID = 32;

UPDATE Returns SET Notes = 'Customer reported "Children of the Caatinga" contained a printing error causing entire paragraphs to repeat across three consecutive pages. The publisher was contacted about "Children of the Caatinga" and a corrected copy was ordered.' WHERE ReturnID = 33;

UPDATE Returns SET Notes = '"Glacier Song" poetry collection arrived with the cover detached from the binding. Customer was offered a replacement for "Glacier Song" and the damaged copy was returned to the distributor.' WHERE ReturnID = 34;

UPDATE Returns SET Notes = 'Customer ordered "The Ceiba and the Storm" but received "Unfinished Atlas" instead. The mix-up between "The Ceiba and the Storm" and "Unfinished Atlas" was traced to a warehouse scanning error which was logged and corrected.' WHERE ReturnID = 35;

UPDATE Returns SET Notes = 'Customer felt "Unfinished Atlas" was too academic in tone for their reading preferences. The return of "Unfinished Atlas" was accepted and a full refund was applied to the original payment method.' WHERE ReturnID = 36;

UPDATE Returns SET Notes = '"The Bogotá Inheritance" was ordered twice within minutes due to a browser back-button issue. The second order of "The Bogotá Inheritance" was flagged and cancelled before shipping with no charge applied.' WHERE ReturnID = 37;

UPDATE Returns SET Notes = '"Roots in the Pampas" arrived with pages 201 through 215 stuck together due to a binding adhesive error. Customer requested a replacement for "Roots in the Pampas" and the defective copy was sent back to the publisher.' WHERE ReturnID = 38;

UPDATE Returns SET Notes = 'Customer disputed that "The Port-au-Prince Journals" was misrepresented as historical non-fiction when it contained narrative embellishments. A store manager reviewed the case for "The Port-au-Prince Journals" and issued partial credit.' WHERE ReturnID = 39;

UPDATE Returns SET Notes = 'Customer received "Dust Over Oaxaca" instead of the long-form fiction title they requested. The shipping manifest error involving "Dust Over Oaxaca" was documented and corrected. The correct title was hand-delivered to the customer.' WHERE ReturnID = 40;

UPDATE Returns SET Notes = 'Customer bought "The Long Road from Santiago" for a book club but the group selected a different title. The return of "The Long Road from Santiago" was processed within the 7-day window and the customer received a full store credit.' WHERE ReturnID = 41;

UPDATE Returns SET Notes = '"The Algiers Manuscript" had a significant printing defect on the cover image and multiple chapters with blurred text. The defective copy of "The Algiers Manuscript" was set aside for quality review and a replacement was issued.' WHERE ReturnID = 42;

UPDATE Returns SET Notes = '"Sand and Silence" was purchased twice due to an auto-fill error on the customer account. One copy of "Sand and Silence" was returned unopened and the corresponding payment was refunded in full.' WHERE ReturnID = 43;

UPDATE Returns SET Notes = 'Customer indicated "The Cedar House" did not match the synopsis they read on a third-party review site. After discussion with the manager, a one-time store credit exception was granted for "The Cedar House".' WHERE ReturnID = 44;

UPDATE Returns SET Notes = '"Threads of the Old City" was mistakenly shelved under a different ISBN causing the wrong title to ship. Inventory was audited following the "Threads of the Old City" error and all mismatched entries were corrected.' WHERE ReturnID = 45;

UPDATE Returns SET Notes = 'Customer purchased "The Nile in Winter" on impulse but decided it was not aligned with their current reading list. The return of "The Nile in Winter" was accepted and a refund was issued back to the original payment method.' WHERE ReturnID = 46;

UPDATE Returns SET Notes = '"Beyond the Qanat" arrived with a broken spine and several torn pages near the middle of the book. Customer was issued a replacement copy of "Beyond the Qanat" from available inventory.' WHERE ReturnID = 47;

UPDATE Returns SET Notes = '"The Amman Letters" was ordered in duplicate due to a checkout session glitch. The second charge for "The Amman Letters" was identified during processing and reversed before the second copy was shipped.' WHERE ReturnID = 48;

UPDATE Returns SET Notes = 'Customer felt "Desert Glass" had a misleading subtitle suggesting it was a travel memoir when it is literary fiction. A partial store credit was offered for "Desert Glass" after manager review.' WHERE ReturnID = 49;

UPDATE Returns SET Notes = 'Customer ordered "The Hour of the Muezzin" but received "Between Mecca and Montmartre" due to adjacent shelf placement. Both "The Hour of the Muezzin" and "Between Mecca and Montmartre" were re-tagged and the correct book was provided.' WHERE ReturnID = 50;

UPDATE Returns SET Notes = 'Customer purchased "Between Mecca and Montmartre" as a travel companion read but changed their trip plans. The return of "Between Mecca and Montmartre" was processed within the allowed timeframe and a store credit was applied.' WHERE ReturnID = 51;

UPDATE Returns SET Notes = '"The Tangi and the Tide" arrived with significant moisture damage to the back quarter of the book. Customer was offered a full refund or replacement for "The Tangi and the Tide" and chose a full replacement copy.' WHERE ReturnID = 52;

UPDATE Returns SET Notes = '"Where the Kauri Grow" was accidentally ordered twice from the mobile app. The second order of "Where the Kauri Grow" was identified during packing and cancelled with a full payment reversal.' WHERE ReturnID = 53;

UPDATE Returns SET Notes = '"Lava and Latitude" contained several factual inconsistencies flagged by the customer who works in the relevant field. The case regarding "Lava and Latitude" was escalated to management and a refund was processed.' WHERE ReturnID = 54;

UPDATE Returns SET Notes = 'Customer received "Highveld Hymns" instead of "The Blue Lagoon Letters". A mis-scan at the packing station was identified as the cause of the mix-up between "Highveld Hymns" and "The Blue Lagoon Letters". The correct title was shipped priority.' WHERE ReturnID = 55;

UPDATE Returns SET Notes = 'Customer purchased "Harmattan Season" as a gift but the recipient preferred non-fiction. The return of "Harmattan Season" was accepted and a full refund was applied to the original credit card.' WHERE ReturnID = 56;

UPDATE Returns SET Notes = '"The Obi Crossing" had pages 30 through 45 printed in a completely illegible font due to a press error. Customer was given a replacement for "The Obi Crossing" and the defective batch was flagged for return to the printer.' WHERE ReturnID = 57;

UPDATE Returns SET Notes = '"Highveld Hymns" was ordered twice within the same session. The duplicate was caught during order review and only one copy of "Highveld Hymns" was charged and shipped.' WHERE ReturnID = 58;

UPDATE Returns SET Notes = 'Customer reported that "The Zambezi Verdict" contained an unresolved plot thread that the ending description on the back cover explicitly promised would be resolved. A partial credit was issued for "The Zambezi Verdict".' WHERE ReturnID = 59;

UPDATE Returns SET Notes = '"Steppe and Shadow" was delivered to the wrong address due to a zip code entry error. The misdelivered copy of "Steppe and Shadow" was retrieved and re-sent to the correct customer with expedited shipping at no extra cost.' WHERE ReturnID = 60;

UPDATE Returns SET Notes = 'Customer bought "The Lagos Lagoon" for a reading group that ultimately selected a different title. The return of "The Lagos Lagoon" was processed within policy and a full store credit was applied to the customer account.' WHERE ReturnID = 61;


-- ============================================================
-- PART B: Accessories Table & Supporting Tables
-- ============================================================

-- ============================================================
-- Table: Accessory_Categories
-- Groups accessory types (bookmarks, bags, reading tools, etc.)
-- ============================================================
DROP TABLE IF EXISTS Accessory_Order_Items;
DROP TABLE IF EXISTS Accessory_Inventory;
DROP TABLE IF EXISTS Accessories;
DROP TABLE IF EXISTS Accessory_Categories;

CREATE TABLE Accessory_Categories (
    CategoryID   INT          NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(100) NOT NULL,
    Description  TEXT         NULL,
    CONSTRAINT pk_Accessory_Categories PRIMARY KEY (CategoryID),
    CONSTRAINT uq_AccessoryCategories_Name UNIQUE (CategoryName)
);

-- ============================================================
-- Table: Accessories
-- All book-related accessories sold at Pendragon Bookstore
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_Accessories_Price
        CHECK (RetailPrice > 0)
);

CREATE INDEX idx_Accessories_CategoryID ON Accessories(CategoryID);

-- ============================================================
-- Table: Accessory_Inventory
-- Stock levels for each accessory per store
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_AccessoryInventory_StoreID FOREIGN KEY (StoreID)
        REFERENCES Stores(StoreID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_AccessoryInventory_Quantity
        CHECK (QuantityOnHand >= 0)
);

CREATE INDEX idx_AccessoryInventory_AccessoryID ON Accessory_Inventory(AccessoryID);
CREATE INDEX idx_AccessoryInventory_StoreID     ON Accessory_Inventory(StoreID);

-- ============================================================
-- Table: Accessory_Order_Items
-- Accessories can be added to any existing Order
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
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_AccOrderItems_AccessoryID FOREIGN KEY (AccessoryID)
        REFERENCES Accessories(AccessoryID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_AccOrderItems_Quantity
        CHECK (Quantity > 0),
    CONSTRAINT chk_AccOrderItems_Price
        CHECK (UnitPrice > 0),
    CONSTRAINT chk_AccOrderItems_Discount
        CHECK (Discount >= 0 AND Discount < 100)
);

CREATE INDEX idx_AccOrderItems_OrderID     ON Accessory_Order_Items(OrderID);
CREATE INDEX idx_AccOrderItems_AccessoryID ON Accessory_Order_Items(AccessoryID);

-- ============================================================
-- INSERT: Accessory_Categories
-- ============================================================
INSERT INTO Accessory_Categories (CategoryID, CategoryName, Description) VALUES
(1, 'Flat Bookmarks',        'Traditional flat bookmarks in paper, cardstock, metal, or fabric, designed to mark a reader\'s place in any book.'),
(2, 'Clip & Clasp Bookmarks','Spring-loaded, magnetic, or corner-clip bookmarks that attach to a page without slipping.'),
(3, 'Purse Strap Bookmarks', 'Bookmarks with a long decorative strap or tassel that hangs outside the book spine for easy retrieval.'),
(4, 'Book Darts & Tabs',     'Slim metal or adhesive page markers designed for precise annotation without writing in the book.'),
(5, 'Book Stands & Holders', 'Freestanding or adjustable holders that prop a book open hands-free for reading or display.'),
(6, 'Reading Accessories',   'Practical tools that enhance the reading experience including lights, magnifiers, and page holders.'),
(7, 'Book Bags & Totes',     'Carrying bags and totes designed specifically for transporting books safely and stylishly.'),
(8, 'Book Sleeves & Covers', 'Protective fabric or leather sleeves and snap-on covers that shield books from damage.'),
(9, 'Stationery & Journals', 'Reading journals, annotation notebooks, and themed stationery sets for avid readers.'),
(10,'Gift Sets',             'Curated gift bundles combining multiple accessories, often themed around a genre or reading aesthetic.');

-- ============================================================
-- INSERT: Accessories (50 products across all categories)
-- ============================================================
INSERT INTO Accessories (AccessoryID, SKU, AccessoryName, Description, CategoryID, RetailPrice, Material, Color, IsGiftable) VALUES

-- Flat Bookmarks (Category 1)
(1,  'PEN-BM-F001', 'Wildflower Pressed Bookmark',         'A laminated flat bookmark featuring real dried wildflowers sealed between clear acrylic sheets. Each one is unique.',                                                   1,  8.99,  'Acrylic, Dried Flowers', 'Assorted',     1),
(2,  'PEN-BM-F002', 'Vintage Map Bookmark Set (3-pack)',   'Set of three flat cardstock bookmarks printed with antique cartographic map designs. Ribbon pull tab included.',                                                      1,  6.99,  'Cardstock',              'Sepia & Gold',  1),
(3,  'PEN-BM-F003', 'Brass Engraved Bookmark',             'Slim solid brass flat bookmark with an engraved floral border. Tarnish-resistant finish. Includes a gift pouch.',                                                     1, 14.99,  'Brass',                  'Gold',          1),
(4,  'PEN-BM-F004', 'Watercolor Galaxy Bookmark',          'Flat laminated bookmark with original watercolor galaxy artwork. Matte finish with a satin ribbon tail.',                                                              1,  5.99,  'Laminated Paper',        'Multicolor',    1),
(5,  'PEN-BM-F005', 'Leather Hand-Stamped Bookmark',       'Genuine leather flat bookmark hand-stamped with botanical patterns. Develops a rich patina over time.',                                                               1, 12.99,  'Genuine Leather',        'Tan',           1),

-- Clip & Clasp Bookmarks (Category 2)
(6,  'PEN-BM-C001', 'Magnetic Corner Bookmark Set (4-pack)','Set of four corner-clip bookmarks with a strong magnetic closure. No-slip grip keeps pages perfectly marked.',                                                      2,  9.99,  'Magnetic Metal',         'Rose Gold',     1),
(7,  'PEN-BM-C002', 'Owl Page Clip Bookmark',              'A die-cut metal page clip in the shape of an owl that grips the top corner of a page. Nickel-plated finish.',                                                         2,  7.99,  'Nickel-plated Metal',    'Silver',        1),
(8,  'PEN-BM-C003', 'Butterfly Spring Clip Bookmark',      'Delicate enamel butterfly spring-clip that attaches to any page thickness. Comes in a gift box.',                                                                     2, 10.99,  'Enamel, Steel',          'Teal & Gold',   1),
(9,  'PEN-BM-C004', 'Infinity Loop Clip Bookmark',         'Minimalist stainless steel infinite-loop clip that slides onto a page without bending or creasing.',                                                                  2,  8.49,  'Stainless Steel',        'Matte Black',   0),
(10, 'PEN-BM-C005', 'Paw Print Magnetic Bookmark',         'Adorable magnetic bookmark shaped like a paw print that snaps to the page edge. Great for pet lovers.',                                                               2,  6.49,  'Magnetic Resin',         'Brown',         1),

-- Purse Strap Bookmarks (Category 3)
(11, 'PEN-BM-P001', 'Tassel Leather Purse Strap Bookmark', 'Wide genuine leather strip bookmark with a braided leather tassel. The long strap hangs freely outside the book for effortless retrieval.',                          3, 16.99,  'Genuine Leather',        'Cognac',        1),
(12, 'PEN-BM-P002', 'Beaded Silk Strap Bookmark',          'Flat silk ribbon bookmark with hand-strung glass beads on the tail end. Elegant enough for a gift.',                                                                 3, 13.99,  'Silk, Glass Beads',      'Emerald Green', 1),
(13, 'PEN-BM-P003', 'Macramé Strap Bookmark',              'Hand-knotted cotton macramé bookmark with a long decorative fringe tail. Boho aesthetic, fits any paperback or hardcover.',                                          3, 11.99,  'Cotton Cord',            'Cream & Rust',  1),
(14, 'PEN-BM-P004', 'Velvet Ribbon Purse Bookmark',        'Soft velvet ribbon bookmark with a decorative wax-seal charm at the tail. Available in deep jewel tones.',                                                           3, 10.49,  'Velvet, Metal Charm',    'Midnight Blue', 1),
(15, 'PEN-BM-P005', 'Chain & Crystal Strap Bookmark',      'A delicate metal chain bookmark with a faceted crystal pendant that drapes elegantly over the book edge.',                                                           3, 19.99,  'Rhodium-plated Chain, Crystal', 'Silver & Clear', 1),

-- Book Darts & Tabs (Category 4)
(16, 'PEN-BD-001',  'Brass Book Darts (50-pack)',           'Slim brass book darts that clip precisely to a single line on the page without bending. The reader\'s choice for annotation.',                                       4,  9.99,  'Brass',                  'Gold',          0),
(17, 'PEN-BD-002',  'Color-Coded Adhesive Page Tabs (6-color set)', 'Semi-transparent adhesive page tabs in six colors for color-coded annotation. Repositionable and residue-free.',                                           4,  5.49,  'PET Film',               'Multicolor',    0),
(18, 'PEN-BD-003',  'Stainless Steel Book Dart Set (25-pack)','Precision-engineered stainless steel book darts for marking passages without damage. Corrosion-resistant.',                                                        4,  8.99,  'Stainless Steel',        'Silver',        0),
(19, 'PEN-BD-004',  'Arrow Sticky Note Tabs (300-count)',   'Small arrow-shaped sticky note tabs for flagging key passages. Repositionable and strong-hold.',                                                                     4,  4.99,  'Paper',                  'Assorted Neon', 0),
(20, 'PEN-BD-005',  'Floral Washi Tape Bookmark Set',       'Set of five rolls of washi tape with botanical patterns for creating custom page flags and annotations.',                                                            4,  7.99,  'Washi Paper',            'Floral Pastels',1),

-- Book Stands & Holders (Category 5)
(21, 'PEN-BS-001',  'Bamboo Adjustable Book Stand',         'Eco-friendly bamboo book stand with six adjustable angles and page-hold wings. Folds flat for storage. Ideal for textbooks and large hardcovers.',                  5, 24.99,  'Bamboo',                 'Natural',       0),
(22, 'PEN-BS-002',  'Acrylic Floating Book Display Stand',  'Clear acrylic minimalist stand that holds a book open at 90 degrees for display or hands-free reading. Invisible aesthetic.',                                       5, 17.99,  'Acrylic',                'Clear',         1),
(23, 'PEN-BS-003',  'Wrought Iron Vintage Book Easel',      'Decorative wrought iron easel stand with ornate scrollwork. Perfect for displaying a favorite book on a shelf or desk.',                                            5, 34.99,  'Wrought Iron',           'Antique Black', 1),
(24, 'PEN-BS-004',  'Portable Silicone Book Seat',          'Flexible silicone book holder that fans pages open flat for hands-free reading on a table. Lightweight and travel-friendly.',                                       5, 14.99,  'Silicone',               'Stone Gray',    0),
(25, 'PEN-BS-005',  'Lap Desk with Book Rest',              'Cushioned lap board with a raised book rest rail and a flat writing surface. Includes a side pocket for a bookmark or phone.',                                      5, 39.99,  'MDF, Microfiber Cushion','Charcoal',      0),

-- Reading Accessories (Category 6)
(26, 'PEN-RA-001',  'Rechargeable LED Book Light',          'Slim clip-on LED reading light with three brightness settings and a flexible neck. USB-C rechargeable, up to 40 hours of battery life.',                           6, 22.99,  'ABS Plastic',            'Black',         1),
(27, 'PEN-RA-002',  'Page Magnifier Bookmark',              'Flat Fresnel lens magnifier that doubles as a bookmark. Enlarges text up to 2x for easier reading.',                                                                 6,  9.99,  'Fresnel Acrylic',        'Clear',         1),
(28, 'PEN-RA-003',  'Finger Page Turner (2-pack)',           'Ergonomic silicone fingertip covers that prevent paper cuts and make page turning effortless. Fits most finger sizes.',                                             6,  4.99,  'Silicone',               'Blush Pink',    0),
(29, 'PEN-RA-004',  'Book Lover\'s Pouch & Accessory Kit',  'Canvas zipper pouch containing a mini pencil, sticky tabs, a book dart set, and an eraser. Perfect carry-all for annotating readers.',                             6, 18.99,  'Canvas, Mixed',          'Forest Green',  1),
(30, 'PEN-RA-005',  'Anti-Glare Reading Glasses (+1.5)',    'Lightweight anti-glare reading glasses with spring hinges and a slim oval frame. Includes a microfiber pouch.',                                                     6, 16.99,  'TR90 Frame, Glass Lens', 'Tortoiseshell', 0),

-- Book Bags & Totes (Category 7)
(31, 'PEN-BB-001',  'Canvas Literary Tote Bag',             'Heavy-duty 12 oz canvas tote printed with a classic library card design. Fits up to 6 paperbacks or 2 large hardcovers. Interior slip pocket.',                    7, 18.99,  'Canvas',                 'Natural & Black',1),
(32, 'PEN-BB-002',  'Leather Book Satchel',                 'Full-grain leather book bag with a magnetic snap closure, padded interior lining, and an adjustable shoulder strap. Holds up to 3 hardcovers.',                   7, 79.99,  'Full-grain Leather',     'Chestnut',      1),
(33, 'PEN-BB-003',  'Waxed Canvas Book Backpack',           'Water-resistant waxed canvas backpack with a padded book compartment, a front zipper pocket, and antique brass hardware.',                                         7, 64.99,  'Waxed Canvas',           'Navy',          0),
(34, 'PEN-BB-004',  'Pendragon Branded Reusable Tote',      'Pendragon Bookstore branded recycled cotton tote. Lightweight, machine washable, and eco-friendly.',                                                                7,  9.99,  'Recycled Cotton',        'Burgundy',      1),
(35, 'PEN-BB-005',  'Jute Market Book Bag',                 'Open-top jute market tote with reinforced handles. Sturdy enough for groceries but elegant enough for books.',                                                      7, 12.99,  'Jute',                   'Natural',       0),

-- Book Sleeves & Covers (Category 8)
(36, 'PEN-SC-001',  'Quilted Fabric Book Sleeve (Paperback)', 'Padded quilted cotton sleeve that protects paperbacks from scratches and spills. Elastic closure. Fits books up to 8" x 5.5".',                                  8, 14.99,  'Quilted Cotton',         'Dusty Rose',    1),
(37, 'PEN-SC-002',  'Vegan Leather Hardcover Book Jacket',  'Snap-on vegan leather book jacket with an interior ribbon bookmark attached. Fits most standard hardcovers.',                                                       8, 22.99,  'Vegan Leather',          'Olive Green',   1),
(38, 'PEN-SC-003',  'Neoprene Book Sleeve with Handle',     'Water-resistant neoprene sleeve with a top grab handle. Fits books up to 9" x 6". Great for commuters.',                                                           8, 17.99,  'Neoprene',               'Slate Blue',    0),
(39, 'PEN-SC-004',  'Embroidered Linen Book Cover',         'Hand-embroidered linen book cover with a bookmark ribbon sewn in. One-size-fits-most paperback design.',                                                            8, 19.99,  'Linen, Embroidery Thread','Ivory & Sage',  1),
(40, 'PEN-SC-005',  'Hardcover Stretch Book Cover (3-pack)','Set of three durable stretch fabric book covers in assorted patterns. Machine washable. Fits books up to 10" x 7".',                                               8, 11.99,  'Polyester Stretch Fabric','Assorted',      0),

-- Stationery & Journals (Category 9)
(41, 'PEN-SJ-001',  'Reading Journal — Hardcover',          'A 200-page hardcover reading journal with prompts for tracking books read, ratings, favorite quotes, and personal reflections. Lay-flat binding.',                  9, 18.99,  'Hardcover, Cream Paper', 'Forest Green',  1),
(42, 'PEN-SJ-002',  'Book Lover\'s Annotation Kit',         'Set including a 0.5mm mechanical pencil, a four-color erasable pen, a fine-tip highlighter set, and a sticky note booklet. Stored in a linen pouch.',              9, 24.99,  'Mixed',                  'Terracotta',    1),
(43, 'PEN-SJ-003',  'Monthly Reading Tracker Notepad',      'Tear-off notepad with 50 monthly reading tracker sheets. Includes spaces for title, author, genre, start and finish dates, and a star rating.',                    9,  8.99,  'Newsprint',              'Cream & Rust',  0),
(44, 'PEN-SJ-004',  'Pendragon Bookstore Branded Pen Set',  'Set of three smooth-writing ballpoint pens in Pendragon burgundy, black, and gold with the store logo engraved on the barrel.',                                    9, 12.99,  'Metal Barrel',           'Burgundy, Black, Gold', 1),
(45, 'PEN-SJ-005',  'Literary Quote Postcard Set (20-pack)','Set of 20 high-quality postcard prints featuring hand-lettered quotes from classic and contemporary literature. Matte finish.',                                     9, 14.99,  'Cardstock',              'Assorted',      1),

-- Gift Sets (Category 10)
(46, 'PEN-GS-001',  'The Cozy Reader Gift Set',             'Curated gift set including a wildflower pressed bookmark, a rechargeable LED book light, and a canvas literary tote. Presented in a kraft gift box.',              10, 44.99, 'Mixed',                  'Natural',       1),
(47, 'PEN-GS-002',  'The Annotator\'s Gift Set',            'Gift set for the serious reader: a brass book dart 50-pack, a reading journal, a four-color annotation pen, and a sticky tab multipack. Packaged in a ribbon box.', 10, 54.99, 'Mixed',                  'Ivory & Gold',  1),
(48, 'PEN-GS-003',  'The Traveler\'s Reading Kit',          'Portable reading bundle including a neoprene book sleeve, a rechargeable book light, and a silicone book seat. Ideal for commuters and frequent travelers.',        10, 49.99, 'Mixed',                  'Navy & Gray',   1),
(49, 'PEN-GS-004',  'The Vintage Reader Gift Box',          'Nostalgic gift set featuring a brass engraved bookmark, a wrought iron book easel, and a literary quote postcard set. Wrapped in tissue and a Pendragon gift box.', 10, 59.99, 'Mixed',                  'Antique Gold',  1),
(50, 'PEN-GS-005',  'The New Bookworm Starter Kit',         'A welcoming gift set for a new reader: a magnetic corner bookmark set, a Pendragon branded tote, a reading tracker notepad, and a book lover\'s annotation kit.',  10, 39.99, 'Mixed',                  'Assorted',      1);

-- ============================================================
-- INSERT: Accessory_Inventory
-- Each accessory stocked at a rotating selection of stores
-- ============================================================
INSERT INTO Accessory_Inventory (AccessoryID, StoreID, QuantityOnHand, ReorderLevel) VALUES
-- Store 1 (Atlanta)
(1,  1, 40, 10), (6,  1, 30, 10), (11, 1, 25, 10), (16, 1, 50, 15),
(21, 1, 15, 5),  (26, 1, 20, 8),  (31, 1, 35, 10), (36, 1, 22, 8),
(41, 1, 28, 10), (46, 1, 12, 5),
-- Store 2 (Athens)
(2,  2, 45, 10), (7,  2, 28, 10), (12, 2, 20, 8),  (17, 2, 60, 15),
(22, 2, 18, 5),  (27, 2, 25, 8),  (32, 2, 10, 5),  (37, 2, 20, 8),
(42, 2, 15, 5),  (47, 2, 8,  5),
-- Store 3 (Augusta)
(3,  3, 35, 10), (8,  3, 22, 10), (13, 3, 18, 8),  (18, 3, 55, 15),
(23, 3, 8,  5),  (28, 3, 40, 10), (33, 3, 12, 5),  (38, 3, 25, 8),
(43, 3, 30, 10), (48, 3, 7,  5),
-- Store 4 (Macon)
(4,  4, 50, 10), (9,  4, 35, 10), (14, 4, 22, 8),  (19, 4, 80, 20),
(24, 4, 20, 8),  (29, 4, 18, 8),  (34, 4, 45, 15), (39, 4, 17, 8),
(44, 4, 25, 10), (49, 4, 10, 5),
-- Store 5 (Savannah)
(5,  5, 38, 10), (10, 5, 42, 10), (15, 5, 15, 5),  (20, 5, 70, 20),
(25, 5, 10, 5),  (30, 5, 22, 8),  (35, 5, 28, 10), (40, 5, 30, 10),
(45, 5, 20, 8),  (50, 5, 14, 5),
-- Store 6 (Gainesville)
(1,  6, 30, 10), (6,  6, 25, 10), (11, 6, 20, 8),  (16, 6, 45, 15),
(21, 6, 12, 5),  (26, 6, 18, 8),  (31, 6, 30, 10), (36, 6, 18, 8),
(41, 6, 22, 10), (46, 6, 9,  5),
-- Store 7 (Dalton)
(2,  7, 40, 10), (7,  7, 20, 10), (12, 7, 16, 8),  (17, 7, 55, 15),
(22, 7, 14, 5),  (27, 7, 20, 8),  (32, 7, 8,  5),  (37, 7, 16, 8),
(42, 7, 12, 5),  (47, 7, 6,  5),
-- Store 8 (Albany)
(3,  8, 28, 10), (8,  8, 18, 10), (13, 8, 14, 8),  (18, 8, 50, 15),
(23, 8, 6,  5),  (28, 8, 35, 10), (33, 8, 10, 5),  (38, 8, 20, 8),
(43, 8, 25, 10), (48, 8, 5,  5),
-- Store 9 (Evans)
(4,  9, 42, 10), (9,  9, 30, 10), (14, 9, 18, 8),  (19, 9, 75, 20),
(24, 9, 16, 8),  (29, 9, 15, 8),  (34, 9, 40, 15), (39, 9, 14, 8),
(44, 9, 20, 10), (49, 9, 8,  5),
-- Store 10 (Swainsboro)
(5,  10, 32, 10), (10, 10, 38, 10), (15, 10, 12, 5), (20, 10, 65, 20),
(25, 10, 8,  5),  (30, 10, 18, 8),  (35, 10, 24, 10),(40, 10, 26, 10),
(45, 10, 16, 8),  (50, 10, 11, 5),
-- Store 11 (Columbus)
(1,  11, 36, 10), (6,  11, 28, 10), (11, 11, 22, 8), (16, 11, 48, 15),
(21, 11, 14, 5),  (26, 11, 20, 8),  (31, 11, 32, 10),(36, 11, 20, 8),
(41, 11, 24, 10), (46, 11, 10, 5);

-- ============================================================
-- INSERT: Accessory_Order_Items
-- Sample accessory purchases tied to existing orders
-- ============================================================
INSERT INTO Accessory_Order_Items (OrderID, AccessoryID, Quantity, UnitPrice, Discount) VALUES
(1,  46, 1, 44.99,  0.00),  -- Cozy Reader Gift Set with Order 1
(2,  1,  2,  8.99,  0.00),  -- Wildflower Bookmarks with Order 2
(3,  41, 1, 18.99,  5.00),  -- Reading Journal with Order 3
(4,  6,  1,  9.99,  0.00),  -- Magnetic Corner Bookmarks with Order 4
(5,  31, 1, 18.99,  0.00),  -- Canvas Literary Tote with Order 5
(6,  26, 1, 22.99, 10.00),  -- LED Book Light with Order 6
(7,  47, 1, 54.99,  0.00),  -- Annotator's Gift Set with Order 7
(8,  11, 1, 16.99,  0.00),  -- Tassel Leather Strap Bookmark with Order 8
(9,  16, 1,  9.99,  0.00),  -- Brass Book Darts with Order 9
(10, 36, 1, 14.99,  5.00),  -- Quilted Book Sleeve with Order 10
(11, 48, 1, 49.99,  0.00),  -- Traveler's Reading Kit with Order 11
(12, 2,  1,  6.99,  0.00),  -- Vintage Map Bookmark Set with Order 12
(13, 42, 1, 24.99,  0.00),  -- Book Lover's Annotation Kit with Order 13
(14, 21, 1, 24.99,  0.00),  -- Bamboo Book Stand with Order 14
(15, 7,  2,  7.99,  0.00),  -- Owl Page Clip Bookmarks with Order 15
(16, 49, 1, 59.99,  0.00),  -- Vintage Reader Gift Box with Order 16
(17, 12, 1, 13.99,  0.00),  -- Beaded Silk Strap Bookmark with Order 17
(18, 37, 1, 22.99,  5.00),  -- Vegan Leather Book Jacket with Order 18
(19, 43, 2,  8.99,  0.00),  -- Reading Tracker Notepads with Order 19
(20, 50, 1, 39.99,  0.00);  -- New Bookworm Starter Kit with Order 20

-- ============================================================
-- VERIFICATION QUERIES
-- ============================================================

-- Confirm all Returns notes now include book title
SELECT ReturnID, LEFT(Notes, 80) AS Notes_Preview FROM Returns ORDER BY ReturnID;

-- Full Accessories catalog
SELECT
    ac.CategoryName,
    a.SKU,
    a.AccessoryName,
    a.Material,
    a.Color,
    a.RetailPrice,
    IF(a.IsGiftable = 1, 'Yes', 'No') AS Giftable
FROM Accessories a
JOIN Accessory_Categories ac ON a.CategoryID = ac.CategoryID
ORDER BY ac.CategoryID, a.AccessoryID;

-- Inventory summary per store
SELECT
    s.StoreName,
    s.ZipCode,
    COUNT(ai.AccessoryInventoryID)  AS AccessoryLineItems,
    SUM(ai.QuantityOnHand)          AS TotalUnitsOnHand
FROM Accessory_Inventory ai
JOIN Stores s ON ai.StoreID = s.StoreID
GROUP BY s.StoreID, s.StoreName, s.ZipCode
ORDER BY s.StoreID;

-- Table row summary
SELECT 'Accessory_Categories'  AS TableName, COUNT(*) AS TotalRows FROM Accessory_Categories  UNION ALL
SELECT 'Accessories'           AS TableName, COUNT(*) AS TotalRows FROM Accessories            UNION ALL
SELECT 'Accessory_Inventory'   AS TableName, COUNT(*) AS TotalRows FROM Accessory_Inventory    UNION ALL
SELECT 'Accessory_Order_Items' AS TableName, COUNT(*) AS TotalRows FROM Accessory_Order_Items;