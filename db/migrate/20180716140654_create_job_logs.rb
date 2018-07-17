class CreateJobLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :job_logs do |t|
      t.string :profile_img_path
      t.string :action
      t.string :gallery_name


      t.timestamps
    end
  end
end
