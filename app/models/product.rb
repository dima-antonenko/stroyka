class Product < ActiveRecord::Base


	belongs_to :collection
	has_many :line_items


	

	before_destroy :ensure_not_referenced_by_any_line_item

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "220x180" }, :default_url => "/images/:style/missing.png"

    
	private

	def ensure_not_referenced_by_any_line_item
		if line_items.empty? 
			return true
		else
			errors.add(:base, 'Существуют товарные позиции')
			return false
		end
	end

end
