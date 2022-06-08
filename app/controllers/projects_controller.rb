class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @projects_pm = Project.where(user_id: current_user)
    @projects_worker = current_user.projects_as_contributor
  end

  def show
    # How to set the rule for show projects where user = one of the participants of the project
    # With assignments
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project)

  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :status, :price, :due_date)
  end

end
