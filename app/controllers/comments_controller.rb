class CommentsController < ApplicationController

	def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @event = event.find(params[:event_id])
    @comment = @event.comments.new(comment_params)
    
    
    

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
