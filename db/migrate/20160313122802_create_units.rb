class CreateUnits < ActiveRecord::Migration
  def change
    # 部件（订单拆解后的产物）
    create_table :units do |t|
      t.string :code # 编码
      t.string :name # 板料名称
      t.integer :lenght # 长
      t.integer :width # 宽
      t.integer :thick # 高、深、厚
      t.string :ramark # 备注
      t.string :order_code # 订单编号
      t.string :color # 柜体颜色
      t.integer :out_edge_thick # 看面封边厚
      t.integer :in_edge_thick # 里面封边厚
      t.string :back_texture # 背板材质
      t.string :back_color # 背板颜色
      t.string :door_type # 门板类别
      t.string :door_color # 门板颜色
      t.string :door_mould # 门板造型
      t.string :door_handle_type # 门板拉手类别
      t.string :door_edge_type # 门板封边类别
      t.integer :door_edge_thick # 门板封边厚
      t.string :customer_code # 客户单号
      t.string :job_code # 任务单号
      t.string :pack_code # 包装单号
      t.string :next_job # 下一工位
      t.string :employee_code # 工艺员
      t.timestamps null: false
    end
  end
end
