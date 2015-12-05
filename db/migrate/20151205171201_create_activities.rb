class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :postable_id
      t.string :postable_type

      t.timestamps null: false
    end
  end
end
