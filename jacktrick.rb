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
  @posts.inspect
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

# get '/populate' do
#     @populate = BlogPost.create(
#       :title => "Foo the bar",
#       :body  => "<p>Lorem ipsum no has veniam elaboraret constituam, ne nibh posidonium vel. Has ad quaeque omittantur, malis abhorreant eam no, qui cu minim placerat definitionem. Et sonet ludus apeirian mei, ut tibique corpora posidonium vis, iusto nominavi prodesset in pro. Ad mea omnes aliquando, idque democritum incorrupte at sed, nostrud feugiat consetetur duo in. Aeque reformidans ex quo, facilisis appellantur ea mei. Illud scaevola pertinacia mel ad, est ex tractatos aliquando, cibo eloquentiam ea per.<br />
#       <br />
#       Cibo quas assum mel an, mel partiendo adipiscing quaerendum ne, dictas iisque ad usu. Invenire delicata sit at, ad est mollis civibus corrumpit. Ne has delenit eligendi splendide, harum numquam epicuri quo ea, sed verear aliquando consequuntur eu. Ad mea mucius expetenda liberavisse, mei ea assentior dissentiunt, delectus antiopam disputando vel ad. Ad pro erat quaeque suscipiantur, vis alia pertinacia at, ei duo zzril tibique necessitatibus. Tritani reprehendunt et vel, et habeo viderer eruditi eos, ornatus pertinax periculis mel ea.<br />
#       <br />
#       Ei brute deserunt delicata nam, mundi moderatius ex quo. Id per modo molestie lobortis, perfecto corrumpit omittantur nec an. Albucius intellegam scripserit et cum, no mei porro tantas menandri. Nam detraxit disputando efficiantur cu, nisl petentium repudiandae eum ut. Pri reque scripta admodum te, rebum legere inimicus et has, ne qui amet meis commodo.<br />
#       </p>",
#       :created_at => Time.now
#     )
# end