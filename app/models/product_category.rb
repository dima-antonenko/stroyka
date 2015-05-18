class ProductCategory < ActiveRecord::Base
	has_many :product_categories
	belongs_to :product_category
	
	has_many :connections
	has_many :collections, through: :connections

	has_attached_file :avatar, :styles => { :medium => "340x280>", :thumb => "137x137>" }, :default_url => "/images/:style/missing.png"

    has_attached_file :big_image, :styles => { :medium => "848x300>" }, :default_url => "/images/:style/missing.png"

end
