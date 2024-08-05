# app/helpers/tasks_helper.rb
module TasksHelper
  def status_class(status)
    case status
    when 'pending'
      'bg-warning text-dark'
    when 'failure'
      'bg-danger text-white'
    when 'in_progress'
      'bg-primary text-white'
    when 'complete'
      'bg-success text-white'
    else
      ''
    end
  end
end
