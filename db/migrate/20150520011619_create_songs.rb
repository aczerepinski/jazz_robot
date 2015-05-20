class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :composer_id
      t.integer :user_id
      t.text :chords
      t.timestamps null: false
    end
  end
end
