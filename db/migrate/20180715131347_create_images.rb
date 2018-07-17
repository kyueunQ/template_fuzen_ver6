class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :state, default: "first1"
      t.string :concept
      t.string :image_path
      
      t.timestamps
    end
  end
end
