class CreateRules < ActiveRecord::Migration
  def change
    # 规则
    create_table :rules do |t|
      t.string :code, index: true, null: false # 唯一编码
      t.string :name # 规则名称
      t.references :mould, index: true, foreign_key: true # 模型
      t.references :board, index: true, foreign_key: true # 板件
      t.references :craft, index: true, foreign_key: true # 工艺
      t.references :part, index: true, foreign_key: true # 配件
      t.integer :board_num # 板件数量
      t.integer :length # 长
      t.integer :width #宽
      t.integer :height # 高
      t.string :part_size # 配件尺寸
      t.integer :part_num #配件数量
      t.string :note # 备注
      t.string :creator # 创建者
      t.boolean :status, default: true # 是否可用状态

      t.timestamps null: false
    end
  end
end
