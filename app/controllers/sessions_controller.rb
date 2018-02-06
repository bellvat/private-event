class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])

    if !@user.nil?
      log_in(@user)
      flash[:success] = "Login successful"
      redirect_to user_path(session[:current_user_id])
    else
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to new_user_path
  end

end
