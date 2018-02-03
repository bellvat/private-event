class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_current_user
    @current_user = User.find_by_id(session[:current_user_id])
  end

  def log_in(user)
    session[:current_user_id] = user.id
  end

  def signed_in(user)
    set_current_user
    user.id == @current_user.id
  end
end
