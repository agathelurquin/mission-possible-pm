class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = Task.where(project_id: @project)
  end

  def show
    @task.project = @project
    authorize @task
    @users_available = User.where.not(id: @task.users)
  end

  def new
    @task = Task.new
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
    authorize @task
  end

  def update
    @task.update(task_params)
    redirect_to project_task_path(@project, @task)
    authorize @task
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(@project)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :estimated_effort, :due_date)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
