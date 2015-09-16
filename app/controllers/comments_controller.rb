class CommentsController < ApplicationController

	def index
    @comments = Comment.all
  end

  def show
    @event = Event.find(params[:event_id]) 
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
      redirect_to event_comments_path
      flash[:success] = "Your post has been sent"
      
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(event_params) 
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to events_path
  end

  private

  def comment_params
      params.require(:comment).permit(:title, :body)
  end

  def event_params
      params.require(:event).permit(:title, :description, :date, :start_time, :end_time, :location, :for_ages,)
  end


end
