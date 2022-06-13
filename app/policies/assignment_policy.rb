class AssignmentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def create?
    record.task.project.user == user
  end

  def destroy?
    record.task.project.user == user
  end

end
