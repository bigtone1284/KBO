# ===============
#     Authors
# ===============

# INDEX
get '/authors' do
  @authors = Author.order(:surname)
  erb :'authors/index'
end

# NEW author
get '/authors/new' do
  erb :'/authors/new'
end

#Show Author Page
get '/authors/:id' do
  @author = Author.find(params[:id])
  erb :'authors/show'
end

# CREATE
post '/authors' do
  author = Author.create(params[:author])
  redirect("/authors/#{author.id}") 
end

# EDIT
get '/authors/:id/edit' do
  @author = Author.find(params[:id])
  erb :'authors/edit'
end

# UPDATE
put '/authors/:id' do
  author = Author.find(params[:id])
  author.update(params[:author])
  redirect("/authors/#{author.id}")
end

# DESTROY
delete '/authors/:id' do
  author = Author.find(params[:id])
  author.destroy
  redirect('/authors')
end

