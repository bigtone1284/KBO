class Version < ActiveRecord::Base
	belongs_to :author
	belongs_to :document

	def make_current	
		current = Version.create({
		blurb: self.blurb,
		content: self.content,
		author_id: self.author_id,
		document_id: self.document.id
	})
	end

end