require 'data_mapper'
require 'fileutils'

db_dir = "#{Dir.pwd}/db"

FileUtils.mkdir_p db_dir
FileUtils.touch("#{db_dir}/blog.db") unless File.exists?("#{db_dir}/blog.db") 

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/db/blog.db")

require_relative 'blogpost'
DataMapper.auto_upgrade!

DataMapper.finalize