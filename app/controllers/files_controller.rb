class FilesController < ApplicationController
  def destroy
    @project = Project.find(params[:project_id])
    @file = ActiveStorage::Attachment.find(params[:id])
    authorize @file
    @file.destroy
    redirect_to project_path(@project)
  end
end

# file_path(@file)
