require 'sinatra'

get '/' do
  erb :index
end

get '/jquery.js' do
  erb :jquery
end