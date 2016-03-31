class CreateDeliveryPlans < ActiveRecord::Migration
  # 出货计划单
  def change
    create_table :delivery_plans do |t|
      t.references :order, index: true, foreign_key: true    #订单号
      t.string :produce_task_ids    #关联生产单号
      t.integer :number    #包装件总数
      t.integer :fin_type    #财务审核 0 等待发货 1允许发货
      t.decimal :agency_fund, precision: 8, scale: 2    #代收货款
      t.datetime :delivery_date    #发货日期
      t.integer :specify_logistic    #指定物流
      t.references :logistic_provider, index: true, foreign_key: true    #实际物流
      t.string :logistic_code    #物流反馈单号

      t.timestamps null: false
    end
  end
end
