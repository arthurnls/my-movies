class Movie < ApplicationRecord
  # Many to Many Relationship to Users table
  has_many :user_movies
  has_many :users, through: :user_movies

  # Many to Many Relationship to Genres table
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  # Many to Many Relationship to Directors table
  has_many :movie_directors
  has_many :directors, through: :movie_directors

  # Many to Many Relationship to Actors table
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  
  # Validation
  validates :title, :description, :release_date, :release_year, :duration, :average_vote, :votes, presence: true
  validates :release_year, :votes, numericality: { only_integer: true }
end
