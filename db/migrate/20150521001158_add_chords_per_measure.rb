class AddChordsPerMeasure < ActiveRecord::Migration
  def change
    add_column :songs, :chords_per_measure, :integer
  end
end
