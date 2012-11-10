require 'sinatra'
require 'haml'

get '/' do
  haml :layout
end

get '/index' do
  redirect '/index.html'
end

get '/photo' do
  "This is the photography page"
end

get '' do

end
