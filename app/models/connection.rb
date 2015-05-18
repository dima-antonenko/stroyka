class Connection < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :collection
end
