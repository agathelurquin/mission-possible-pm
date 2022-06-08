class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # condition if
    @project.save
    # redirect to project_path(@project), the view page of the created project
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :status, :price, :due_date)
  end
end
