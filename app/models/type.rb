class Type < ApplicationRecord
  # This stores Netflix Titles types (movie, show)
  has_many :netflix_titles
  
  # Validation
  validates :name, presence: true
end
