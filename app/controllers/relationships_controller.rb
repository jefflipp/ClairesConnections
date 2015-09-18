class RelationshipsController < ApplicationController

	  def create
	  	user = User.find(params[:followed_id])
    	current_user.follow(user)
    	redirect_to user
    	
	  end

	  def destroy
	  	user = Relationship.find(params[:id]).followed
	  	Relationship.find(params[:id]).delete
	    redirect_to user
		end


end
