class NetflixTitleGenre < ApplicationRecord
  belongs_to :netflix_title
  belongs_to :genre
end
