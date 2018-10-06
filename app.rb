require_relative "./cells/home_page/home_page_cell"

require_relative "./models/record"
require_relative "./cells/task/task_index_cell"
require_relative "./cells/task/task_new_cell"
require_relative "./cells/task/task_delete_cell"

require_relative "./models/note"
require_relative "./cells/note/note_index_cell"
require_relative "./cells/note/note_new_cell"
require_relative "./cells/note/note_edit_cell"
require_relative "./cells/note/note_delete_cell"

require_relative "./cells/layout/html_layout_cell"
#require 'securerandom'
require 'sinatra'

get '/' do
  HomePageCell.new(nil, layout: HtmlLayoutCell).call
end

get '/tasks' do
  model = Record::All.new("tasks").call
  TaskIndexCell.new(model, layout: HtmlLayoutCell).call
end

get '/tasks/new' do
  model = {data: ""}
  TaskNewCell.new(model, layout: HtmlLayoutCell).call
end

post '/tasks' do
  Record::Save.new("tasks").call(SecureRandom.uuid, params[:task][:data])
  redirect to('/tasks'), 303
end

get '/tasks/delete/:id' do
  model = Record::Load.new("tasks").call(params["id"])
  TaskDeleteCell.new(model, layout: HtmlLayoutCell).call
end

post '/tasks/delete/:id' do
  Record::Delete.new("tasks").call(params["id"])
  redirect to('/tasks'), 303
end

delete '/tasks/:id' do
  Record::Delete.new("tasks").call(params["id"])
  redirect to('/tasks'), 303
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
