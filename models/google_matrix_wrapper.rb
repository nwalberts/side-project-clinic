require "csv"
require "faraday"

class GoogleMatrixWrapper
  BASE_URL = "https://maps.googleapis.com/maps/api/distancematrix/json?"

  def self.retrieve_trip(origin, destination)
    response = Faraday.get "#{BASE_URL}origins=#{origin}&destinations=#{destination}&key=AIzaSyBkwwm09gr47HtEOXXMLz63YoQrWVIgkoE"
    return parsed_response = JSON.parse(response.body)
  end

end
