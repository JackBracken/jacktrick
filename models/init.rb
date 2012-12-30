require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, 'sqlite:///db/blog.db')

require_relative 'blogpost'
DataMapper.auto_upgrade!
# DataMapper.auto_migrate! # deletes contents of database - only for testing, never production

DataMapper.finalize