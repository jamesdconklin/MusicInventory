class AddOrdToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :ord, :integer, default: 0, null: false
  end
end
