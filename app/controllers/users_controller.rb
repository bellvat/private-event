class UsersController < ApplicationController
before_action :correct_user?, only:[:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      logged_in(@user)
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    set_current_user
    @user_events = @user.events

  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def correct_user?
    user = User.find_by_id(session[:current_user_id])
    logged_in(user)
  end

end
