class CreateJobLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :job_logs do |t|
      
      t.string :action
      t.string :thing_name
      t.string :from
  
      t.integer :user_id

      t.timestamps
    end
  end
end
