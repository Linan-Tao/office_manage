class CreateOrders < ActiveRecord::Migration
  def change
    # 订单表
    create_table :orders do |t|
      t.string :order_code # 全局唯一标识符号
      t.references :product # 产品编号
      t.string :customer_code # 客户单号
      t.references :agent # 经销商
      t.string :server_code # 客服终端编号
      t.integer :order_type # 订单类型： 1正常单，2补单，3加急单，4批量单
      t.string :patch_origin # 补单原单号
      t.references :work, index: true, foreign_key: true#工序名称
      t.datetime :offer_time # 分解报价时间
      t.datetime :check_time # 到款审核时间
      t.datetime :verify_time # 账单回传时间
      t.datetime :require_time # 要求发货时间
      t.datetime :send_time # 实际发货时间
      t.string :employee # 接单员
      t.timestamps null: false
    end
  end
end
