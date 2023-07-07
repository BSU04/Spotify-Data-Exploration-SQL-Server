/***Data Exploration of the Spotify Dataset Obtained from Kaggle***/

-- display the table
select * from dbo.spot


--total count of rows 
select count(*) as
Row_Count from dbo.spot


-- total count of columns
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


--display the artist and their corresponding songs
select artist, song
from dbo.spot


--display artist in the ascending order
select artist from dbo.spot
order by artist asc


--return unique artists in ascending order
select distinct(artist)
from dbo.spot 
order by artist asc		--There are a total of 835 unqiue artists in this dataset



