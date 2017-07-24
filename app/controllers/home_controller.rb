class HomeController < ApplicationController

  def home
    render json: {message: "You are home"}
  end
  
end