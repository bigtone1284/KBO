class Document < ActiveRecord::Base
	has_many :versions
	has_many :authors, through: :versions
	has_many :comments, through: :versions
end