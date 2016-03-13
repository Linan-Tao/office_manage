class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :types # 类型：  1、下单条件;   2、发货条件;    3、其他条件
      t.string :name # 动作  11全款下单;  12定金下单;  13直接下单;  21全款发货;  22定金发货;  23直接发货
      t.string :remark, null: true # 备注
      t.timestamps null: false
    end

     Condition.create(:types => '11', :name => '全款下单')
     Condition.create(:types => '12', :name => '定金下单')
     Condition.create(:types => '13', :name => '直接下单')
     Condition.create(:types => '21', :name => '全款发货')
     Condition.create(:types => '22', :name => '定金发货')
     Condition.create(:types => '23', :name => '直接发货')
  end
end
