class Order < ActiveRecord::Base
  has_many :products # 一个订单包含多个产品
  validates_presence_of :order_code
  has_many :order_units
  has_many :order_parts

  #订单状态:未拆单，已拆单，已报价，已审核，已下单
  enum status: [:not_separate, :separated, :offered, :checked, :open]

  def self.status
    [['未拆单', 'not_separate'], ['已拆单', 'separated'], ['已报价', 'offered'], ['已审核', 'checked'], ['已下单', 'open']]
  end

  def status_name
  	case status
  	when 'not_separate' then '未拆单'
  	when "separated" then '已拆单'
  	when "offered" then '已报价'
    when "checked" then '已审核'
	when "open" then 	'已下单'
	else 
		"未知状态"
	end
  end
end
