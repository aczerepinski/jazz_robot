class AddDifficultyIdToSong < ActiveRecord::Migration
  def change
    add_column :songs, :difficulty_id, :integer
  end
end
