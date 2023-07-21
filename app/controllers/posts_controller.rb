class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
  end

  def show
    @user_id = params[:user_id]
    @id = params[:id]

    @user = User.find(@user_id)
    @post = Post.find(@id)
  end
end
