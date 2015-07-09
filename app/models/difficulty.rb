class Difficulty < ActiveRecord::Base
  has_many :songs
  validates_uniqueness_of :name
end
