class CreateEmojis < ActiveRecord::Migration[5.0]
  def change
    create_table :emojis do |t|
      t.string :state, default: "first1"
      t.string :concept
      t.string :image_path
      
      t.integer :user_id

      t.timestamps
    end
  end
end
