class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    # @project = Project.find(params[:project_id])
    @project = Project.last
    @task.project = @project
    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    reddirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :estimated_effort, :due_date)
  end
end
