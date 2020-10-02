class Director < ApplicationRecord
  has_many :netflix_title_directors
  has_many :netflix_titles, through: :netflix_title_directors

  has_many :movie_directors
  has_many :movies, through: :movie_directors
end
