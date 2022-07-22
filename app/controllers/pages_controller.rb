class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def calendar
    start_date = params.fetch(:created_at, Date.today).to_date
    @projects = current_user.projects.where(due_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

end
