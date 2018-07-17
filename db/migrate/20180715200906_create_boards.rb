class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      
            
      t.string :state, :default => "first1"
      # t.string :state_bar, :default => "border border-light"
      
      t.string :concept
      t.string :image_path

      t.timestamps
    end
  end
end
