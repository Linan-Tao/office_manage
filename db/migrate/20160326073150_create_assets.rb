class CreateAssets < ActiveRecord::Migration
  # 固定资产
  def change
    create_table :assets do |t|
      t.string :name
      t.decimal :total, precision: 8, scale: 2
      t.decimal :remain_value, precision: 8, scale: 2 #折旧后金额
      t.datetime :buy_date
      t.string :note
      t.integer :number

      t.timestamps null: false
    end
  end
end
