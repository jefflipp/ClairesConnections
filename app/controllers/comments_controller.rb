class CommentsController < ApplicationController

	def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
    @event = Event.find(params[:event_id]) 
  end

  def edit
  end

  def create
    @user = current_user.id
    @event = Event.find(params[:event_id])
    @comment = @event.comments.new(comment_params)
    @comment.user_id = @user

    if @comment.save
      redirect_to users_path
      
    else
      render :new
    end
  end

  private

  def comment_params
      params.require(:comment).permit(:title, :body)
  end


end
