class EventsController < ApplicationController
    
    def index
        @events = Event.all
        render json: @events, include: "**"
    end

    def show
		@event = Event.find(params[:id])
		render json: @event, include: "**"
	end

    def create
        @event = Event.create(event_params)

        if @event.valid?
            ActionCable.server.broadcast('events_channel', EventSerializer.new(event))
        else
            render json: {errors: @event.errors.full_messages}, status: 401
        end
    end

    private 

    def event_params
       params.permit(:name, :url, :description, :date, :start_time, :user_id, :location, :image, :city, :category, :zip_code) 
    end
end
