class CreateMaterialCategories < ActiveRecord::Migration
  def change
    create_table :material_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
