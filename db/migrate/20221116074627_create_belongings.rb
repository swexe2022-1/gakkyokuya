class CreateBelongings < ActiveRecord::Migration[5.2]
  def change
    create_table :belongings do |t|
      t.integer :track_id, null: false
      t.integer :playlist_id, null: false
      
      t.timestamps
    end
    add_index :belongings, [:track_id, :playlist_id], unique: true
  end
end
