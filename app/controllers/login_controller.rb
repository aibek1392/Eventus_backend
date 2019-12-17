class LoginController < ApplicationController

    def create
      user = User.find_by("lower(username) = ?", params[:username].downcase)
      if user && user.authenticate(params[:password])
        render json: { token: token(user.id), user_id: user.id}
      else
        render json: { errors: [ "Error: Invalid Username or Password" ] }, status: :unprocessable_entity
      end
    end
  
  end
  

  