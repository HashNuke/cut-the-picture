require 'sinatra'
require 'rest-client'
require 'json'
require 'debugger' if ENV['RACK_ENV'] == "development"

get '/' do
  json = JSON(RestClient.get "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20flickr.photos.recent%20where%20api_key%3D'#{ENV['FLICKR_KEY']}'&format=json")


  @images = []
  json["query"]["results"]["photo"].each do |image|
    @images.push "'http://farm#{image["farm"]}.static.flickr.com/#{image["server"]}/#{image["id"]}_#{image["secret"]}.jpg'"
  end

  @images = @images.join(",")
  erb :index
end

get '/jquery.js' do
  erb :jquery
end

get '/loader.gif' do
  erb :loader
end

run Sinatra::Application