class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @project = Project.find(params[:project_id])
    @task.project = @project
    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :estimated_effort, :due_date)
  end
end
