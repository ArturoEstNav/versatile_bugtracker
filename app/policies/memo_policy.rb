class MemoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    if record.user_id == user.id
      true
    else
      false
    end
  end

  def update?
    if record.user_id == user.id
      true
    else
      false
    end
  end
end
