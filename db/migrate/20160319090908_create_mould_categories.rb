class CreateMouldCategories < ActiveRecord::Migration
  def change
    # 模块类型
    create_table :mould_categories do |t|
      t.string :code, index: true, null: false # 唯一编码
      t.string :name # 名称
      t.string :note # 备注
      t.string :creator # 创建者
      t.boolean :status, default: true # 是否可用状态

      t.timestamps null: false
    end
  end
end
