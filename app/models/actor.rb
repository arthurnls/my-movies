class Actor < ApplicationRecord
  has_many :netflix_title_actors
  has_many :netflix_titles, through: :netflix_title_actors

  has_many :movie_actors
  has_many :movies, through: :movie_actors
  
  # Validation
  validates :name, presence: true
end
