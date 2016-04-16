class CreateOrderBills < ActiveRecord::Migration
  def change
    # 订单到款表
    create_table :order_bills do |t|
      t.references :order_union, index: true, foreign_key: true
      t.decimal :total, precision: 8, scale: 2
      t.decimal :paid, precision: 8, scale: 2
      t.decimal :left, precision: 8, scale: 2 #余款
      t.datetime :pay_date #付款日期
      t.string :pay_account #付款账户
      t.integer :directive #指令：下单／发货
      t.references :user, index: true, foreign_key: true #催款人
      t.date :delivery_date #发货日期

      t.timestamps null: false
    end
  end
end
