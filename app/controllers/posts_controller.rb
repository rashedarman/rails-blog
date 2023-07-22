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

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0

    respond_to do |f|
      if @post.save
        f.html { redirect_to user_posts_path }
      else
        f.html { render :new }
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
