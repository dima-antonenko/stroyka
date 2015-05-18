class AddImageToProduct < ActiveRecord::Migration
  def change
  	add_attachment :product_categories, :image
  end
end
