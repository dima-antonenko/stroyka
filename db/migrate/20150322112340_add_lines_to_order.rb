class AddLinesToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :products, :string
  	add_column :orders, :total_price, :integer
  end
end
