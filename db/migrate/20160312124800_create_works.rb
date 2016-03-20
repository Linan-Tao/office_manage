class CreateWorks < ActiveRecord::Migration
  def change
    # 工序、订单状态
    create_table :works do |t|
      t.string :name # 工序名称
      t.references :department # 部门
      t.string :symbol_name
      t.integer :sequence # 标准顺序
      t.integer :cycle # 标准周期（天）
      t.string :remark, null: true # 备注
      t.timestamps null: false
    end

    Work.create(:name => '未拆单', :symbol_name => "not_separate", :sequence => 1, :cycle => 24)
    Work.create(:name => '已拆单',:symbol_name => "separated", :sequence => 2, :cycle => 24)
    Work.create(:name => '已报价',:symbol_name => "offered", :sequence => 3, :cycle => 24)
    Work.create(:name => '账单回传',:symbol_name => "waiting_bill", :sequence => 4, :cycle => 8)
    Work.create(:name => '财务审核',:symbol_name => "checked", :sequence => 5, :cycle => 72)
    Work.create(:name => '已下单',:symbol_name => "open", :sequence => 6, :cycle => 24)
    Work.create(:name => '采购',:symbol_name => "purchased", :sequence => 7, :cycle => 72)
    Work.create(:name => '到货',:symbol_name => "arrived", :sequence => 8, :cycle => 0)
    Work.create(:name => '下料',:symbol_name => "xia_liao", :sequence => 9, :cycle => 8)
    Work.create(:name => '机器封边',:symbol_name => "ji_bian", :sequence => 10, :cycle => 8)
    Work.create(:name => '手工封边',:symbol_name => "shou_bian",  :sequence => 11, :cycle => 8)
    Work.create(:name => '异形',:symbol_name => "yi_xing",  :sequence => 12, :cycle => 8)
    Work.create(:name => '排孔',:symbol_name => "pai_kong",  :sequence => 13, :cycle => 8)
    Work.create(:name => '铰链孔',:symbol_name => "jiao_lian",  :sequence => 14, :cycle => 8)
    Work.create(:name => '组装',:symbol_name => "zu_zhuang",  :sequence => 15, :cycle => 8)
    Work.create(:name => '包装',:symbol_name => "bao_zhuang",  :sequence => 16, :cycle => 0)
    Work.create(:name => '入库',:symbol_name => "ru_ku", :sequence => 17, :cycle => 8)
    Work.create(:name => '发货',:symbol_name => "fa_huo",  :sequence => 18, :cycle => 8)
    Work.create(:name => '安装',:symbol_name => "an_zhuang",  :sequence => 19, :cycle => 0)
  end
end
