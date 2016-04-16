class CreateCrafts < ActiveRecord::Migration
  def change
    # 工艺
    create_table :crafts do |t|
      t.string :code, index: true, null: false # 唯一编码
      t.string :name # 工艺名称
      t.string :note # 备注
      t.string :creator # 创建者
      t.boolean :status, default: true # 是否可用状态

      t.timestamps null: false
    end
  end
end
