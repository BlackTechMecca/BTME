class AddUidAndImageUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :image_url, :string
  end
end
