class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :tasks_completed, :update, :destroy ]

  def new
    # @project = Project.new
    # authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @project = Project.new
    # authorize @project
    @projects_pm = policy_scope(Project).where(user_id: current_user)
    @projects_worker = current_user.projects_as_contributor
    @today = "2022-06-18"

    if params[:query].present?
      @projects_pm = Project.where(
        ["name ILIKE :name and user_id = :current_user",
          {name: "%#{params[:query]}%",
          current_user: current_user
          }
        ]
      )
      @projects_worker.select! do |project|
        project.name.downcase.include?(params[:query].downcase)
      end
    end

    # start_date = params.fetch(:created_at, Date.today).to_date
    # @projects = Project.where(due_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @projects = current_user.projects
  end

  def show
    #definir @tasks com base no filtro
    if params[:query].present?
      @tasks = Task.where(
        ["name ILIKE :name and project_id = :project_id",
          {name: "%#{params[:query]}%",
          project_id: @project.id
          }
        ]
      )
    else
      @tasks = @project.tasks
    end

    @tasks_status = @project.tasks
    @total_tasks = @tasks_status.count
    @total_completed = @tasks_status.select do |task_status|
      task_status.status == "completed"
    end
    @tasks_count = @total_completed.count
    @progress = @tasks_count / @total_tasks.to_f
    @progress_percent = (@progress * 100)
  end

  def edit
  end

  def update
    if @project.status_changed?
      if @project.tasks.where.not(status: "completed").present?
        flash[:alert] = "This project has open tasks."
        redirect_to project_path(@project)
      end
    end
    @project.update(project_params)
    redirect_to project_path(@project)

    # if @project.update(project_params)
    #   @project.files.attach(params[:project][:files]) if params.dig(:project, :files).present?
    # end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:name, :description, :status, :price, :due_date, files: [])
  end
end
