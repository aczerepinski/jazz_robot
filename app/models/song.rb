class Song < ActiveRecord::Base
  include Transposable

  def chords_array
    array = array_from_string
    group_by_measure(array)
  end

  def transpose(key)
    song = array_from_string
    transposed_song = []
    song.each do | chord |
      transposed_song.push(key[chord])
    end
    group_by_measure(transposed_song)
  end

  private

  def group_by_measure(array)
    array.each_slice(chords_per_measure).to_a
  end

  def array_from_string
    chords.split(",").map{|c|c.strip.gsub("nil", "")}
  end

  

end
