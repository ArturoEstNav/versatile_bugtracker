class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def new?
  #   admin
  # end

  # def update?
  #   admin
  # end

  def index?
    true
  end

  def show?
    true
  end
end
