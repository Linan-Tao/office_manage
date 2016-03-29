class OrderPart < ActiveRecord::Base
	has_one :produce_tasks, as: :item
	belongs_to :part
	belongs_to :order
end
