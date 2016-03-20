class CreateProduces < ActiveRecord::Migration
	#生产单
  def change
    create_table :produces do |t|
      t.references :produce_task, index: true, foreign_key: true  #生产任务
      t.datetime :start_time  #开始时间
      t.datetime :end_time    #结束时间
      t.references :work       #工序名称

      t.timestamps null: false
    end
  end
end
