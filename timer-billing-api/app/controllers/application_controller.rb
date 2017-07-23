class ApplicationController < ActionController::API
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :can_edit?

  def current_user
    # @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  

  def logged_in?
    !!current_user
  end

  def can_edit?
    # redirect_to request.referer || root_path, alert: "You cannot access this page" unless logged_in? && current_user.id == params[:id].to_i
  end
end
