class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :mp3, null: false
      t.string :description
      t.binary :thumbnail

      t.timestamps
    end
  end
end
