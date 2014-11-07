class Author < ActiveRecord::Base
	has_many :versions, dependent: :destroy
	has_many :documents, through: :versions
end