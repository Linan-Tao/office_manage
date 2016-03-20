class Order < ActiveRecord::Base
  has_many :products # 一个订单包含多个产品
  validates_presence_of :order_code
  has_many :order_units
  has_many :order_parts
  has_many :produce_tasks
  has_many :offers
  accepts_nested_attributes_for :offers
  belongs_to :work

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
