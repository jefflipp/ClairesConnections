class EventusersController < ApplicationController


  def create
    
    @user = current_user
    @event = Event.find(params[:event_id])
    @eventuser = Eventuser.new(user_id: @user.id, event_id: @event.id)
   
    if @eventuser.save
      @user.events << @event
      redirect_to root_path
    else
      render :new
    end
  end

  private

end
