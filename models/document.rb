class Document < ActiveRecord::Base
	has_many :versions, dependent: :destroy
	has_many :authors, through: :versions
	has_many :comments, dependent: :destroy
end