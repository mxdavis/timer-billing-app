class Api::V1::ClientsController < ApplicationController
  #  #before authenticate if current user == User.find_by(id: params[:user_id])
  def index
    user = User.find_by(id: params[:user_id])
    render json: user.clients.to_json(include: [ :projects])
  end
end