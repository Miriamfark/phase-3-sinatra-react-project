require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/tasks' do
    tasks = Task.all
    tasks.to_json
  end

  post '/tasks' do
    new_task = Task.new(name:params[:name], minutes:params[:minutes], category_id:params[:category_id])
    if new_task.save
        new_task.to_json
    else
        { errors: new_task.errors.full_messages }.to_json
    end
  end

  delete '/tasks/:id' do
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end

  patch '/tasks/:id' do
    task = Task.find(params[:id])
    task.update(body_id:params[:body_id])
    task.to_json
  end

get '/days' do
  days = Day.all
  days.to_json
end

get '/days/:id' do
  day = Day.find(params[:id])
  day.to_json
end

post '/days' do
  new_day = Day.new(params[:day])
  if new_day.save
      new_day.to_json
  else
      { errors: new_day.errors.full_messages }.to_json
  end
end

get '/categories' do
  categories = Category.all
  categories.to_json
end

post '/categories/new' do
  new_category = Category.new(params[:name])
  if new_category.save
      new_category.to_json
  else
      { errors: new_category.errors.full_messages }.to_json
end
end

end
