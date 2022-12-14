class CommentsController < ApplicationController
  before_action :require_signin
  
  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to post_path(@post), notice: "comment successfully created!"
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), status: :see_other
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
