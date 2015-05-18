class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :product_category
      t.string :name, index: true
      t.text :description
      t.string :image, index: true
      t.string :sku
      t.string :meta_title, index: true
      t.string :meta_description, index: true
      t.string :meta_keywords, index: true
      t.timestamps null: false
    end
  end
end
