get '/versions/diffs' do
	@version1 = Version.find(params[:version_1])
	@version2 = Version.find(params[:version_2])
	@author1 = Author.find(@version1.author_id)
	@author2 = Author.find(@version2.author_id)
	@document1 = Document.find(@version1.document_id)
	@document2 = Document.find(@version2.document_id)
	erb :'versions/diff_versions'
end

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

get '/versions/:document_id/show_versions' do
	# @versions = Version.where(document_id: params[:id])
	@document = Document.find(params[:document_id])
	@versions = @document.versions.order(created_at: :desc)
	erb :'versions/show_versions'
end

post '/versions/:id/make_current' do
	current = Version.find(params[:id]).make_current
	redirect "/versions/#{current.document_id}/show_versions"
end

get '/versions/:id/compare_versions' do
	@document = Document.find(params[:id])
	@versions = @document.versions.order(created_at: :desc)
	erb :'versions/compare_versions'
end