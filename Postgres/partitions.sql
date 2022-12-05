
-- range 

/*
Not all partitions need to be defined

Can not have overlapping ranges

The special values MINVALUE and MAXVALUE can be used to indicate that there is no lower or upper bound

The value can not be NULL

*/

create table phone_numbers (id bigserial, country_code int, area_code int, co int, line varchar ) 
partition by range (country_code);


create table phone_numbers_001 partition of phone_numbers for values from (1) to (19);

insert into phone_numbers values(nextval('phone_numbers_id_seq'),1,1,1,'xx');

test=> insert into phone_numbers values(nextval('phone_numbers_id_seq'),1000,1,1,'xx');
-- ERROR:  no partition of relation "phone_numbers" found for row
-- DETAIL:  Partition key of the failing row contains (country_code) = (1000).



CREATE TABLE phone_numbers (id           bigserial,country_code int,area_code    int, co           int,line         varchar) 
PARTITION BY RANGE (country_code, area_code); 


CREATE TABLE phone_numbers_001_0   PARTITION OF phone_numbers   FOR VALUES FROM (1, MINVALUE) TO (1, 500);
CREATE TABLE phone_numbers_001_500 PARTITION OF phone_numbers  FOR VALUES FROM (1, 500) TO (1, MAXVALUE);


-- list 
/*
Only a single column can be used for a key

Not all partitions need to be defined

Allows NULL values

*/

CREATE TABLE phone_numbers (id bigserial,country_code int,area_code    int,co           int,line         varchar) 
PARTITION BY LIST (country_code);
CREATE TABLE phone_numbers_001  PARTITION OF phone_numbers  FOR VALUES IN (1);
CREATE TABLE phone_numbers_002 PARTITION OF phone_numbers   FOR VALUES IN (2, 3, 4, 5, 6, 7, 8, 9, 10);


-- hash 

/*
Not all partitions need to be defined

The modulous for each partition should be the same but not required
Allows for incrementally increasing the number of partitions

Allows NULL values
They are placed in the first partition
*/




CREATE TABLE users (id         bigserial,name       varchar,email      varchar,created_at timestamptz DEFAULT CURRENT_TIMESTAMP) 
PARTITION BY HASH (email);

CREATE TABLE users_02_00    PARTITION OF users  FOR VALUES WITH (MODULUS 2, REMAINDER 0);
CREATE TABLE users_02_01    PARTITION OF users  FOR VALUES WITH (MODULUS 2, REMAINDER 1);




/*
Not all partitions need to be sub partitioned the same way

The sub partitions can be Range, List or Hash

There is no limit to how many levels a table can be sub partitioned

*/

CREATE TABLE phone_numbers (id bigserial,    country_code int,    area_code    int,    co           int,    line         varchar  )  
PARTITION BY LIST (country_code);    
CREATE TABLE phone_numbers_001     PARTITION OF phone_numbers      FOR VALUES IN (1)    PARTITION BY HASH (area_code);   
-- sub  partition
CREATE TABLE phone_numbers_001_0     PARTITION OF phone_numbers_001      FOR VALUES WITH (MODULUS 2, REMAINDER 0);
