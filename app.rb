require_relative "./cells/home_page/home_page_cell"

require_relative "./models/note"
require_relative "./cells/note/note_index_cell"
require_relative "./cells/note/note_new_cell"
require_relative "./cells/note/note_edit_cell"
require_relative "./cells/note/note_delete_cell"

require_relative "./cells/layout/html_layout_cell"

require 'sinatra'

get '/' do
  HomePageCell.new(nil, layout: HtmlLayoutCell).call
end

# NOTES
get '/notes' do
  model = Note.all
  NoteIndexCell.new(model, layout: HtmlLayoutCell).call
end

get '/notes/new' do
  model = {data: ""}
  NoteNewCell.new(model, layout: HtmlLayoutCell).call
end

post '/notes/create' do
  Note.create(title: params[:note][:title], body: params[:note][:body])
  redirect to('/notes'), 303
end

get '/notes/edit/:id' do
  model = Note.find(params["id"])
  NoteEditCell.new(model, layout: HtmlLayoutCell).call
end

post '/notes/update/:id' do
  Note.find(params["id"]).update_attributes(title: params[:note][:title], body: params[:note][:body])
  redirect to('/notes'), 303
end

get '/notes/delete/:id' do
  model = Note.find(params["id"])
  NoteDeleteCell.new(model, layout: HtmlLayoutCell).call
end

post '/notes/destroy/:id' do
  Note.find(params["id"]).destroy
  redirect to('/notes'), 303
end
