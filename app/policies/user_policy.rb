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
    user = User.find(params[:id])
    if user == current_user
      true
    else
      false
    end
  end

  def update
    user = User.find(params[:id])
    if user == current_user
      true
    else
      false
    end
  end
end
