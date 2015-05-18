class AddAvatarToProdutCategories < ActiveRecord::Migration
  def change
  	add_attachment :product_categories, :avatar
  	add_attachment :posts, :avatar
  	add_attachment :post_categories, :avatar
  end
end
