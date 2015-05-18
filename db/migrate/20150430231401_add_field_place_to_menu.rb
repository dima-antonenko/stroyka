class AddFieldPlaceToMenu < ActiveRecord::Migration
  def change
  	add_column :menus, :place, :string
  	add_index :menus, :place
  end
end
