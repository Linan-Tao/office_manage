class CreateEstates < ActiveRecord::Migration
  def change
    # 固定资产
    create_table :estates do |t|
      t.string :name # 名称
      t.decimal :total, precision: 8, scale: 2 # 金额
      t.decimal :remain_value, precision: 8, scale: 2 # 折旧后金额
      t.date :buy_date # 购买日期
      t.string :note # 备注
      t.integer :number # 数量

      t.timestamps null: false
    end
  end
end
