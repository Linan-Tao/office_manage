class Order < ActiveRecord::Base
  has_many :products # 一个订单包含多个产品
  belongs_to :order_union
  
  has_many :order_units, dependent: :destroy
  has_many :order_parts, dependent: :destroy
  has_many :order_bills, dependent: :destroy
  has_many :offers, dependent: :destroy
  accepts_nested_attributes_for :offers, :order_units, :order_parts, :allow_destroy => true
  belongs_to :work
  belongs_to :agent

  before_create :generate_order_code

  def generate_order_code
    begin
      orders_count = self.order_union.orders.count
      self.order_code = self.order_union.code + "-" + (orders_count+1).to_s
    end while self.class.exists?(:order_code => order_code)
  end

  enum order_type: {
    normal: 0,      #正常单
    urgent: 1,       # 加急单
    patch: 2,    # 补单
  }
  def order_type_name
    case order_type
      when 'normal' then '正常单'
      when 'urgent' then '加急单'
      when "patch" then '补单'
    else
      "未知状态"
    end
  end

  def self.order_type
    [['正常单', 'normal'], ["加急单", "urgent"], ["补单","patch"]]
  end

  # 查询所有已审核的订单
  scope :checked, -> { where("work_id = ?", Work.find_by(symbol_name: "checked").id) }

  def not_separate?
    work.symbol_name == "not_separate"
  end

  def separated?
    work.symbol_name == "separated"
  end

  def checked?
    work.symbol_name == "checked"
  end

  def separated!
    self.work_id = Work.find_by(symbol_name: "separated").id
    self.save!
  end

  def offered!
    self.work_id = Work.find_by(symbol_name: "offered").id
    self.save!
  end

  # 财务已审核，审核后自动产出生产作业单
  def checked!
    self.work_id = Work.find_by(symbol_name: "checked").id
    self.save!
  end

  def open!
    self.work_id = Work.find_by(symbol_name: "open").id
    self.save!
  end

end
