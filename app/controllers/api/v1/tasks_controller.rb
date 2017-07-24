class Api::V1::TasksController < ApplicationController
  
  def billed
    # need api here that includes has tasks including the project and client name
    # user = User.find_by(id: params[:user_id])
    # json.array!(@users) do |user|
    # json.name user.name

    # json.reservations do
    #     json.array!(user.reservations) do |reservation|
    #         json.restaurant reservation.restaurant.name
    #         json.reservation_time reservation.time
    #         json.name user.name
    #     end
    # end
# end
  end

  def unbilled
  end

  def create
    binding.pry
  end
end