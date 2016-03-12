class Part < ActiveRecord::Base
	belongs_to :part_category
	belongs_to :supplier
end
