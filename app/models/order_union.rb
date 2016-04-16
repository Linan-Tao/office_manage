class OrderUnion < ActiveRecord::Base
  belongs_to :agent
  has_many :orders
  has_many :offers, dependent: :destroy

  accepts_nested_attributes_for :orders, :offers, :allow_destroy => true
  before_create :generate_code

  def generate_code
  	begin
      self.code = Time.new.strftime('%Y%m%d') +'-'+ SecureRandom.hex(2)
    end while self.class.exists?(:code => code)
  end

  #下单状态：1.报价中 2.待付款 3.生产中 4.包装入库 5.已发货
  enum status: [:offering, :unpaid, :producing, :package, :sent]

  def self.status
    [['报价中', 'offering'], ["待付款", "unpaid"], ["生产中","producing"], ["包装入库", "package"], ["已发货", "sent"]]
  end
  def status_name
    case status
      when 'offering' then '报价中'
      when 'unpaid' then '待付款'
      when "producing" then '生产中'
      when "package" then '包装入库'
      when "sent" then '已发货'
    else
      "未知状态"
    end
  end

end
