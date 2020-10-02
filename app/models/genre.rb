class Genre < ApplicationRecord
  has_many :netflix_title_genres
  has_many :netflix_titles, through: :netflix_title_genres

  has_many :movie_genres
  has_many :movies, through: :movie_genres
end
