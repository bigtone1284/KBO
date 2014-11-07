get '/versions/:id' do
	@authors = Author.all
	@documents = Document.all
	@version = Version.find(params[:id])
  erb :'versions/show'
end