class User < ApplicationRecord
  # Many to Many Relationship to NetflixTitles table
  has_many :user_netflix_titles
  has_many :netflix_titles, through: :user_netflix_titles

  # Many to Many Relationship to Movies table
  has_many :user_movies
  has_many :movies, through: :user_movies

  # Validation
  validates :name, :age, presence: true
  validates :age, numericality: { only_integer: true }
end
