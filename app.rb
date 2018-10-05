require 'sinatra'
require_relative "./models/record"
require_relative "./cells/task/task_index_cell"
require_relative "./cells/task/task_new_cell"
require_relative "./cells/task/task_delete_cell"
require_relative "./cells/layout/html_layout_cell"
require 'securerandom'

get '/' do
  "Home Page"
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
