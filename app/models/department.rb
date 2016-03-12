class Department < ActiveRecord::Base
	validates_presence_of :name

	def manager
		User.find_by(id: manager_id)
	end
end
