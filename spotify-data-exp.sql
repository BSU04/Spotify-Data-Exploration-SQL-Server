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


--use select top statement to filter records
select top 20 * from dbo.spot


--mode(major-1, minor-0)
--list out the top 20 songs in major mode with high popularity
select artist, song, popularity
from dbo.spot
where mode = 1
and
popularity > 80
order by 
popularity desc


--list out the top 20 songs in minor mode with high popularity
select artist, song, popularity
from dbo.spot
where mode = 0
and
popularity > 80
order by
popularity desc


--list out the top 20 songs in major mode with least popularity
select artist, song, popularity
from dbo.spot
where mode = 1
and
popularity < 20
order by 
popularity asc


--list out the top 20 songs in minor mode with least popularity
select artist, song, popularity
from dbo.spot
where mode = 0
and
popularity < 20
order by
popularity asc


--display the years present in the data
select distinct(year) 
from dbo.spot
order by 
year asc


--return the songs released in the year 2018 to 2020 each with a seperate query
select song from
dbo.spot where
year = 2018

select song from
dbo.spot where
year = 2019

select song from
dbo.spot where
year = 2020


--display the entries of the artist "Neighbourhood" with their popularity and genre
select artist, popularity, genre from
dbo.spot where
artist = 'The Neighbourhood'


--return the distinct genres from the data
select distinct(genre) 
from dbo.spot


--LIKE Operator
--select the artists with the name starting with 'm'
select distinct(artist)
from dbo.spot
where 
artist like 'm%'


--select the artists with the name ending with 'y'
select distinct(artist)
from dbo.spot
where
artist like '%y'


--select the artists with the name having 'ny' in any position
select distinct(artist)
from dbo.spot
where
artist like '%ny%'


--select the artists with the name having 'r' in second position
select distinct(artist)
from dbo.spot
where
artist like '_r%'


--select the artists with the name starting with 'p' and ending with 'y'
select distinct(artist)
from dbo.spot
where
artist like 'p%y'


--select the artists with the name starting with a number 2
select distinct(artist)
from dbo.spot
where 
artist like '2%'


--return the artists starting with 'a' with a popularity greater than 85 and genre = 'pop'
select distinct(artist) 
from dbo.spot
where
artist like 'a%' and
popularity > 70 and 
genre = 'pop'


--OR operator
--return the artists from either 'rock' or 'pop'
select distinct(artist), genre
from dbo.spot
where
genre = 'pop' or
genre = 'rock'
order by 
genre asc


--NOT Operator
select artist, song, mode
from dbo.spot
where
not mode = 0


select song 
from dbo.spot 
where 
not explicit = 1 


select song
from dbo.spot
where 
not explicit == 0 


--TOP 10 artists with a popularity > 80
select top 10 artist, popularity
from dbo.spot
where popularity > 80



--UPDATE
update dbo.spot
set artist = 'NSYNC'
where
artist = '*NSYNC'

select * from 
dbo.spot
where
artist = 'NSYNC'



--genre filters
select distinct(genre)
from dbo.spot

select artist,song,genre
from
dbo.spot
where genre = 'set()' --unknown genre in the dataset (mixed)




--DELETE Statement
delete from
dbo.spot
where 
genre = 'set()' --deleting rows having genre as set()

select distinct(genre)
from dbo.spot



--UPDATE Genres
--Country
update dbo.spot
set genre = 'Country'
where
genre = 'country'


--EDM
update dbo.spot
set genre = 'EDM'
where
genre = 'Dance/Electronic'


--Folk/Acoustic
update dbo.spot
set genre = 'Folk/Acoustic'
where
genre = 'Folk/Acoustic, pop'

update dbo.spot
set genre = 'Folk/Acoustic'
where
genre = 'Folk/Acoustic, rock'

update dbo.spot
set genre = 'Folk/Acoustic'
where
genre = 'Folk/Acoustic, rock, pop'

update dbo.spot
set genre = 'Folk/Acoustic'
where
genre = 'Folk/Acoustic, rock, pop'


--Hip Hop
update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, country'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, Dance/Electronic'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, latin, Dance/Electronic'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, pop'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, pop, country'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, pop, Dance/Electronic'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, pop, latin'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, pop, R&B'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, pop, R&B, Dance/Electronic'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, pop, R&B, latin'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, pop, rock'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, R&B'

update dbo.spot
set genre = 'Hip Hop'
where
genre = 'hip hop, rock, pop'