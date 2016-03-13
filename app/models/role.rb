class Role < ActiveRecord::Base

  ADMINISTRATOR = 'administrator'.freeze

  has_and_belongs_to_many :users, :join_table => :roles_users
  has_many :roles_permissions
  accepts_nested_attributes_for :roles_permissions, allow_destroy: true
  validates_presence_of :name
  validates_presence_of :key


  @@permissions = {}
  cattr_reader :permissions

  def self.register_permission(hash)
    klass = hash.delete(:class)
    # require 'pry'
    # binding.pry
    klass.constantize.rescue_from Account::PermissionDenied do |exception|
      redirect_to root_path(message: '没有访问权限')
    end

    klass.constantize.before_action do
      current_user.permit!(self.class, action_name)
    end

    @@permissions[klass] ||= {}
    @@permissions[klass][:name] = hash[:name]
    @@permissions[klass][:actions] = hash[:actions]
  end

  def permission?(klass, action)
    roles_permissions.detect { |r| r.permission?(klass, action) }
  end

  def editable?
    key != ADMINISTRATOR
  end
end
