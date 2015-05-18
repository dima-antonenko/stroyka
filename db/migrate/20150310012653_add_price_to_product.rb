class AddPriceToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :price, :decimal
  	add_index :products, :price
  end
end
