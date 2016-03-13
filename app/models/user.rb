class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  belongs_to :department
  enum status: {
    busy: 0,       # 在职
    pending: 1,    # 休假
    leave: 2, # 离职
  }

  def self.status
    [['在职', 'busy'], ['休假', 'pending'], ['离职', 'leave']]
  end

  def permission?(klass, action)
    return true if roles.find { |r| r.key == Role::ADMINISTRATOR }
    roles.find { |r| r.permission?(klass, action) }
  end

  def permit!(klass, action)
    fail Account::PermissionDenied unless permission?(klass, action)
  end

  def role?(r)
    roles.exists?(key: r)
  end

  def add_role!(r)
    return true if role?(r)
    role = Role.find_by_key(r)
    return false unless role
    roles << role
  end

end
