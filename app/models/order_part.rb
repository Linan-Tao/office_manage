class OrderPart < ActiveRecord::Base
	has_one :produce_tasks, as: :item
end
