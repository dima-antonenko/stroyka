class AddColumnToBatter < ActiveRecord::Migration
  def change
  	add_column :banners, :link, :string
  	add_index :banners, :link
  end
end
