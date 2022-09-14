class DayController < ApplicationController

    get '/days' do
        days = Day.all
        days.to_json
    end

    post '/days' do
        new_day = Day.new(params[:day])
        if new_day.save
            new_day.to_json
        else
            { errors: new_day.errors.full_messages }.to_json
    end
end

end