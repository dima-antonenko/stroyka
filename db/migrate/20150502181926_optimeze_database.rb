class OptimezeDatabase < ActiveRecord::Migration
  def change
  	add_index :banners, :created_at
  	add_index :banners, :updated_at
  	add_index :banners, :avatar_file_name
  	add_index :banners, :avatar_content_type
  	add_index :banners, :avatar_file_size
  	add_index :banners, :avatar_updated_at

  	remove_column :post_categories, :avatar
  	remove_column :posts, :avatar
  	remove_column :posts, :image
  	remove_column :product_categories, :avatar
  	remove_column :products, :image

  	add_index :products, :avatar_file_name
  	add_index :products, :avatar_content_type
  	add_index :products, :avatar_file_size
  	add_index :products, :avatar_updated_at

  	add_index :slides, :avatar_file_name
  	add_index :slides, :avatar_content_type
  	add_index :slides, :avatar_file_size
  	add_index :slides, :avatar_updated_at

  	add_index :site_variables, :place
  	add_index :site_variables, :value

  end
end
