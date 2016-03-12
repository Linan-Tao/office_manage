class PartCategory < ActiveRecord::Base
	has_many :parts
	validates_presence_of :name
end
