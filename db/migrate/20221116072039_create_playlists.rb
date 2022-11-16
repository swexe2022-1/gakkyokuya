class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :title
      t.binary :thumbnail

      t.timestamps
    end
  end
end
