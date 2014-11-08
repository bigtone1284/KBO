class Author < ActiveRecord::Base
	has_many :versions, dependent: :destroy
	has_many :documents, through: :versions
	has_many :comments

	def whole_name
		given_name + " " + surname
	end

end