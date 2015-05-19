class CreateProjectAttacments < ActiveRecord::Migration
  def change
    create_table :project_attacments do |t|
      t.belongs_to :project
      t.string :image
      t.timestamps null: false
    end
  end
end
