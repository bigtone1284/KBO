get '/versions/:id' do
	@authors = Author.all
	@documents = Document.all
	@version = Version.find(params[:id])
  erb :'versions/show'
end

get '/versions/:id/:id2/show' do
	@versions = Version.where(author_id: params[:id]).where(document_id: params[:id2]).order(created_at: :desc)
	erb :'versions/author_document_show'
end