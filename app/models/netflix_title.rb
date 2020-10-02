class NetflixTitle < ApplicationRecord
  # Many to One Relationship to Users table
  belongs_to :type

  # Many to Many Relationship to Users table
  has_many :user_netflix_titles
  has_many :users, through: :user_netflix_titles

  # Many to Many Relationship to Genres table
  has_many :netflix_title_genres
  has_many :genres, through: :netflix_title_genres

  # Many to Many Relationship to Directors table
  # has_many :netflix_title_directors
  has_many :directors, through: :netflix_title_directors

  # Many to Many Relationship to Actors table
  # has_many :netflix_title_actors
  has_many :actors, through: :netflix_title_actors

  # Validation
  validates :title, :description, :date_added, :release_year, :duration, presence: true
  validates :release_year, numericality: { only_integer: true }
end
