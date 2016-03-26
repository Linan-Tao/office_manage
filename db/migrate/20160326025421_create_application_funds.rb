class CreateApplicationFunds < ActiveRecord::Migration
	# 资金科目
  def change
    create_table :application_funds do |t|
      t.integer :fund_type #科目类别 0为收入，1为支出
      t.string :name

      t.timestamps null: false
    end

    ApplicationFund.create(:name => '营业收入', :fund_type => 0)
    ApplicationFund.create(:name => '废旧收入', :fund_type => 0)
    ApplicationFund.create(:name => '租金收入', :fund_type => 0)
    ApplicationFund.create(:name => '物品转让收入', :fund_type => 0)
    ApplicationFund.create(:name => '采购退款', :fund_type => 0)
    ApplicationFund.create(:name => '服务收入', :fund_type => 0)
    ApplicationFund.create(:name => '现金收入', :fund_type => 0)
    ApplicationFund.create(:name => '借入款', :fund_type => 0)
    ApplicationFund.create(:name => '借出款归还', :fund_type => 0)
    ApplicationFund.create(:name => '其他收入', :fund_type => 0)
    ApplicationFund.create(:name => '营业费用', :fund_type => 1)
    ApplicationFund.create(:name => '现金转出', :fund_type => 1)
    ApplicationFund.create(:name => '借出款', :fund_type => 1)
    ApplicationFund.create(:name => '借入款归还', :fund_type => 1)
    ApplicationFund.create(:name => '设备购入', :fund_type => 1)
    ApplicationFund.create(:name => '营业退款', :fund_type => 1)
    ApplicationFund.create(:name => '低值易耗品', :fund_type => 1)
    ApplicationFund.create(:name => '原材料成本', :fund_type => 1)
    ApplicationFund.create(:name => '房租', :fund_type => 1)
    ApplicationFund.create(:name => '水电', :fund_type => 1)
    ApplicationFund.create(:name => '行政费用', :fund_type => 1)
    ApplicationFund.create(:name => '营业费用', :fund_type => 1)
    ApplicationFund.create(:name => '工资', :fund_type => 1)
    ApplicationFund.create(:name => '服务支出', :fund_type => 1)
    ApplicationFund.create(:name => '维修费', :fund_type => 1)
    ApplicationFund.create(:name => '工伤医疗费', :fund_type => 1)
    ApplicationFund.create(:name => '其他支出', :fund_type => 1)
  end
end
