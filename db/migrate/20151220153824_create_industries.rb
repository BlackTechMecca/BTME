class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :description
      t.integer :code

      t.timestamps null: false
    end
  end
end
