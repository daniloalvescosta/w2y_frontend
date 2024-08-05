# app/services/task_service.rb
class TasksService
  def self.get_tasks(auth_token)
    connection = Faraday.new(url: ENV.fetch('AUTH_URL', 'http://localhost:4000')) do |faraday|
      faraday.request :json
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    response = connection.get('/tasks') do |req|
      req.headers['Authorization'] = "Bearer #{auth_token}"
      req.headers['Content-Type'] = 'application/json'
    end

    handle_response(response)
  end

  def self.get_task(auth_token, uuid)
    connection = Faraday.new(url: ENV.fetch('AUTH_URL', 'http://localhost:4000')) do |faraday|
      faraday.request :json
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    response = connection.get("/vehicles?uuid=#{uuid}") do |req|
      req.headers['Authorization'] = "Bearer #{auth_token}"
    end

    handle_response(response)
  end

  private

  def self.handle_response(response)
    case response.status
    when 200..299
      puts 'Request successful'
      JSON.parse(response.body)
    else
      puts "Error: #{response.status} - #{response.body}"
      nil
    end
  end
end
