class UsersController < ApplicationController

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

	  def set_user
	      @user = User.find(params[:id])
	    end

	  def user_params
	    params.require(:user).permit(:first_name, :last_name, :user_name, :bio, :pic, :email, :password, :password_confirmation)
	  end
end


