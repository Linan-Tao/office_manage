class OutStorage < ActiveRecord::Base
  belongs_to :department
  belongs_to :produce_task
  belongs_to :user
end
