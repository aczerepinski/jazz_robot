class Song < ActiveRecord::Base


  def chords_array
    array = array_from_string
    group_by_measure(array)
  end

  private

  def group_by_measure(array)
    array.each_slice(chords_per_measure).to_a
  end

  def array_from_string
    chords.split(",").map{|c|c.strip}
  end

end
