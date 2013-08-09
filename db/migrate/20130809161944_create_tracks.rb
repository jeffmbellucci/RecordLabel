class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, :null => :false
      t.string :name, :null => :false
      t.boolean :bonus, :default => false
      t.text :lyrics

      t.timestamps
    end

    add_index :tracks, :album_id
  end
end
