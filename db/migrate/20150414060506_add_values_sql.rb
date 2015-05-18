class AddValuesSql < ActiveRecord::Migration
  def change
  	add_column :site_variables, :place, :string
  	
  end
end
