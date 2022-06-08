class ProjectsController < ApplicationController

  def show
    @projects = Project.all
  end
end
