class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :song, null: false
      t.integer :album_id, null: false
      t.integer :duration
      t.string :version, null: false
      t.timestamps null: false
    end

    add_index :tracks, :song
    add_index :tracks, :album_id
  end
end
