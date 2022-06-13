class AssignmentsController < ApplicationController

  # def new
  #   @assignment = Assignment.new
  # end

  def create
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @assignment = Assignment.new(user: @user, task: @task)
    authorize @assignment
    @assignment.save
    redirect_to task_path(@task, anchor: "top-of-list")
  end

  def destroy
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @assignment = Assignment.find_by(task: @task, user: @user)
    authorize @assignment
    @assignment.destroy
    redirect_to task_path(@task, anchor: "top-of-list")
  end

  private

  def assignment_params
    params.require(:assignment).permit(:user_id, :task_id)
  end

end
