class Slide < ActiveRecord::Base
   belongs_to :slider

   has_attached_file :avatar, :styles => { :medium => "1903x480>", :thumb => "1220x480>" }, :default_url => "/images/:style/missing.png"
end