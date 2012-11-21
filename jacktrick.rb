require 'sinatra'
require 'haml'

get '/' do
  haml :index, :locals => {:page => "HOME"}
end

get '/blog' do
  haml :blog, :locals => {:page => "BLOG"}
end

get '/code' do
  haml :code, :locals => {:page => "CODE"}
end

get '/photo' do
  haml :photo, :locals => {:page => "PHOTOGRAPHY"}
end

get '/contact' do
  haml :contact, :locals => {:page => "CONTACT"}
end