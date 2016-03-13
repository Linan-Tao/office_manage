class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name # 产品名称
      t.string :code # 产品编号
      t.string :remark, null: true # 备注
      t.timestamps null: false
    end

    Product.create(:name => "橱柜体", :code => '1')
    Product.create(:name => "橱柜门", :code => '2')
    Product.create(:name => "家具", :code => '3')
    Product.create(:name => "衣柜门", :code => '4')
    Product.create(:name => "配件", :code => '5')
    Product.create(:name => "电器", :code => '6')
    Product.create(:name => "其他", :code => '7')
  end
end
