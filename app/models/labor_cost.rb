class LaborCost < ActiveRecord::Base
  belongs_to :order
  validates_presence_of :item, :number, :price
end
