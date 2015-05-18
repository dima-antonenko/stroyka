class Collection < ActiveRecord::Base
	has_many :products, dependent: :destroy
	has_many :connections
	has_many :product_categories, through: :connections
end
