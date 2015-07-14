class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :keys
      t.string :chords

      t.timestamps null: false
    end
  end
end
