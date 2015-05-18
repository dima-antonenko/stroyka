class StaticController < ApplicationController
	def home

		@slider = Slider.first
		@banners = Banner.all
		@products = Product.limit(8).order(created_at: :desc)
		@text_home = SiteVariable.where(place: "page_home")

		render 'home'
	end

	def delivery_and_pay
		@text_delivery_and_pay = SiteVariable.where(place: "page_delivery_pay")
		render 'delivery_and_pay'
	end

	def contacts
		@text_contacts = SiteVariable.where(place: "page_contact")
		render 'contacts'
	end
end
