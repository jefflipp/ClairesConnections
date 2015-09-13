class EventsController < ApplicationController

	def index
    @events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to users_path
      
    else
      render :new
    end
  end

private

	def event_params
	    params.require(:event).permit(:title, :description, :date, :start_time, :end_time, :location, :for_ages, :password_confirmation)
	  end
end
