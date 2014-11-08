post '/comments' do
	comment = Comment.create({
		document_id: params[:document_id],
		commentary: params[:commentary],
		author_id: params[:author_id]
		})
	redirect "/comments/#{comment.document_id}"
end

get '/comments/:id' do 
	@document = Document.find(params[:id])
	@comments = @document.comments
	@authors = Author.all
	erb :'comments/show'
end