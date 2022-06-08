class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.find(params[:id])
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

  def dining_params
    params.require(:task).permit(:name, :description, :price, :due_date)
  end
end
