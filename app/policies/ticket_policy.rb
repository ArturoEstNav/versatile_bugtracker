class TicketPolicy < ApplicationPolicy
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

  def update_hours?
    true
  end

  def edit?
    if user.admin || record.user_id == user.id
      true
    else
      false
    end
  end

  def update?
    if user.admin || record.user_id == user.id
      true
    else
      false
    end
  end

  def show?
    true
  end
end
