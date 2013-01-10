source 'http://rubygems.org/'
gem "sinatra", "1.3.3"
gem "haml", "3.1.7"
gem "data_mapper", "1.2.0"
gem "nokogiri"
gem "redcarpet"

group :production do
  gem 'pg'
  gem 'dm-postgres-adapter'
end
group :development, :test do
  gem 'sqlite3'
  gem "dm-sqlite-adapter"
end