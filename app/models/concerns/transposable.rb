module Transposable

  def self.keys
    #["0", "1", "2", "3",  "4", "5", "6",  "7", "8",  "9", "10", "11"]  
    ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"]
  end

  #this method creates 12 "key of" transposition hashes when the module is included in an instantiated song object
  #the metaprogramming syntax is somehwat obfuscated, but hopefully preferable to maintaining 12 separate key hashes
  #todo: figure out how to display enharmonic spellings appropriately
  def self.included(base)
      keys_array = self.keys
      keys_array.each_with_index do |key, i|
      base.send(:define_method, "key_of_#{key.downcase}") do
      chord_hash = {
          #diatonic chords
          "IMaj7" => "#{keys_array[i]}Maj7",
          "IImin7" => "#{keys_array[(i+2)%12]}min7",
          "IIImin7" => "#{keys_array[(i+4)%12]}min7",
          "IVMaj7" => "#{keys_array[(i+5)%12]}Maj7",
          "V7" => "#{keys_array[(i+7)%12]}7",
          "VImin7" => "#{keys_array[(i+9)%12]}min7",
          "VIImin7b5" => "#{keys_array[(i+11)%12]}min7",

          #secondary dominants
          "V7_of_II" => "#{keys_array[(i+9)%12]}7",
          "V7_of_III" => "#{keys_array[(i+11)%12]}7",
          "V7_of_IV" => "#{keys_array[i]}7",
          "V7_of_V" => "#{keys_array[(i+2)%12]}7",
          "V7_of_VI" => "#{keys_array[(i+4)%12]}7",

          #substitute dominants
          "sub_V7" => "#{keys_array[(i+1)%12]}7",
          "sub_V7_of_II" => "#{keys_array[(i+3)%12]}7",
          "sub_V7_of_III" => "#{keys_array[(i+5)%12]}7",
          "sub_V7_of_IV" => "#{keys_array[(i+6)%12]}7",
          "sub_V7_of_V" => "#{keys_array[(i+8)%12]}7",
          "sub_V7_of_VI" => "#{keys_array[(i+10)%12]}7",

          #secondary subdominants
          "II_of_II" => "#{keys_array[(i+4)%12]}min7",
          "II_of_III" => "#{keys_array[(i+6)%12]}min7b5",
          "II_of_IV" => "#{keys_array[(i+7)%12]}min7",
          "II_of_V" => "#{keys_array[(i+9)%12]}min7",
          "II_of_VI" => "#{keys_array[(i+11)%12]}min7b5",

          #substitute subdominants
          "sub_II_of_II" => "#{keys_array[(i+10)%12]}min7",
          "sub_II_of_III" => "#{keys_array[i]}min7",
          "sub_II_of_IV" => "#{keys_array[(i+1)%12]}min7",
          "sub_II_of_V" => "#{keys_array[(i+3)%12]}min7",
          "sub_II_of_VI" => "#{keys_array[(i+5)%12]}min7b5",

          #common modal interchange
          "Imin7" => "#{keys_array[i]}min7",
          "bIIMaj7" => "#{keys_array[(i+1)%12]}Maj7",
          "bIIIMaj7" => "#{keys_array[(i+3)%12]}Maj7",
          "IVmin7" => "#{keys_array[(i+5)%12]}min7",
          "Vmin7" => "#{keys_array[(i+7)%12]}min7",
          "bVIMaj7" => "#{keys_array[(i+8)%12]}Maj7",
          "bVIIMaj7" => "#{keys_array[(i+10)%12]}Maj7",
          "bVII7" => "#{keys_array[(i+10)%12]}7",

          #II & V of modal interchange tonics
          "II_of_bII" => "#{keys_array[(i+3)%12]}min7",
          "V7_of_bII" => "#{keys_array[(i+8)%12]}7",
          "II_of_bIII" => "#{keys_array[(i+5)%12]}min7",
          "V7_of_bIII" => "#{keys_array[(i+10)%12]}7",
          "II_of_bVI" => "#{keys_array[(i+10)%12]}min7",
          "V7_of_bVI" => "#{keys_array[(i+3)%12]}7",
          "II_of_bVII" => "#{keys_array[i]}min7",
          "V7_of_bVII" => "#{keys_array[(i+5)%12]}7",

          #blues
          "I7" => "#{keys_array[i]}7",
          "IV7" => "#{keys_array[(i+5)%12]}7"
        }
        transpose(chord_hash)
      end
    end
  end

  def transpose(chord_hash)
    original_chords = array_from_string
    transposed_chords = []
    original_chords.each do |chord|
      transposed_chords << chord_hash[chord]
    end
    group_by_measure(transposed_chords)
  end

end