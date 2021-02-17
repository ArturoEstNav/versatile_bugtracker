class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    if user.admin
      true
    else
      false
    end
  end

  def update?
    if user.admin
      true
    else
      false
    end
  end

  def index?
    true
  end

  def show?
    true
  end
end
