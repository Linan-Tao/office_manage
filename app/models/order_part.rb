class OrderPart < ActiveRecord::Base
  has_one :produce_tasks, as: :item
  belongs_to :part
  attr_accessor :part_category_id
end
