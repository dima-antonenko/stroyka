class CreateMenus < ActiveRecord::Migration
  def change

    create_table :menus do |t|
      t.string :title, index: true

      t.timestamps null: false
    end

    create_table :menu_items do |t|
      t.belongs_to :menu, index: true
      t.belongs_to :menu_item, index: true

      t.string :title, index: true
      t.string :link, index: true

      t.timestamps null: false
    end

    create_table :sliders do |t|
      t.string :title, index: true

      t.timestamps null: false
    end

    create_table :slides do |t|
      t.belongs_to :slider, index: true

      t.string :title, index: true
      t.string :content, index: true

      t.timestamps null: false
    end

    add_attachment :slides, :avatar

  end
end
