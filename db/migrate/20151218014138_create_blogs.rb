class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :lead
      t.text :content
      t.string :article_url
      t.string :image_url
      t.string :category

      t.timestamps null: false
    end
  end
end
