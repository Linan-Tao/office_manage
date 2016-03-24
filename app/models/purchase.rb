class Purchase < ActiveRecord::Base
  belongs_to :item, polymorphic: true
  belongs_to :user
  validates_presence_of :original_code, :item_id, :item_type, :way, :payable, :actual_pay, :pay_time, :user
end
