class Produce < ActiveRecord::Base
  belongs_to :produce_task
  belongs_to :work
  validates_presence_of :produce_task, :start_time, :end_time, :work
end
