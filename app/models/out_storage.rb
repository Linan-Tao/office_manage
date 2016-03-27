class OutStorage < ActiveRecord::Base
  belongs_to :department
  belongs_to :produce_task
  belongs_to :user
  validates_presence_of :out_date, :out_user, :produce_task, :item_id, :item_type, :number, :user
end
