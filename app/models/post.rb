class Post < ActiveRecord::Base
	belongs_to :post_category


	has_attached_file :avatar, :styles => { :medium => "350x220>", :thumb => "80x80>" }, :default_url => "/images/:style/missing.png"
end
