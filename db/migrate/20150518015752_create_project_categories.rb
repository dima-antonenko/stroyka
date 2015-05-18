class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.string :title, index: true
      t.text   :description, index: true
      t.string :meta_title, index: true
      t.string :meta_description, index: true
      t.string :meta_keywords, index: true
      t.timestamps null: false
    end

    create_table :projects do |t|
      t.string  :title, index: true
      t.text    :description, index: true

      t.decimal :some_area, precision: 5, scale: 2, index: true
      t.decimal :total_area, precision: 5, scale: 2, index: true
      t.decimal :living_area, precision: 5, scale: 2, index: true

      t.decimal :length, precision: 5, scale: 2, index: true
      t.decimal :width, precision: 5, scale: 2, index: true

      t.integer :storey, index: true
      t.integer :rooms, index: true
      t.integer :bedrooms, index: true
      t.integer :wc, index: true


      t.string :meta_title, index: true
      t.string :meta_description, index: true
      t.string :meta_keywords, index: true
      t.timestamps null: false
    end
  end
end
