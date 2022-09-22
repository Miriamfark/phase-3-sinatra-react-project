# class CategoryController < ApplicationController

#     get '/categories' do
#         categories = Category.all
#         categories.to_json
#     end

#     post '/categories' do
#         new_category = Category.new(params[:category])
#         if new_category.save
#             new_category.to_json
#         else
#             { errors: new_category.errors.full_messages }.to_json
#     end
# end

# end