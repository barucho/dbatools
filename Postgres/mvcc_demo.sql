

-- create the table 
drop table mvcctable;
CREATE TABLE mvcctable (
   id  integer PRIMARY KEY,
   val integer NOT NULL
) WITH (autovacuum_enabled = off);
 

-- insert data 
INSERT INTO mvcctable
SELECT *, 0
FROM generate_series(1, 235) AS n;
-- looking at ctid 
/*
The ctid consists of two parts: the “block number”, starting at 0, and the “line pointer” (tuple number within the block), starting at 1.
*/

SELECT ctid, id, val
FROM mvcctable;

-- find one row
SELECT ctid, id, val
FROM mvcctable
WHERE id = 42;


-- lets crete new row 
UPDATE mvcctable
SET val = -1
WHERE id = 42;

-- id the new row  
SELECT ctid, id, val
FROM mvcctable
WHERE id = 42;

-- clean it up 
VACUUM FULL mvcctable;

--- get the block id 
SELECT ctid, id, val
FROM mvcctable
WHERE id = 42;
-- we can see that the block was moved one location 

drop table mvcctable;





-- lets play with fillfactor
-- leave % of block space unused when inserting data


TRUNCATE mvcctable;

ALTER TABLE mvcctable SET (fillfactor = 70);
 
INSERT INTO mvcctable
SELECT *, 0 FROM generate_series(1, 235);
 
SELECT ctid, id, val
FROM mvcctable;

UPDATE mvcctable
SET val = -1
WHERE id = 42;
 
SELECT ctid, id, val
FROM mvcctable
WHERE id = 42;


--- 

SELECT n_tup_upd, n_tup_hot_upd
FROM pg_stat_user_tables
WHERE schemaname = 'test'
  AND relname = 'mvcctable';