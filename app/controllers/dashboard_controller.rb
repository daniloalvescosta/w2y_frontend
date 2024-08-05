class DashboardController < ApplicationController
  include Authenticatable

  def index
    @tasks = TasksService.get_tasks(session[:jwt])
    @notifications = NotificationService.fetch_notifications

    if params[:status].present? && !params[:status].include?('all')
      @tasks = @tasks.select { |task| params[:status].include?(task['status']) }
    end
  end

  def show
    @task = TasksService.get_task(session[:jwt], params[:uuid])
  end

  def new; end

  def create_task
    user_email = session[:email]
    auth_token = session[:jwt]
    vehicle_type = params[:vehicle_type] == "used" ? "carros-usados" : "carros-novos"

    if user_email.present? && auth_token.present? && vehicle_type.present?
      response = TasksService.new_task(user_email, vehicle_type, auth_token)
      if response
        redirect_to '/', notice: 'Task created successfully'
      else
        redirect_to new_path, alert: 'Failed to create task'
      end
    else
      redirect_to new_path, alert: 'All fields are required'
    end
  end

  def destroy
    TasksService.destroy_task(session[:jwt], params[:id])

     redirect_to '/', notice: 'Task deleted successfully'
  end
end
