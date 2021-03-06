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
	redirect "/documents/#{document.id}"
end

post '/documents/search' do
	if Document.find_by(title: params[:title])
		doc_id = Document.find_by(title: params[:title]).id
		redirect "/documents/#{doc_id}"
		binding.pry
	else
		redirect "/documents/sorry/#{params[:title]}"
	end
end

get "/documents/sorry/:title" do
	@title = params[:title]
	erb :'documents/no_match'
end

get '/documents/:id' do
	@document = Document.find(params[:id])
	@authors = Author.order(:surname)
	@current_version = @document.versions.order(:created_at).last || Version.new
	@comments = @document.comments.order(created_at: :desc)
	erb :'documents/show'
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

delete '/documents/:id' do
	Document.find(params[:id]).destroy
	redirect "/documents"
end




