class Order < ActiveRecord::Base
  has_many :products # 一个订单包含多个产品
  validates_presence_of :code

end
