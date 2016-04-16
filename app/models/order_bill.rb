class OrderBill < ActiveRecord::Base
  belongs_to :order_union
  belongs_to :user
  validates_presence_of :order_union, :total, :pay_date, :pay_account, :user

  enum directive: {
    open: 0,  # 下单
    deliver: 1,    # 发货
  }
  def directive_name
    case mix_status
      when 'open' then '下单'
      when "deliver" then '发货'
    else
      "未知状态"
    end
  end

  def self.directive
    [["下单", "open"], ["发货","deliver"]]
  end
end
