class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.text :title
      t.text :description
      t.date :date
      t.integer :user_id

      t.timestamps null: false
    end
    drop_table :job_postings
  end
b
end
