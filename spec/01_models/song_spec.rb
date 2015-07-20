require 'rails_helper'

describe Song do

  it 'has a name, chords, and chords per measure' do
    expect {Song.create(name: "Test Song", chords: "IMaj7, IImin7, V7, IMaj7", chords_per_measure: 2)}.to_not raise_error
    msh_chords = "IMaj7, nil, IImin7, V7, IMaj7, nil, II_of_VI, V7_of_VI,
      VImin7, nil, II_of_VI, V7_of_VI, VImin7, V7_of_V, IImin7, V7,
      II_of_IV, V7_of_IV, IVMaj7, nil, IVmin7, bVII7, IImin7, V7,
      IMaj7, IImin7, IIImin7, sub_V7_of_II, IImin7, V7, IMaj7, nil"
    my_shining_hour = Song.create(name: "My Shining Hour", chords: msh_chords, chords_per_measure: 1)
    expect(my_shining_hour.name).to eq("My Shining Hour")
    expect(my_shining_hour.chords).to eq(msh_chords)
    expect(my_shining_hour.chords_per_measure).to eq(1)
  end

  it 'belongs to a difficulty' do
    hard = Difficulty.create(name: "Insanely Hard")
    song = Song.create(name: "Super hard song", chords: "IMaj7", chords_per_measure: 1)
    song.difficulty = hard
    expect(song.difficulty.name).to eq("Insanely Hard")
  end

  it 'can be transposed into any key' do
    functional_analysis = "IMaj7, V7_of_II, IImin7, V7, bIIIMaj7, sub_V7, IMaj7"
    transposed_to_c = [["CMaj7"], ["A7"], ["Dmin7"], ["G7"], ["EbMaj7"], ["Db7"], ["CMaj7"]]
    transposed_to_f = [["FMaj7"], ["D7"], ["Gmin7"], ["C7"], ["AbMaj7"], ["Gb7"], ["FMaj7"]]
    transposed_to_bb = [["BbMaj7"], ["G7"], ["Cmin7"], ["F7"], ["DbMaj7"], ["B7"], ["BbMaj7"]]
    song = Song.create(name: "Song that will soon be transposed", chords: functional_analysis, chords_per_measure: 1)
    expect(song.key_of_c).to eq(transposed_to_c)
    expect(song.key_of_f).to eq(transposed_to_f)
    expect(song.key_of_bb).to eq(transposed_to_bb)
  end

  it 'is is grouped by measure before being passed to views' do
    blues_chords = "I7,nil, IV7,nil, I7,nil, II_of_IV,V7_of_IV,
      IV7,nil, nil,nil, I7,nil, II_of_II, V7_of_II,
      IImin7,nil, V7,nil, II_of_II,V7_of_II, IImin7,V7"
    s1 = Song.create(name: "One Per Measure", chords: blues_chords, chords_per_measure: 1)
    s2 = Song.create(name: "Two Per Measure", chords: blues_chords, chords_per_measure: 2)
    s4 = Song.create(name: "Four Per Measure", chords: blues_chords, chords_per_measure: 4)
    expect(s1.key_of_c[0].length).to eq(1)
    expect(s2.key_of_c[0].length).to eq(2)
    expect(s4.key_of_c[0].length).to eq(4)
    expect(s4.roman_numerals[0].length).to eq(4)
  end

end