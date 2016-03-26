class CreateItemStorages < ActiveRecord::Migration
  # 物料，配件入库单
  def change
    create_table :item_storages do |t|
      t.datetime :storage_date
      t.string :receiver
      t.references :purchase, index: true, foreign_key: true
      t.integer :item_id
      t.string :item_type
      t.string :brand
      t.integer :number
      t.references :supplier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
