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

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    # user == > current user
    # record == > @task
    true
  end

  def update?
    true
  end

  def is_owner?
    record.project.user == user
  end

  def destroy?
    true
  end

end
