-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts

 CREATE TABLE gifts (id SERIAL PRIMARY KEY, gift TEXT, giver TEXT, value INT, previously_regifted BOOLEAN);
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean


-- 
\echo See details of the table you created
-- 
 \d gifts


-- 
\echo Alter the table so that the column price is changed to value 
-- 



-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO gifts (id, gift, giver, value, previously_regifted) VALUES (1, 'Peach Candle', 'Santa', 9, TRUE);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE)
;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES ('gameboy', 'Mom', '100', FALSE),
('puppy', 'Dad', '1000', FALSE),
('sketchpad', 'Grandma', '10', TRUE),
('baby doll', 'Aunt', '25', TRUE),
('jigsaw puzzle', 'Santa', '5', FALSE),
 ('vanilla candle', 'Neighbor', '10', TRUE);




--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM gifts WHERE value >= 20;
  3 | soap on a rope | Rudolf           |    29 | f
  4 | potpurri       | Elf on the Shelf |    39 | t
  5 | mango candle   | The Boss         |    49 | f
  6 | gameboy        | Mom              |   100 | f
  7 | puppy          | Dad              |  1000 | f
  9 | baby doll      | Aunt             |    25 | t

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT gift FROM gifts WHERE gift LIKE '%candle%';
 cinnamon candle
 mango candle
 vanilla candle

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
 SELECT giver, value FROM gifts WHERE giver = 'Santa' OR value > 30;
 Santa            |     9
 Elf on the Shelf |    39
 The Boss         |    49
 Mom              |   100
 Dad              |  1000
 Santa            |     5

--
\echo Query for every gift whose giver is NOT Santa
--

 SELECT giver FROM gifts WHERE giver != 'Santa';
 Nick
 Rudolf
 Elf on the Shelf
 The Boss
 Mom
 Dad
 Grandma
 Aunt
 Neighbor
--
\echo Update the second gift to have a value of 2999
-- 

UPDATE gifts SET value = 2999 WHERE id = 2;
UPDATE 1
--
\echo Query for the updated item
--
 SELECT * FROM gifts;
  1 | Peach Candle    | Santa            |     9 | t
  3 | soap on a rope  | Rudolf           |    29 | f
  4 | potpurri        | Elf on the Shelf |    39 | t
  5 | mango candle    | The Boss         |    49 | f
  6 | gameboy         | Mom              |   100 | f
  7 | puppy           | Dad              |  1000 | f
  8 | sketchpad       | Grandma          |    10 | t
  9 | baby doll       | Aunt             |    25 | t
 10 | jigsaw puzzle   | Santa            |     5 | f
 11 | vanilla candle  | Neighbor         |    10 | t
  2 | cinnamon candle | Nick             |  2999 | t

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'Santa' RETURNING value, gift;
     9 | Peach Candle
     5 | jigsaw puzzle

--
\echo Query for all the columns in your gifts table one more time
--
 SELECT * FROM gifts;
  3 | soap on a rope  | Rudolf           |    29 | f
  4 | potpurri        | Elf on the Shelf |    39 | t
  5 | mango candle    | The Boss         |    49 | f
  6 | gameboy         | Mom              |   100 | f
  7 | puppy           | Dad              |  1000 | f
  8 | sketchpad       | Grandma          |    10 | t
  9 | baby doll       | Aunt             |    25 | t
 11 | vanilla candle  | Neighbor         |    10 | t
  2 | cinnamon candle | Nick             |  2999 | t


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT(gift) FROM gifts WHERE gift LIKE '%candle%';
     3

--
\echo Get the AVEREAGE value from all the gifts
--
SELECT AVG(value) FROM gifts;
 473.4444444444444444


-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
 SELECT value FROM gifts ORDER BY value DESC LIMIT 3 OFFSET 2;
--
SELECT value FROM gifts ORDER BY value DESC LIMIT 3 OFFSET 2;
   100
    49
    39
-- finish
--
DROP TABLE IF EXISTS gifts;
