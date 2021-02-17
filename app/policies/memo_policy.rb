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
    user = current_user
    record = @memo
    if user == record.user
      true
    else
      false
    end
  end

  def update?
    user = current_user
    record = @memo
    if user == record.user
      true
    else
      false
    end
  end
end
