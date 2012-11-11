require 'sinatra'
require 'haml'

get '/' do
  haml :index
end

get '/blog' do
  haml :blog
end

get '/code' do
  haml :code
end

get '/photo' do
  haml :photo
end

get '/contact' do
  haml :contact
end
