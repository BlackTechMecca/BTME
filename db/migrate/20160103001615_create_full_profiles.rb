class CreateFullProfiles < ActiveRecord::Migration
  def change
    create_table :full_profiles do |t|
      t.datetime    :last_modified_timestamp
      t.text        :proposal_comments
      t.text        :associations
      t.text        :interests
      t.datetime    :birth_date
      t.integer     :user_id,       null: false

      t.timestamps                  null: false
    end
    add_index :full_profiles, :user_id,                unique: true
  end
end
