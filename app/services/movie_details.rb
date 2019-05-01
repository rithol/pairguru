require 'httparty'

class MovieDetails
  URL = "https://pairguru-api.herokuapp.com"

  def initialize(title)
    @title = title.gsub(' ', '%20')
  end

  def details
    response = HTTParty.get(URL + '/api/v1/movies/' + @title)
    response.parsed_response
  end

  def poster(file_name)
    URL + file_name
  end
end
