class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  # def new
  #   only admin
  # end

  # def create
  #   only admin

  # end

  # def edit
  #   only self
  # end

  # def update
  #   only self
  # end
end
