# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

msh_chords = "CMaj7, nil, Dmin7, G7, CMaj7, nil, Bmin7b5, E7,
  Amin7, nil, Bmin7b5, E7, Amin7, D7, Dmin7, G7,
  Gmin7, C7, FMaj7, nil, Fmin7, Bb7, Dmin7, G7,
  CMaj7, Dmin7, Emin7, Eb7, Dmin7, G7, CMaj7, nil"

conf_chords = "FMaj7, nil, Emin7b5, A7, Dmin7, nil, Cmin7, F7,
    Bb7, nil, Amin7, D7, G7, nil, Gmin7, C7,
    FMaj7, nil, Emin7b5, A7, Dmin7, nil, Cmin7, F7,
    Bb7, nil, Amin7, D7, Gmin7, C7, FMaj7, nil,
    Cmin7, nil, F7, nil, BbMaj7, nil, nil, nil,
    Ebmin7, nil, Ab7, nil, DbMaj7, nil, Gmin7, C7,
    FMaj7, nil, Emin7b5, A7, Dmin7, nil, Cmin7, F7,
    Bb7, nil, Amin7, D7, Gmin7, C7, FMaj7, nil"

Song.create(name: "My Shining Hour", chords: msh_chords, chords_per_measure: 1)
Song.create(name: "Confirmation", chords: conf_chords, chords_per_measure: 2)