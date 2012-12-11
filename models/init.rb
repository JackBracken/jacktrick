require 'data_mapper'
require 'dm-mysql-adapter'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, ENV['DATABASE_URL'] || "mysql://localhost/jacktric_site")
require_relative 'blogpost'
DataMapper.auto_upgrade!
DataMapper.finalize