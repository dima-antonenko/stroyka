class Add < ActiveRecord::Migration
  def change
  	add_column :orders, :phone_number, :string
  	add_column :orders, :region, :string
  	add_column :orders, :sity, :string
  end
end
