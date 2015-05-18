class LineItem < ActiveRecord::Base

  belongs_to :line_item
  belongs_to :product
  belongs_to :cart

  def total_price
	product.price * quantity
  end
  
end
