class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new
    if user.admin
      true
    else
      false
    end
  end

  def create
    if user.admin
      true
    else
      false
    end
  end

  def edit
    if record.user == current_user
      true
    else
      false
    end
  end

  def update
    if record.user == current_user
      true
    else
      false
    end
  end
end
