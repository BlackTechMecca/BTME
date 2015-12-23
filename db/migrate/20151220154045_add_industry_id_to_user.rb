class AddIndustryIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :industry_id, :integer
  end
end
