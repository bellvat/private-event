class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_current_user
    @current_user = User.find_by_id(session[:current_user_id])
  end

  def logged_in(user)
    user.id = session[:current_user_id]
  end
end
