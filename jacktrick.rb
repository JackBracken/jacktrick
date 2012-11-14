require 'sinatra'
require 'haml'

get '/' do
  @page = "index"
  haml :index, :locals => {:page => "HOME"}
end

get '/blog' do
  @page = "blog"
  haml :blog, :locals => {:page => "BLOG"}
end

get '/code' do
  @page = "code"
  haml :code, :locals => {:page => "CODE"}
end

get '/photo' do
  @page = "photo"
  haml :photo, :locals => {:page => "PHOTOGRAPHY"}
end

get '/contact' do
  @page = "contact"
  haml :contact, :locals => {:page => "CONTACT"}
end