class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = @user.posts.find(params[:post_id])
    respond_to do |f|
      if @comment.save
        f.html { redirect_to user_post_path(@user, @post) }
      else
        f.html { render :new }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
