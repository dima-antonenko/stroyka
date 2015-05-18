class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :post_category
      t.string :title, index: true
      t.text :text
      t.text :lead, index: true
      t.string :image, index: true
      t.string :meta_title, index: true
      t.string :meta_description, index: true
      t.string :meta_keywords, index: true
      t.timestamps null: false
    end
  end
end
