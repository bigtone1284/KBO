post '/comments' do
	binding.pry
	comment = Comment.create({
		document_id: params[:document_id],
		commentary: params[:commentary],
		author_id: params[:author_id]
		})
	redirect "/documents/#{comment.document_id}"
end