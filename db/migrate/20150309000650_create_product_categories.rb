class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name, index: true
      t.text :description
      t.string :meta_title, index: true
      t.string :meta_description, index: true
      t.string :meta_keywords, index: true
      t.timestamps null: false
    end
  end
end
