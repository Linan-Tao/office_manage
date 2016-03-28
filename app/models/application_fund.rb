class ApplicationFund < ActiveRecord::Base

  #资金科目类型：1.收入 2.支出
  enum fund_type: [:input, :output]

  def self.fund_type
    [['收入', 'input'], ['支出', 'output']]
  end

  def fund_type_name
    case fund_type
      when 'input' then '收入'
      when "output" then '支出'
    else
      "未知状态"
    end
  end
end
