require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/blog.db")

require_relative 'blogpost'

DataMapper.auto_upgrade!
DataMapper.finalize