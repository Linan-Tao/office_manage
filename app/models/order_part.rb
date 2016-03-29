class OrderPart < ActiveRecord::Base
	belongs_to :order
  has_one :produce_tasks, as: :item
  belongs_to :part
  attr_accessor :part_category_id

end
