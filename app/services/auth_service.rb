class AuthService < ApplicationService

  def self.login(email, password)
    connection = Faraday.new(url: ENV.fetch('AUTH_URL', 'https://flat-squids-march.loca.lt')) do |faraday|
      faraday.request :json
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    response = connection.post('/login') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        email: email,
        password: password
      }.to_json
    end

    handle_response(response)
  end

  def self.register(email, password)
    connection = Faraday.new(url: ENV.fetch('AUTH_URL', 'https://flat-squids-march.loca.lt')) do |faraday|
      faraday.request :json
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    response = connection.post('/register') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        "user": {
          "email": email,
          "password": password,
          "password_confirmation": password
        }
      }.to_json
    end

    handle_response(response)
  end

  private

  def self.handle_response(response)
    case response.status
    when 200..299
      puts 'Login successful'
      JSON.parse(response.body)
    else
      puts "Error: #{response.status} - #{response.body}"
      nil
    end
  end
end
