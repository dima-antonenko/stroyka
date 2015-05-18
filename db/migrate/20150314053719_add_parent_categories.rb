class AddParentCategories < ActiveRecord::Migration
  def change
  	add_column :product_categories, :product_category_id, :integer, index: true
  end
end
