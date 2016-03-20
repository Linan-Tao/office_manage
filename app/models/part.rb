class Part < ActiveRecord::Base
	belongs_to :part_category
	belongs_to :supplier
	has_many :purchases, as: :item
	has_many :offers, as: :item
end
