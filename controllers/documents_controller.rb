# INDEX
get '/documents' do
  @documents = Document.order(:title)
  erb :'documents/index'
end