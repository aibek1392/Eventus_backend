class UsersController < ApplicationController

        def index
            @users = User.all
            render json: @users, include: "**"
        end
    
      def show
            user_id = params[:id]
            # if current_user_id == user_id.to_i
            user = User.find(user_id)
            # render json: user
            # else
            # render json: { go_away: true }, status: :unauthorized
            # end
            render json: user, include: :favorite_events
      end

      def update
        user = User.find(params[:id])
        user.update(user_params)
           if user.valid?
            render json: user
        else
            render json: {
                errors: user.errors.full_messages
            }
        end
      end

      def profile
        if current_user
            render json: current_user
        else
            render json: {error: 'There is no user found'}
        end
      end
      

      def create
        user = User.create(user_params)
        if user.valid?
          render json: { token: token(user.id), user_id: user.id , username: user.username }
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      private
    
      def user_params
        params.permit(:username, :password, :image, :location)
      end
    
    end
    


