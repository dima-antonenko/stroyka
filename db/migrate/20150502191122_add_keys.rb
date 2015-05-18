class AddKeys < ActiveRecord::Migration
  def change
  	add_index :products, :product_category_id
  	add_index :posts, :post_category_id
  end
end
