class DeliveryPlan < ActiveRecord::Base
  belongs_to :order
  belongs_to :logistic_provider
end
