class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]
  before_action :set_project, only: [:new, :create, :update]

  def index
    @tasks = Task.where(project_id: @project)
  end

  def show
    @users_available = User.where.not(id: @task.users)
    @project = @task.project
    if params[:query].present?
      @users_available = User.search_by_name(params[:query]).where.not(id: @task.users)
    else
      @users_available = User.where.not(id: @task.users)
    end
  end

  def new
    @task = Task.new
    @task.project = @project
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    authorize @task
    @task.project = @project
    if @task.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = @task.project
  end

  def update
    if @task.update(task_params)
      redirect_to(request.referrer || root_path)

    else
      render :edit
    end
  end

  def destroy
    @project = @task.project
    @task.destroy
    redirect_to project_path(@project)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :estimated_effort, :due_date, :notes, :status)
  end

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
