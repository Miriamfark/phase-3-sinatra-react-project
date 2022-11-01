class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/tasks' do
    tasks = Task.all
    tasks.to_json
  end

  get '/tasks/:id' do
    task = Task.find(params[:id])
    task.to_json
  end

  post '/tasks' do
    category = Category.find(params[:category_id])

    new_task = category.tasks.build(name:params[:name], minutes:params[:minutes])
    if new_task.save
        new_task.to_json
    else
        { errors: new_task.errors.full_messages }.to_json
    end
  end

  patch '/tasks/:id' do
    task = Task.find(params[:id])
    task.update(day_id:params[:day_id])
    task.to_json
  end

  delete '/tasks/:id' do
    task = Task.find(params[:id])
    task.destroy
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

get '/categories' do
  categories = Category.all
  categories.to_json(include: :tasks)
end

get '/categories/:id' do
  category = Category.find(params[:id])
  category.to_json(include: :tasks)
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

end
