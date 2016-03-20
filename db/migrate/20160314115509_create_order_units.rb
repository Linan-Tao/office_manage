class CreateOrderUnits < ActiveRecord::Migration
  def change
  	# 拆单后订单的部件表
    create_table :order_units do |t|
    	t.references :order, index: true, foreign_key: true
      t.string :code # 编码
      t.string :unit_name #部件名称
      t.string :name # 板料名称
      t.integer :lenght # 长
      t.integer :width # 宽
      t.integer :thick # 高、深、厚
      t.integer :number #数量
      t.string  :size #剪裁尺寸
      t.string :note # 备注
      t.string :color # 颜色
      t.string :edge #封边
      t.string :texture #纹理
      t.string :terminal #终端信息
      t.integer :out_edge_thick # 看面封边厚
      t.integer :in_edge_thick # 里面封边厚
      t.string :back_texture # 背板材质
      t.string :door_type # 门板类别
      t.string :door_mould # 门板造型
      t.string :door_handle_type # 门板拉手类别
      t.string :door_edge_type # 门板封边类别
      t.integer :door_edge_thick # 门板封边厚
      t.references :produce_task, index: true, foreign_key: true
      t.integer :state, default: 0 #已创建生产任务，未创建生产任务
      t.references :user # 工艺员
      t.timestamps null: false
    end
  end
end
