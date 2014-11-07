require 'sinatra'
require 'sinatra_reloader'
require 'active_record'
require 'better_errors'

require_relative 'models/author.rb'
require_relative 'models/document.rb'
require_relative 'models/version.rb'
require_relative 'models/comment.rb'

require_relative 'controllers/home_controller.rb'
require_relative 'controllers/authors_controller.rb'
require_relative 'controllers/documents_controller.rb'
require_relative 'controllers/versions_controller.rb'
require_relative 'controllers/comments_controller.rb'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'kbo_db',
	host: 'localhost'
})

after { ActiveRecord::Base.connection.close }