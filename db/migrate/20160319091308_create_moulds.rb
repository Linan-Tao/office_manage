class CreateMoulds < ActiveRecord::Migration
  def change
    # 模块
    create_table :moulds do |t|
      t.string :code, index: true, null: false # 唯一编码
      t.string :name # 模块名称
      t.integer :mould_num # 模块数量
      t.integer :length # 长度
      t.integer :width # 宽度
      t.integer :height # 高度
      t.integer :stand # 中站
      t.integer :layer # 层板
      t.integer :move # 活隔
      t.integer :clothes_rail # 衣杆
      t.integer :door # 门板
      t.integer :miss_left # 左缺
      t.integer :miss_right # 右缺
      t.integer :miss_birdge # 梁缺
      t.integer :miss_angle # 缺角
      t.integer :corner # 转角
      t.integer :left_division # 左分割
      t.integer :board_back # 背板
      t.integer :board_stand # 站板
      t.integer :board_top # 顶板
      t.integer :board_foot # 底板
      t.references :mould_category, index: true, foreign_key: true # 所属类型
      t.string :note # 备注
      t.string :creator # 创建者
      t.boolean :status, default: true # 是否可用状态

      t.timestamps null: false
    end
  end
end
