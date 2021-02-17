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

  def edit?
    user = current_user
    record = @ticket
    if user == record.user
      true
    else
      false
    end
  end

  def update?
    user = current_user
    record = @ticket
    if user == record.user
      true
    else
      false
    end
  end

  def show?
    true
  end
end
