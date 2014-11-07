require 'active_record'
ActiveRecord::Base.establish_connection({
	database: 'kbo_db',
	adapter: 'postgresql'
})

# models
require_relative '../models/author.rb'
require_relative '../models/document.rb'
require_relative '../models/version.rb'
require_relative '../models/comment.rb'

# data
require_relative './author_data.rb'
require_relative './document_data.rb'

author_data = get_song_data()
document_data = get_artist_data()