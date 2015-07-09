class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  validates_uniqueness_of :name
end
