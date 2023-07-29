class PostsController < ApplicationController
  add load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @pagination = @posts.size > 2
    return unless @pagination

    @page = params[:page]&.to_i || 1
    @total_pages = (@posts.size + 1) / 2
    @posts = @posts.each_slice(2).to_a[@page - 1]
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

    respond_to do |f|
      if @post.save
        f.html { redirect_to user_posts_path }
      else
        f.html { render :new }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    respond_to do |f|
      f.html { redirect_to user_posts_path(current_user), notice: 'The Post has been destroyed successfully' }
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
