class NotificationService
  def self.fetch_notifications
    connection = Faraday.new(url: ENV.fetch('SCRAPPING_URL', 'https://deep-adults-read.loca.lt')) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    response = connection.get('/notifications')

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
