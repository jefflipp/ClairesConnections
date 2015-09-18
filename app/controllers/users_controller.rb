class UsersController < ApplicationController


  before_action :current_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

	def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @user_events = @user.events
    @feed = feed
    @owned_events = Event.where(user_id: @user.id)
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	session[:user_id] = @user.id.to_s
      redirect_to users_path
      
    else
      render :new
    end
  end

  def edit
  	@user = User.find(params[:id])
  end
  
  def destroy
	  @user = User.find(params[:id])
	  @user.destroy
	  redirect_to users_path
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)	
	    redirect_to users_path
	  else
	    render :edit
	  end
	end
  def feed
    @event  = current_user.events.build
    @feed_items = current_user.feed
  end
  

  private

	  def user_params
	    params.require(:user).permit(:first_name, :last_name, :user_name, :bio, :image, :email, :password, :password_confirmation)
	  end
    
end


