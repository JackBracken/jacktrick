require 'data_mapper'
require 'fileutils'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/db/blog.db")

require_relative 'blogpost'
DataMapper.auto_upgrade!

DataMapper.finalize