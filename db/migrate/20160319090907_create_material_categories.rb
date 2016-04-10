class CreateMaterialCategories < ActiveRecord::Migration
  def change
    create_table :material_categories do |t|
      t.integer :oftype # 厚度，材质，表面，颜色
      t.string :name # 对应的值
      t.timestamps null: false
    end
  end
end
