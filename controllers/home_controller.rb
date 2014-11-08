# ===============
#      Home
# ===============

get '/' do
	@authors = Author.order(updated_at: :desc).limit(5)
	@documents = Document.order(updated_at: :desc).limit(5)
	@versions = Version.order(updated_at: :desc).limit(5)
	@comments = Comment.order(updated_at: :desc).limit(5)
	erb :'home/home'
end