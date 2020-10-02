class UserNetflixTitle < ApplicationRecord
  belongs_to :user
  belongs_to :netflix_title
end
