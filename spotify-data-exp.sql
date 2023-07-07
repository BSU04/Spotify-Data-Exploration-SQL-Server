-- display the table
select * from dbo.spot


--count of rows 
select count(*) as
Row_Count from dbo.spot


-- display the count of columns
SELECT count(*) as Column_Count
FROM information_schema.columns
WHERE table_name = 'spot';



--return the datatypes of all the columns
SELECT 
TABLE_CATALOG,	--database
TABLE_SCHEMA,	--schema
TABLE_NAME, 
COLUMN_NAME, 
DATA_TYPE		--returns the datatype
FROM INFORMATION_SCHEMA.COLUMNS

