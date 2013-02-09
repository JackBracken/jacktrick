require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'time'

require_relative 'models/init'

helpers do
  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  # Use environment variables to store admin user and pass.
  # On herokue they can be set with:
  #   heroku config:add VAR=VALUE

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == [ENV['ADMIN_USER'], ENV['ADMIN_PASS']]
  end

  def convert_date(date)
    date.strftime("%^b %e, %Y - %R")
  end

  def link_to_post(title, post)
    "<a href=\"/blog/post/#{post}\">#{title}</a>"
  end
end

get '/' do
  haml :index, :locals => { :page => "INDEX" }
end

get '/blog/?' do
  @posts = BlogPost.all :limit => 10,
                        :order => :created_at.desc
  haml :blog, :locals => { :page => "BLOG" }
end

get '/blog/new/?' do
  protected!
  haml :new_post, :locals => { :page => "BLOG" }
end

post '/blog/new/?' do
  protected!

  BlogPost.create(
      :title => params[:title],
      :body => params[:body],
      :created_at => Time.now
  )

  redirect '/blog/'
end

get '/blog/delete/:id/?' do
  protected!

  @record = BlogPost.get(params[:id])
  @record.destroy

  redirect '/blog/'
end

get '/blog/:page/?' do
  @posts = BlogPost.all :offset=> ((params[:page].to_i - 1) * 10),
                        :limit => 10,
                        :order => :created_at.desc
  haml :blog, :locals => { :page => "BLOG" }
end

get '/blog/post/:id/?' do
  @post = BlogPost.first(:id => params[:id])
  haml :post, :locals => { :page => "BLOG" }
end

get '/code' do
  haml :code, :locals => { :page => "CODE" }
end

get '/photo' do
  haml :photo, :locals => { :page => "PHOTOGRAPHY" }
end

get '/contact' do
  haml :contact, :locals => { :page => "CONTACT" }
end

get '/dev/random/?' do
  "4"
end

get '/*' do
  status 404
end
