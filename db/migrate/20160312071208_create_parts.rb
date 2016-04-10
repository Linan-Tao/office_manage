class CreateParts < ActiveRecord::Migration
  def change
    # 配件表
    create_table :parts do |t|
    	t.references :part_category, index: true, foreign_key: true
    	t.string :name # 名称
      t.decimal :buy, precision: 8, scale: 2 # 进价
    	t.decimal :sell, precision: 8, scale: 2 # 售价
    	t.integer :number # 库存
    	t.string :brand # 品牌
    	t.references :supplier, index: true #供货商
      t.timestamps null: false
    end
  end
end
