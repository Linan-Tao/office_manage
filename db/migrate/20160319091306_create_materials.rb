class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :ply # 厚度（板料种类主键）
      t.integer :texture # 材质（板料种类主键）
      t.integer :face # 表面（板料种类主键）
      t.integer :color # 颜色（板料种类主键）
      t.integer :number # 库存
      t.decimal :buy, precision: 8, scale: 2 # 进货单价（仅管理员和财务可见）
      t.decimal :sell, precision: 8, scale: 2 # 出售单价
      t.string :code # 编码
      t.string :unit # 单位
      t.references :supplier, index: true, foreign_key: true # 供应商

      t.timestamps null: false
    end
  end
end
