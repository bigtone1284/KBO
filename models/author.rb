class Author < ActiveRecord::Base
	has_many :versions, dependent: :destroy
	has_many :documents, through: :versions

	def whole_name
		given_name + " " + surname
	end

end