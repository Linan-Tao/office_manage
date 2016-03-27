class OrderBill < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  validates_presence_of :order, :total, :pay_date, :pay_account, :directive, :user
end
