class RolesPermission < ActiveRecord::Base
	belongs_to :role
  def permission?(klass, action)
    self.klass == klass.to_s && actions.to_s.split(',').include?(action.to_s)
  end
end