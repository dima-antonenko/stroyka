class CreateCollections < ActiveRecord::Migration
  def change

    create_table :collections do |t|
        t.string   :name, index: true
	    t.string   :description, index: true
	    t.string   :interior_list, index: true
	    t.string   :brand, index: true
	    t.string   :country, index: true
	    t.string   :size, index: true
	    t.string   :meta_title, index: true
	    t.string   :meta_description, index: true
	    t.string   :meta_keywords, index: true
	    t.boolean  :to_bathroom, index: true
	    t.boolean  :to_kitchen, index: true
	    t.boolean  :to_corridor, index: true
	    t.boolean  :to_living, index: true
	    t.boolean  :to_fasad, index: true
	    t.boolean  :to_floor, index: true
	    t.boolean  :to_construction, index: true
	    t.boolean  :to_public, index: true
	    t.integer  :basic_category, index: true
      t.timestamps null: false
    end

    create_table :connections do |t|
	    t.belongs_to  :collection, index: true
	    t.belongs_to  :product_category, index: true
    end

    add_column  :products, :collection_id, :integer, index: true
    add_column  :products, :code, :string, index: true
    add_column  :products, :edizm, :string, index: true
    add_column  :products, :field_of_application_list, :string, index: true
    add_column  :products, :place_in_the_collection, :string, index: true
    add_column  :products, :minpart, :string, index: true
    add_column  :products, :cratnost, :string, index: true
    add_column  :products, :weight, :string, index: true
    add_column  :products, :size, :string, index: true
    add_column  :products, :architectural_surface, :string, index: true
    add_column  :products, :base_value, :string, index: true
    add_column  :products, :color_value, :string, index: true
    add_column  :products, :cover_value, :string, index: true
    add_column  :products, :surface_alue, :string, index: true
    add_column  :products, :image, :string, index: true
    add_column  :products, :ballance, :integer, index: true
    add_column  :products, :ballance_count, :decimal, index: true
    add_column  :products, :category, :string, index: true
    add_column  :products, :design_value, :string, index: true
    add_column  :products, :frost_hardiness, :string, index: true
    add_column  :products, :rectified, :string, index: true
    add_column  :products, :to_bathroom, :boolean, index: true
    add_column  :products, :to_kitchen, :boolean, index: true
    add_column  :products, :to_corridor, :boolean, index: true
    add_column  :products, :to_living, :boolean, index: true
    add_column  :products, :to_fasad, :boolean, index: true
    add_column  :products, :to_floor, :boolean, index: true
    add_column  :products, :to_construction, :boolean, index: true
    add_column  :products, :to_public, :boolean, index: true

  end
end
