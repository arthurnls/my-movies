class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, through: :user_movies

  has_many :movie_genres
  has_many :genres, through: :movie_genres

  has_many :movie_directors
  has_many :directors, through: :movie_directors

  has_many :movie_actors
  has_many :actors, through: :movie_actors
end
