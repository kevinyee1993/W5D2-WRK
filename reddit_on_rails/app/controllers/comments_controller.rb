class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.parent_comment_id = params[:comment_id]
    @comment.post_id = params[:post_id] || Comment.find(@comment.parent_comment_id).post_id

    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def new
    @comment = Comment.new
    render :new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
