class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show ]

  def index
    @projects_pm = Project.where(user_id: current_user)
    @projects_worker = current_user.projects_as_contributor
  end

  def show
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

end
