# Intro to Rails Project:

## My Movies webpage

## Rails Intro Project ToDo

### 1.1. [x]	Describe Datasets

- Netflix Titles
    - Link: https://www.kaggle.com/shivamb/netflix-shows 
    - Netflix programs and movies data
- IMDB Movies
    - Link: https://www.kaggle.com/stefanoleone992/imdb-extensive-dataset
    - IMDB Movies data
    - Can be linked together with netflix movies to get some data for directors, production company and/or actors
- Users Data
    - Use Faker to create fake users data, and setup users watched movies and programs.
- Description:
    - First I will use Netflix Titles dataset. From that, I will use the columns [type] [title] [director] [cast] [date_added] [release_year] [rating] [duration] [listed_in] [description]
    - Second data set is IMDB Movies. from that I will use the columns [title] [year] [date_published] [genre] [duration] [director] [actors] [description] [avg_vote] [votes]
    - The third data set will be a list of users created with Faker. It will have [name] [age] [watched_movies] [watched_netflix]
    - The database tables will be
        - [NetflixTitles] This will be defined with the Netflix Titles dataset. There will be a [genre] column extracted from [listed_in] dataset column. [genre] [director] and [actor] will be a many to many relationship.
        - [Type] This is the type of title from netflix (example "Movie", "Show"). It has a one to many relationship with [NetflixTitles] one title can have only one type, but a type can have many titles.
        - [Movies] This will be defined with the IMDB Movies dataset. [genre] [director] and [actor] will be a many to many relationship.
        - [Genre] This will be populated from both datasets, and have a many to many relationship to both [NetflixTitles] and [Movies]
        - [Directors] This will be populated from both datasets, and have a many to many relationship to both [NetflixTitles] and [Movies]
        - [Actors] This will be populated from both datasets, and have a many to many relationship to both [NetflixTitles] and [Movies]
        - [Users] This will be populated using faker to create a list of users, each with their own list of [watched_movies] [watched_netflix]. Those will be a many to many relationship to their respective tables.

### 1.2. [x]	Database ERD

<div style="display: block; text-align: center; margin: 1rem;">
    <img src="./docs/MyMoviesERD.png">
</div>

### 1.3. []	2 AR Models

- rails g model type name:string
- rails g model genre name:string
- rails g model director name:string
- rails g model actor name:string
- rails g model user name:string age:string
- rails g model netflix_title title:string description:text date_added:date release_year:integer rating:float duration:string type:references
- rails g model movie title:string description:text release_date:date release_year:integer duration:integer average_vote:integer votes:integer

- rails g migration CreateUserNetflix_titles netflix_title:references user:references
- rails g migration CreateUserMovies movie:references user:references

- rails g migration CreateNetflix_titlesGenres genre:references netflix_title:references
- rails g migration CreateNetflix_titlesActors actor:references netflix_title:references
- rails g migration CreateNetflix_titlesDirectors director:references netflix_title:references

- rails g migration CreateMoviesGenres genre:references movie:references
- rails g migration CreateMoviesActors actor:references movie:references
- rails g migration CreateMoviesDirectors director:references movie:references


Add to User and Netflix Models:
has_and_belongs_to_many :users
has_and_belongs_to_many :netflix_titles

### 1.3. []	3 AR Models

### 1.3. []	4+ AR Models

### 1.4. []	One to Many

### 1.5. []	Many to Many

### 1.6. []	Validations

### 1.7. []	1 Data Source

### 1.7. []	2 Data Sources

### 1.7. []	3+ Data Sources

### 2.1. []	About Page

### 2.2. []	Menu

### 3.1. []	Collection Navigation

### 3.2. []	Member Pages

### 3.3. []	Multi-model Data on Member Pages

### 3.4. []	Hierarchical Collection Navigation

### 3.5. []	Pagination

### 3.6. []	Mapping

### 4.1. []	Simple Search

### 4.2. []	Hierarchical Search

### 5.1. []	Valid HTML

### 5.2. []	ERB Conditional

### 5.3. []	Bootstrap Grid

### 6.1. []	Git and Github

### 6.2. []	20 Commits

--- 

## Brainstorming about the project

### Possibility 1:

- Stackoverflow Questions
    - programming language categories

- Trending youtube videos
    - for each stackoverflow category, show the amount of stackoverflow questions and amount of trending youtube videos

### Possibility 2:

- Netflix Titles
    - Link: https://www.kaggle.com/shivamb/netflix-shows 
    - Netflix programs data

- IMDB Movies
    - Link: https://www.kaggle.com/stefanoleone992/imdb-extensive-dataset
    - Movies data
    - Can be linked together with netflix movies to get some data for directors, production company and/or actors

- Users Data
    - Use Faker to create fake users data, and setup users watched movies and programs.

