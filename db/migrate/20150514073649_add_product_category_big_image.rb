class AddProductCategoryBigImage < ActiveRecord::Migration
  def change
  	add_attachment :product_categories, :big_image

  end
end
