# require 'pry'
require 'byebug'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
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

  get '/tasks/:id' do
    task = Task.find(params[:id])
    task.to_json
  end

  patch '/tasks/:id' do
    task = Task.find(params[:id])
    task.update(day_id:params[:day_id])
    task.to_json
  end

get '/days' do
  days = Day.all
  days.to_json
end

get '/days/:id' do
  day = Day.find(params[:id])
  day.to_json(include: :tasks)
end

get '/days/today/:id' do
  day = Day.find(params[:id])
  todays_tasks = day.tasks
  todays_tasks.to_json
end

get '/categories' do
  categories = Category.all
  categories.to_json
end

post '/categories' do
  new_category = Category.new(name: params[:name])
  categories = Category.all
  if new_category.save
      new_category.to_json
      
  else
      { errors: new_category.errors.full_messages }.to_json
end
end

delete '/categories/:id' do
  category = Category.find(params[:id])
  category.destroy
  category.to_json
end

end
