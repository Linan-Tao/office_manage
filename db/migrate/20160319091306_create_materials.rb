class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :material_category, index: true, foreign_key: true
      t.references :material_type, index: true, foreign_key: true
      t.integer :number
      t.decimal :price, precision: 9, scale: 6
      t.string :code
      t.string :unit
      t.references :supplier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
