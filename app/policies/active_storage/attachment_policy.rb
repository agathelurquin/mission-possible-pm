class ActiveStorage::AttachmentPolicy < ApplicationPolicy
  def destroy?
    @project_id = record.record_id
    @project = Project.find(@project_id)
    @project.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
