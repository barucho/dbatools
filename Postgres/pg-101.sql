


-- show databases 
SELECT datname FROM pg_database
WHERE datistemplate = false;

-- show schmes in database 
 SELECT nspname
 FROM pg_catalog.pg_namespace;
 -- desc table 
 SELECT 
   table_name, 
   column_name, 
   data_type 
FROM 
   information_schema.columns
WHERE 
   table_name = 'city';