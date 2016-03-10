class Department < ActiveRecord::Base

	def manager
		User.find_by(id: manager_id)
	end
end
