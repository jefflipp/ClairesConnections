class CommentsController < ApplicationController

	def index
    @comments = Comment.all
  end

  def show
  	@comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.event_id = Commend.find(params[:event_id])

    if @comment.save
      redirect_to users_path
      
    else
      render :new
    end
  end


end
