class CreateOrderParts < ActiveRecord::Migration
  def change
  	#订单配件表
    create_table :order_parts do |t|
    	t.references :order, index: true, foreign_key: true
    	t.references :part, index: true, foreign_key: true
    	t.integer    :number #数量
    	t.string     :note #备注
      t.references :produce_task, index: true, foreign_key: true #生产任务单号
      t.integer    :state, default: 0 #已创建生产任务，未创建生产任务
    	t.references :user #录入人
      t.timestamps null: false
    end
  end
end
