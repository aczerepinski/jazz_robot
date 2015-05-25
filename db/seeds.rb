# msh_chords = "CMaj7, nil, Dmin7, G7, CMaj7, nil, Bmin7b5, E7,
#   Amin7, nil, Bmin7b5, E7, Amin7, D7, Dmin7, G7,
#   Gmin7, C7, FMaj7, nil, Fmin7, Bb7, Dmin7, G7,
#   CMaj7, Dmin7, Emin7, Eb7, Dmin7, G7, CMaj7, nil"

msh_chords = "IMaj7, nil, IImin7, V7, IMaj7, nil, II_of_VI, V7_of_VI,
  VImin7, nil, II_of_VI, V7_of_VI, VImin7, V7_of_V, IImin7, V7,
  II_of_IV, V7_of_IV, IVMaj7, nil, IVmin7, bVII7, IImin7, V7,
  IMaj7, IImin7, IIImin7, sub_V7_of_II, IImin7, V7, IMaj7, nil"

# conf_chords = "FMaj7, nil, Emin7b5, A7, Dmin7, nil, Cmin7, F7,
#     Bb7, nil, Amin7, D7, G7, nil, Gmin7, C7,
#     FMaj7, nil, Emin7b5, A7, Dmin7, nil, Cmin7, F7,
#     Bb7, nil, Amin7, D7, Gmin7, C7, FMaj7, nil,
#     Cmin7, nil, F7, nil, BbMaj7, nil, nil, nil,
#     Ebmin7, nil, Ab7, nil, DbMaj7, nil, Gmin7, C7,
#     FMaj7, nil, Emin7b5, A7, Dmin7, nil, Cmin7, F7,
#     Bb7, nil, Amin7, D7, Gmin7, C7, FMaj7, nil"

blues_chords = "I7,nil, IV7,nil, I7,nil, II_of_IV,V7_of_IV,
IV7,nil, nil,nil, II_of_II,nil, V7_of_II,nil,
IImin7,nil, V7,nil, II_of_II,V7_of_II, IImin7,V7"

Song.create(name: "Blues", chords: blues_chords, chords_per_measure: 2)
Song.create(name: "My Shining Hour", chords: msh_chords, chords_per_measure: 1)
# Song.create(name: "Confirmation", chords: conf_chords, chords_per_measure: 2)
