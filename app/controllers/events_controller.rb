class EventsController < ApplicationController
    def index
        @events = Event.all
        render json: @events, include: "**"
    end

    def create
        @event = Event.create(event_params)

        if @event.valid?
            render json: @event
        else
            render json: {errors: @event.errors.full_messages}, status: 401
        end
    end

    private 

    def event_params

       params.permit(:name, :description, :date, :start_time, :user_id, :location, :image, :category) 
    end
end
