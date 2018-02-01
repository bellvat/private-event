class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])

    if !@user.nil?
      session[:current_user_id]= @user.id
      flash[:success] = "Login successful"
      redirect_to user_path(session[:current_user_id])
    else
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_user_path
  end

end
