class CreateOffers < ActiveRecord::Migration
  #报价单
  def change
    create_table :offers do |t|
      t.references :order, index: true, foreign_key: true
      t.string :item_name #计价项目
      t.integer :item_id, index: true # 计价物料／配件id，用polymorphic方式
      t.string :item_type # 计价物料／配件
      t.decimal :number, precision: 9, scale: 6  #数量，物料按面积来算，配件按个数来算
      t.decimal :price, precision: 8, scale: 2 #价格
      t.decimal :total, precision: 8, scale: 2 #总价
      t.string :category #类别
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
