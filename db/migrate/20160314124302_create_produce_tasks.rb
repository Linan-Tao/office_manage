class CreateProduceTasks < ActiveRecord::Migration
	# 生产任务单
  def change
    create_table :produce_tasks do |t|
    	t.integer :item_id  #订单部件或订单配件ID
    	t.string :item_type #订单部件或订单配件
    	t.references :work, index: true, foreign_key: true #工序名称
    	t.decimal :area, precision: 8, scale: 2 #本单板料面积
    	t.decimal :work_hour, precision: 8, scale: 2 #工时总计
    	t.references :produce, index: true #生产单号
    	t.timestamps :start_time
    	t.timestamps :end_time
   		t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
