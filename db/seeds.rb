msh_chords = "IMaj7, nil, IImin7, V7, IMaj7, nil, II_of_VI, V7_of_VI,
  VImin7, nil, II_of_VI, V7_of_VI, VImin7, V7_of_V, IImin7, V7,
  II_of_IV, V7_of_IV, IVMaj7, nil, IVmin7, bVII7, IImin7, V7,
  IMaj7, IImin7, IIImin7, sub_V7_of_II, IImin7, V7, IMaj7, nil"

conf_chords = "IMaj7, nil, II_of_VI, V7_of_VI, VImin7, V7_of_V, II_of_IV, V7_of_IV,
    IV7, nil, II_of_II, V7_of_II, V7_of_VI, nil, IImin7, V7,
    IMaj7, nil, II_of_VI, V7_of_VI, VImin7, V7_of_V, II_of_IV, V7_of_IV,
    IV7, nil, II_of_II, V7_of_II, IImin7, V7, IMaj7, nil,
    II_of_IV, nil, V7_of_IV, nil, IVMaj7, nil, nil, nil,
    II_of_bVI, nil, V7_of_bVI, nil, bVIMaj7, nil, IImin7, V7,
    IMaj7, nil, II_of_VI, V7_of_VI, VImin7, V7_of_V, II_of_IV, V7_of_IV,
    IV7, nil, II_of_II, V7_of_II, IImin7, V7, IMaj7, nil"

blues_chords = "I7,nil, IV7,nil, I7,nil, II_of_IV,V7_of_IV,
IV7,nil, nil,nil, II_of_II,nil, V7_of_II,nil,
IImin7,nil, V7,nil, II_of_II,V7_of_II, IImin7,V7"


Song.create(name: "Blues", chords: blues_chords, chords_per_measure: 2)
Song.create(name: "My Shining Hour", chords: msh_chords, chords_per_measure: 1)
Song.create(name: "Confirmation", chords: conf_chords, chords_per_measure: 2)
