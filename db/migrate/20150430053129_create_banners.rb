class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title, index: true
      t.timestamps null: false
    end

    add_attachment :banners, :avatar
  end
end
