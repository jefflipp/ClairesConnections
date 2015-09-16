class SessionsController < ApplicationController
	def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id.to_s
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
  	session.delete(:user_id)
    redirect_to login_path
  end

  def home
    if current_user
      @event  = current_user.events.build
      @feed_items = current_user.feed
    end
  end
 
end
