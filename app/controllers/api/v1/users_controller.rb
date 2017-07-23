class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json:{
        user: user
        # token: user.auth?
        # http://instruction.learn.co/video_lectures/136 first 40 minutes or so from 20 minutes is user auth
      }, status: 500
    end

    else
      # render edit page with the current values so they can fill in the rest of the required fields
      render json:{
        errors: user.errors
      }, status: 500
    end
      
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :company_name, :bill_rate, :auth_id)
  end

end