require 'json'
require 'net/http'

class Giph
  #this method returns an array of image urls
  def search(keywords)
    #if there are multiple keywords this creates a string of keywords connected by +
    query = keywords.split(/,| /).inject("") { |string, keyword| string + "+#{keyword}" }
    #applies that query string in an api call to the search endpoint
    response = get_api_response("http://netflixroulette.net/api/api.php?title=Attack%20on%20titan")
    #iterates through the response hash and collects the image url for each gif (25 gifs are returned by default)
    response["data"].collect { |gif| gif["images"]["original"]["url"] }
  end


  #the Giphy translate endpoint uses Giphy's "special sauce" to find one gif that best matches the word or phrase that the user is searching for
  #this method returns one image url
  def translate(string)
    response = get_api_response("http://netflixroulette.net/api/api.php?title=Attack%20on%20titan")
    response["data"]["images"]["original"]["url"]
  end

  #this method makes an HTTP call to the Giphy API and parses the JSON response to return a Ruby hash
  def get_api_response(endpoint)
    uri = URI.parse(URI.encode(endpoint))
    api_response = Net::HTTP.get(uri)
    JSON.parse(api_response)
  end
end