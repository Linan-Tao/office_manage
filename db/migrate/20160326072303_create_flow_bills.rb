class CreateFlowBills < ActiveRecord::Migration
  # 每日流水单
  def change
    create_table :flow_bills do |t|
      t.datetime :bill_date # 支出日期活着收入日期
      t.string :customer # 付款或者收款客户
      t.decimal :total, precision: 8, scale: 2 # 收款金额
      t.string :account # 收款或付款账号
      t.string :note # 备注摘要
      t.string :server_code # 关联终端号
      t.string :order_code # 订单号
      t.string :bill_code  # 票据号
      t.integer :operator # 操作员
      t.datetime :operate_date # 操作日期
      t.integer :check_status # 审核状态
      t.datetime :check_date # 审核日期
      t.references :application_fund, index: true, foreign_key: true # 资金科目
      t.string :checker # 审核人
      t.integer :bill_type # 单据类型，0收入，1支出
      t.string :purchase_code # 采购单号

      t.timestamps null: false
    end
  end
end
