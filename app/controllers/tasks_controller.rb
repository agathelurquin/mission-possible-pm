class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @project = Project.find(params[:project_id])
    @tasks = Task.where(project_id: @project)
  end

  def show
    @project = Project.find(params[:id])
    @task.project = @project

  end

  def new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.project = @project
    if @task.save
      redirect_to project_task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to project_task_path(@task)
  end

  def destroy
    @project = Project.find(params[:project_id])
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

end
