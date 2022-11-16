class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :mp3
      t.string :description
      t.binary :thumbnail

      t.timestamps
    end
  end
end
