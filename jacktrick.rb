require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'time'

require_relative 'models/init'

helpers do
  def convert_date(date)
    date.strftime("%^b %e, %Y - %R")
  end

  def foo
  end
end

get '/' do
  haml :index, :locals => {:page => "INDEX"}
end

get '/blog/?' do
  @posts = BlogPost.all :limit => 10,
                        :order => :created_at.desc
  haml :blog, :locals => {:page => "BLOG"}
end

get '/blog/:page' do
  @posts = BlogPost.all :offset=> ((params[:page].to_i - 1) * 10),
                        :limit => 10,
                        :order => :created_at.desc
  haml :blog, :locals => {:page => "BLOG"}
end

get '/blog/post/:id' do
  @post = BlogPost.first(:id => params[:id])
  haml :post, :locals => {:page => "BLOG"}
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