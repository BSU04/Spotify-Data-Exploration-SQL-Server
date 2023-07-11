/***Spotify Data Exploration and Manipulation***/
--Source: Kaggle

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


--display artists in the ascending order
select artist from dbo.spot
order by artist asc


--return unique artists in ascending
select distinct(artist)
from dbo.spot 
order by artist asc		--There are a total of 835 unqiue artists


--retrieve the years in the dataset
select distinct(year)
from dbo.spot
order by year asc		--The data consists of music catalog from the year 1998 to 2020


--how many explicit songs are present?
select count(explicit)
from dbo.spot 
where explicit = 1		--551 explicit


--return the count of non-explicit songs
select count(explicit)
from dbo.spot 
where explicit = 0		--1449 clean


--display the datatype of the column "danceability"
select DATA_TYPE
from INFORMATION_SCHEMA.COLUMNS
where COLUMN_NAME = 'danceability'


--round off to single point decimal of the column "danceability"
select round(danceability,1) as Danceability from dbo.spot


--convert the attributes having multipoint decimals to single point
select round(danceability,1) as Danceability,
	   round(energy,1) as Energy,
	   round(loudness,1) as Loudness,
	   round(speechiness,1) as Speechiness,
	   round(acousticness,1) as Acoustics,
	   round(liveness,1) as Liveliness,
	   round(valence,1) as Valence,
	   round(tempo,1) as Tempo
from dbo.spot


--retrieve the following characteristics of the songs
--(danceability, energy, loudness, speechiness, acousticness, liveness, valence, tempo)
select song,
	   round(danceability,1) as Danceability,
	   round(energy,1) as Energy,
	   round(loudness,1) as Loudness,
	   round(speechiness,1) as Speechiness,
	   round(acousticness,1) as Acoustics,
	   round(liveness,1) as Liveliness,
	   round(valence,1) as Valence,
	   round(tempo,1) as Tempo
from dbo.spot


--sort the artist by popularity
select artist, popularity from dbo.spot
order by popularity desc


--sort the songs by popularity
select song, popularity from dbo.spot
order by popularity desc


--list out the artists and songs with their corresponding popularity
select artist, song, popularity from dbo.spot
order by popularity desc


--retrieve the count of keys 
select distinct(song_key)
from dbo.spot
order by song_key asc


--rename the column 'key' to 'song_key'
EXEC SP_RENAME 'spot.key','song_key','COLUMN'  
--check whether the renaming is reflected
select * from dbo.spot


--return the songs that are in key 1
select song from
dbo.spot where
song_key = 1


--return the songs that are in key 11
select song from
dbo.spot where
song_key = 11


--return the songs with a popularity greater than 80
select song, popularity
from dbo.spot 
where popularity > 80
order by popularity desc


--return the songs with a popularity less than 50
select song, popularity
from dbo.spot 
where popularity < 10
order by popularity asc


--songs of artists with high popularity
select artist, song, popularity
from dbo.spot 
where popularity > 80
order by popularity desc


--songs of artists with least popularity
select artist, song, popularity
from dbo.spot 
where popularity < 20
order by popularity asc
