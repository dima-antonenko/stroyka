class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	PAYMENT_TYPES = [ "Наличный расчет", "Оплата банковской картой" ]

	 validates :name, presence: true
	 validates :phone_number, presence: true

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

	def insert_params_data(order)
       @order = Order.find(id)
    end
end
