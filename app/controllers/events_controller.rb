class EventsController < ApplicationController
before_action :validate_sign_in, only: [:new, :create]
  def index
    @events = Event.all
  end

  def new
    @event = @current_user.events
  end

  def create
    @event = @current_user.events.create(event_params)
    if @event.save
      flash[:notice] = "Successfully created event"
      redirect_to events_path
    else
      render :new
    end
  end


  def show
    @event = Event.find_by_id(params[:id])
  end

  private

  def event_params
    params.require(:events).permit(:location, :e_date)
  end

  def validate_sign_in
    set_current_user
    if @current_user.nil?
      flash[:notice] = "Please sign in before creating an event!"
      redirect_to new_session_path
    end
  end
end
