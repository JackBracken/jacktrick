require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'data_mapper'
require 'dm-sqlite-adapter'
require 'time'

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db/jacktrick_test")

class BlogPost
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String, :required => true, :length => 80
  property :created_at, DateTime
  property :body,       Text
end

# DataMapper.auto_migrate!
DataMapper.finalize

# Two small test cases

first_post = BlogPost.new
first_post.title = "Aggabag"
first_post.body = "I am a blog post thing. LOL! This is the last line??"
first_post.save

s_post = BlogPost.new
s_post.title = "The black eyed peas are shit"
s_post.body = "It's true. Their music is atrocious, like a bunch of retards getting the shit  kicked out of them by cats."
s_post.save

helpers do
  def convert_date(date)
    date.strftime("%^b %e, %Y")
  end
end

get '/' do
  @posts = BlogPost.all :limit => 10,
                        :order => :created_at.desc
  haml :index, :locals => {:page => "INDEX"}
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