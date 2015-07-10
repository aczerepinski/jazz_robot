class Song < ActiveRecord::Base
  include Transposable
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :difficulty
  belongs_to :composer

  def roman_numerals
    array = format_roman_numerals
    group_by_measure(array)
  end

  def prepare_json
    group_by_measure(array_from_string)
  end

  def genres_json
    # json = "'["
    # genres_array = self.genres.map{|g| g.name.downcase}
    # i = 0
    # loop do
    #   if i == genres_array.length-1
    #     json += ("'" + genres_array[i] + "'" + "]'")
    #     return json
    #   else
    #     json += (genres_array[i] + ", ")
    #     i += 1
    #   end
    # end
    genres.map{|g|g.name.downcase}.to_json
  end

  def genres_string
    genres.map{|g|g.name.downcase}.join(',')
  end


  private

  def group_by_measure(array)
    array.each_slice(chords_per_measure).to_a
  end

  def array_from_string
    chords.split(",").map{|c|c.strip.gsub("nil", "")}
  end

  def format_roman_numerals
    array_from_string.map{|c|c.gsub("_", " ")}
  end
  

end
