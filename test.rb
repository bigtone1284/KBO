require 'pry'
require 'active_record'
require_relative 'models/version.rb'
require 'diffy'

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'kbo_db',
	host: 'localhost'
})

binding.pry