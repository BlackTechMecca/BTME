class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.text :title
      t.text :description
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
