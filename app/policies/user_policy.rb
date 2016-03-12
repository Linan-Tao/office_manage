class UserPolicy
  attr_reader :user

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.has_role?(:admin) || @user.has_role?(:renshibu)
  end

  def show?
    @user.has_role?(:admin) || @user.has_role?(:renshibu)
  end

  def create?
    @user.has_role?(:admin) || @user.has_role?(:renshibu)
  end

  def new?
    create?
  end

  def update?
    @user.has_role?(:admin) || @user.has_role?(:renshibu)
  end

  def edit?
    update?
  end

  def destroy?
    @user.has_role?(:admin) || @user.has_role?(:renshibu)
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
