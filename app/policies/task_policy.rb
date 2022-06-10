class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  create?
    true
  end

  def edit?
    # user == > current user
    # record == > @project
    is_owner?
  end

  def update?
    is_owner?
  end

  def is_owner?
    record.user == user
  end

end
