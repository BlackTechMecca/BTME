class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :name
      t.string :authority
      t.string :license_number
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
