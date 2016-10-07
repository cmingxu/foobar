class AccessoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user_id: user.id)
    end
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def hold?
    true
  end

  def publish?
    user.admin?
  end

  def time_due?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
