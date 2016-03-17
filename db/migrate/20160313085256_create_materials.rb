class CreateMaterials < ActiveRecord::Migration
  def change
    # 物料表
    create_table :materials do |t|
      t.string :origin_material # 大板原料
      t.string :type_no # 类别型号
      t.string :brand # 品牌
      t.references :supplier, index: true # 供应商
      t.string :standard_type # 规格型号
      t.string :standard_no # 规格序号
      t.timestamps null: false
    end
  end
end
