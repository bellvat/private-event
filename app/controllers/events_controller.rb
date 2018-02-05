class EventsController < ApplicationController
before_action :set_current_user
before_action :validate_sign_in, only: [:new, :create,:join]
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
    #.all makes it an array vs an association object?
    @event_attendees = @event.attendees.all

  end

  def join
    @event = Event.find_by_id(params[:id])
    @current_user.attended_events << @event
    flash[:notice] = "Successfully joined event!"
    redirect_to user_path(@current_user)
  end

  private

  def event_params
    params.require(:events).permit(:location, :e_date)
  end

  def validate_sign_in
    if @current_user.nil?
      flash[:notice] = "Please sign in before creating an event!"
      redirect_to new_session_path
    end
  end
end
