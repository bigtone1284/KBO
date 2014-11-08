class Version < ActiveRecord::Base
	belongs_to :author
	belongs_to :document
	has_many :comments, dependent: :destroy
end