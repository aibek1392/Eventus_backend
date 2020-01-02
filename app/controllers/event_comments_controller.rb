class EventCommentsController < ApplicationController
    
    
    def index
       @event_comments = EventComment.all 
       render json: @event_comments , include: "**"
    end

    def create
        @event_comments = EventComment.create(event_comments_params)
        # @event_comments = @event_comments.unique
        if @event_comments.valid?
            render json: @event_comments
        else
            render json: {errors: @event_comments.errors.full_messages}, status: 401
        end
    end

    # def update
    #     @event_comments = FavoriteEvent.find(params[:id])

    #     @event_comments.update(event_comments_params)

    #     render json: @event_comments
    # end

    def destroy
        @event_comments = EventComment.find(params[:id])

        @event_comments.destroy

        render json: @event_comments
    end

    private

    def event_comments_params
        params.permit(:user_id, :event_id, :content)
    end








end
