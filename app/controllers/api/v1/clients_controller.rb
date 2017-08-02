class Api::V1::ClientsController < ApplicationController
  #  #before authenticate if current user == User.find_by(id: params[:user_id]) 
  #  before all find user
  def index
    user = User.find_by(id: params[:user_id])
    render json: user.clients.to_json(include: [ :projects])
  end

  def create
    user = User.find_by(id: params["user_id"])
    client = Client.new(client_params)
    client.user = user
    if client.save
      render json: { id: client, success: 'ok'}
    else
      render json: { message: "error, #{client.errors.full_messages}"}, status: 412
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :email)
  end
end