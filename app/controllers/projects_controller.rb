class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :update ]

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    @project.user = current_user
    if @project.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @projects_pm = Project.where(user_id: current_user)
    @projects_worker = current_user.projects_as_contributor
    @projects_pm = policy_scope(Project).order(created_at: :desc)
  end

  def show
    # How to set the rule for show projects where user = one of the participants of the project
    # With assignments
    authorize @project
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
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
