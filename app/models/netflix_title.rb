class NetflixTitle < ApplicationRecord
  belongs_to :type
  has_many :user_netflix_titles
  has_many :users, through: :user_netflix_titles

  has_many :netflix_title_genres
  has_many :genres, through: :netflix_title_genres

  has_many :netflix_title_directors
  has_many :directors, through: :netflix_title_directors

  has_many :netflix_title_actors
  has_many :actors, through: :netflix_title_actors
end
