class CreateWorks < ActiveRecord::Migration
  def change
    # 工序、订单状态
    create_table :works do |t|
      t.string :name # 工序名称
      t.references :department # 部门
      t.integer :sequence # 标准顺序
      t.integer :cycle # 标准周期（天）
      t.string :remark, null: true # 备注
      t.timestamps null: false
    end

    Work.create(:name => '分解报价', :sequence => 1, :cycle => 24)
    Work.create(:name => '账单回传', :sequence => 2, :cycle => 8)
    Work.create(:name => '财务审核', :sequence => 3, :cycle => 72)
    Work.create(:name => '已下单', :sequence => 4, :cycle => 24)
    Work.create(:name => '采购', :sequence => 5, :cycle => 72)
    Work.create(:name => '到货', :sequence => 6, :cycle => 0)
    Work.create(:name => '下料', :sequence => 7, :cycle => 8)
    Work.create(:name => '机器封边', :sequence => 8, :cycle => 8)
    Work.create(:name => '手工封边',  :sequence => 9, :cycle => 8)
    Work.create(:name => '异形',  :sequence => 10, :cycle => 8)
    Work.create(:name => '排孔',  :sequence => 11, :cycle => 8)
    Work.create(:name => '铰链孔',  :sequence => 12, :cycle => 8)
    Work.create(:name => '组装',  :sequence => 13, :cycle => 8)
    Work.create(:name => '包装',  :sequence => 14, :cycle => 0)
    Work.create(:name => '入库',  :sequence => 15, :cycle => 8)
    Work.create(:name => '发货',  :sequence => 16, :cycle => 8)
    Work.create(:name => '安装',  :sequence => 17, :cycle => 0)
  end
end
