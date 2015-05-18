class Banner < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :small => "550x220>" }, :default_url => "/images/:style/missing.png"
end
