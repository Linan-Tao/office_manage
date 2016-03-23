class Produce < ActiveRecord::Base
  belongs_to :produce_task
  belongs_to :work
end
