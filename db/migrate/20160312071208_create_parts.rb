class CreateParts < ActiveRecord::Migration
  def change
    # 配件表
    create_table :parts do |t|
    	t.references :part_category, index: true, foreign_key: true
    	t.string :name
    	t.decimal :price, precision: 8, scale: 2
    	t.integer :number
    	t.string :brand
    	t.references :supplier, index: true #供货商
      t.timestamps null: false
    end
  end
end
