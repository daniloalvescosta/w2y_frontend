class DashboardController < ApplicationController
  include Authenticatable

  def index
    @tasks = TasksService.get_tasks(session[:jwt])

    if params[:status].present? && !params[:status].include?('all')
      @tasks = @tasks.select { |task| params[:status].include?(task['status']) }
    end
  end

  def show
    @task = TasksService.get_task(session[:jwt], params[:uuid])
  end

  private
end
