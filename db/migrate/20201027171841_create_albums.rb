class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.references :artist
      t.string :artist_name
      
      t.string :name

      t.string :slug

      t.timestamps
    end
  end
end
