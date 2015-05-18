class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :title, index: true
      t.text :content, index: true
      t.string :meta_title, index: true
      t.string :meta_description, index: true
      t.string :meta_keywords, index: true
      t.timestamps null: false
    end
    remove_column :site_variables, :value, :string
    add_column :site_variables, :value, :text
  end
end
