# class TaskController < ApplicationController

#     get '/tasks' do
#         tasks = Task.all
#         tasks.to_json
#     end

#     post '/tasks' do
#         new_task = Task.new(params[:task])
#         if new_task.save
#             new_task.to_json
#         else
#             { errors: new_task.errors.full_messages }.to_json
#     end
# end

# end