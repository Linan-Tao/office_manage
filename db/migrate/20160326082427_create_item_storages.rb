class CreateItemStorages < ActiveRecord::Migration
  # 物料，配件入库单
  def change
    create_table :item_storages do |t|
      t.datetime :storage_date # 入库日期
      t.string :receiver # 收货人
      t.references :purchase, index: true, foreign_key: true # 采购单号
      t.integer :item_id # 编号
      t.string :item_type # 类型
      t.string :brand # 品牌
      t.integer :number # 数量
      t.references :supplier, index: true, foreign_key: true # 供应商

      t.timestamps null: false
    end
  end
end
