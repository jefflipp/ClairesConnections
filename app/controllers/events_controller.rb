class EventsController < ApplicationController

	def index
    @events = Event.where user_id: current_user.id
  end

  def show
  	@event = Event.find(params[:id]) 
  end

  def new
    @event = Event.new
    @users = User.all
  end

  def create
    @event = Event.new({
      title: event_params[:title],
      description: event_params[:description],
      date: event_params[:date],
      start_time: event_params[:start_time],
      end_time: event_params[:end_time],
      location: event_params[:location],
      for_ages: event_params[:for_ages],
      event_id: event_params[:event_id],
      user_id: current_user.id

    })

    @comment = @event.comments.new(comment_params)
    @comment.user_id = @user
        
    if @event.save
      redirect_to users_path
      
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
	    params.require(:event).permit(:title, :description, :date, :start_time, :end_time, :location, :for_ages)
	end

  def comment_params
      params.require(:comment).permit(:title, :body)
  end
end
