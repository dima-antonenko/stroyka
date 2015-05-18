class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.string :title, index: true
      t.string :description
      t.string :meta_title, index: true
      t.string :meta_description, index: true
      t.string :meta_keywords, index: true
      t.timestamps null: false
    end
  end
end
