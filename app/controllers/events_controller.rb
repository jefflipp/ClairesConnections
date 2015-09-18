class EventsController < ApplicationController

	def index
    @events = Event.all
  end

  def show
  	@event = Event.find(params[:id]) 
    @user = User.find_by_id(@event.user_id)

  end

  def new
    @event = Event.new
  end

  def create
    
    @event = Event.new(event_params)
    
   
    if @event.save
      current_user.events<<@event
     
      redirect_to user_path(current_user)
      
    else
      render :new
    end
  end

	def edit
	  @event = Event.find(params[:id])
	end

  def update
		@event = Event.find(params[:id])

		if @event.update_attributes(event_params)	
	    redirect_to user_path
	  else
	    render :edit
	  end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

private

	def event_params
	    params.require(:event).permit(:title, :description, :date, :start_time, :end_time, :location, :for_ages, :event_id, :user_id)
	end

  def comment_params
      params.require(:comment).permit(:title, :body)
  end
end
