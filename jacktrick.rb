require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'time'

helpers do
  def convert_date(date)
    date.strftime("%^b %e, %Y")
  end
end

require_relative 'models/init'

get '/' do
  haml :index, :locals => {:page => "INDEX"}
end

get '/blog' do
  @posts = BlogPost.all :limit => 10,
                        :order => :created_at.desc
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