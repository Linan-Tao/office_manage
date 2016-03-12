class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_save :set_user_role

  def set_user_role
  	department = Department.find_by(id: self.department_id)
  	if department && !(self.has_role? :admin)
  		role = Pinyin.t(department.name, splitter: '')
  		# 人事调动时首先删除原来的部门的权限，再赋予新的部门权限
  		self.roles.map(&:name).each do |r|
  			if r != role
  				self.remove_role r.to_sym
  			end
  		end
  		unless self.has_role? role.to_sym
  			self.add_role role.to_sym
  		end
  	end
  end
end
