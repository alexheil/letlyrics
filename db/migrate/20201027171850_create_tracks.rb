class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.references :artist
      t.references :album
      t.references :user

      t.string :artist_name
      t.string :album_name
      
      t.string :name
      t.text :content

      t.string :slug

      t.timestamps
    end
  end
end
