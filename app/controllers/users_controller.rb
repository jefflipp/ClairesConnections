class UsersController < ApplicationController
  before_action :current_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers(page: params[:page])
    render 'show_follow'
  end

	def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @event = @user.events
    
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



  private

	  def user_params
	    params.require(:user).permit(:first_name, :last_name, :user_name, :bio, :pic, :email, :password, :password_confirmation)
	  end
end


