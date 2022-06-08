class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show ]

  def index
    @projects = Project.where(user_id: current_user)

  end

  def show
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

end
