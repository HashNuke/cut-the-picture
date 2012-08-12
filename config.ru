require 'sinatra'

get '/' do
  json = RestClient.get "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20flickr.photos.recent%20where%20api_key%3D'#{ENV['FLICKR_KEY']}'"
  erb :index
end

get '/jquery.js' do
  erb :jquery
end

run Sinatra::Application