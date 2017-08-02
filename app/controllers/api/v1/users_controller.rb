class Api::V1::UsersController < ApplicationController

  def show
    
    user = User.find_by(id: params[:user_id])
    render json: user
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: { id: user, success: 'ok'}
    else
      render json: { message: "error, #{user.errors.full_messages}"}, status: 412
    end
  end

  def sign_in
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :company_name, :bill_rate)
  end

end