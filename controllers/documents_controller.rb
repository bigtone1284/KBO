# INDEX
get '/documents' do
  @documents = Document.order(:title)
  erb :'documents/index'
end

#New documents
get '/documents/new' do
	@authors = Author.order(:surname)
	erb :'documents/new'
end

post  '/documents' do
	document = Document.create(params[:document])
	version = Version.create({
		blurb: params[:blurb],
		content: params[:content],
		author_id: params[:author_id],
		document_id: document.id
	})
	redirect "/versions/#{version.id}"
end

#Show all versions of a document

get '/documents/:id/show_versions' do
	# @versions = Version.where(document_id: params[:id])
	@document = Document.find(params[:id])
	@versions = @document.versions.order(created_at: :desc)
	erb :'documents/show_versions'
end

get '/documents/:id/edit' do
	@authors = Author.order(:surname)
	@document = Document.find(params[:id])
	@current_version = @document.versions.order(:created_at).last || Version.new
	erb :'documents/edit'
end

post '/documents/edit_version' do
	version = Version.create({
		blurb: params[:blurb],
		content: params[:content],
		author_id: params[:author_id],
		document_id: params[:document_id]
		})
	redirect "/versions/#{version.id}"
end


