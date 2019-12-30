class FavoriteEventsController < ApplicationController
    
        def index
            @favorite_event = FavoriteEvent.all
            render json: @favorite_event, include: "**"
        end


        def create
            @favorite_event = FavoriteEvent.create(favorite_event_params)
            # @favorite_event = @favorite_event.unique
            if @favorite_event.valid?
                render json: @favorite_event
            else
                render json: {errors: @favorite_event.errors.full_messages}, status: 401
            end
        end

        # def update
        #     @favorite_event = FavoriteEvent.find(params[:id])
    
        #     @favorite_event.update(favorite_event_params)
    
        #     render json: @favorite_event
        # end
    
        def destroy
            @favorite_event = FavoriteEvent.find(params[:id])
    
            @favorite_event.destroy
    
            render json: @favorite_event
        end

        private

        def favorite_event_params
            params.permit(:user_id, :event_id)
        end
   
end
