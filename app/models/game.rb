class Game < ActiveRecord::Base

  def data
    level_data = []
    10.times do
        key = keys_array[rand(keys_array.length)]
        chord = chords_array[rand(chords_array.length)]
        answer = Song.new(chords: chord, chords_per_measure: 1).send("key_of_#{key.downcase}")
      level_data << [key, chord, answer[0][0]]
    end
    level_data
  end


  def keys_array
    keys.split(",").map{|k| k.strip}
  end

  def chords_array
    chords.split(",").map{|c| c.strip}
  end

end
