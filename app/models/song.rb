class Song < ActiveRecord::Base
  include Transposable

  def roman_numerals
    array = format_roman_numerals
    group_by_measure(array)
  end

  def prepare_json
    group_by_measure(array_from_string)
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
