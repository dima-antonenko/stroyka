class CreateSiteVariables < ActiveRecord::Migration
  def change
    create_table :site_variables do |t|
      t.string  :name, index: true
      t.string  :value, index: true
      t.timestamps null: false
    end
  end
end
