class OrderBill < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
end
