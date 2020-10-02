class User < ApplicationRecord
  has_many :user_netflix_titles
  has_many :netflix_titles, through: :user_netflix_titles
  has_many :user_movies
  has_many :movies, through: :user_movies
end
