class CreatePurchases < ActiveRecord::Migration
	#采购单
  def change
    create_table :purchases do |t|
        t.string  :original_code  #原始单号：混单号／生产单号
    	t.integer :item_id, index: true # 采购物料／配件id，用polymorphic方式
    	t.string :item_type # 采购物料／配件
    	t.string :number #数量
    	t.string :unit #单位
    	t.string :note #备注
    	t.integer :way #下单方式
    	t.integer :arrival_number #到货数量
    	t.decimal :price, precision: 8, scale: 2 #单价
    	t.decimal :payable, precision: 8, scale: 2 #应付款
    	t.decimal :actual_pay, precision: 8, scale: 2 #实付款
    	t.decimal :discount, precision: 8, scale: 2 #折扣
    	t.integer :pay_type #付款方式
    	t.timestamps :pay_time #付款时间
    	t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
