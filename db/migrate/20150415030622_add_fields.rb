class AddFields < ActiveRecord::Migration
  def change
  	add_column :product_categories, :avatar, :string
  	add_column :posts, :avatar, :string
  	add_column :post_categories, :avatar, :string
  end
end
