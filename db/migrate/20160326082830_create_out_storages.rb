class CreateOutStorages < ActiveRecord::Migration
  def change
    create_table :out_storages do |t|
      t.datetime :out_date # 出库时间
      t.references :department, index: true, foreign_key: true # 部门
      t.string :out_user # 用户名
      t.references :produce_task, index: true, foreign_key: true # 生产任务号
      t.integer :item_id # 项目Id
      t.string :item_type # 项目类型
      t.string :number # 数量
      t.references :user, index: true, foreign_key: true # 登记人

      t.timestamps null: false
    end
  end
end
