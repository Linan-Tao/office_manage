class CreateMeterialCatelogs < ActiveRecord::Migration
  def change
    create_table :meterial_catelogs do |t|
      t.string :name
      t.string :note #备注
      t.timestamps null: false
    end
  end
end

#物料类别表